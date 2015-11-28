#include "vm.h"
#include "../kernel.h"
#include <none/scntl.h>

/*! BUG !*/
#define CMEM   0xC00000   //CONST_MEM

//#define free_page(x) ({ if((x & ~(0x3ff)) == 0x82d000) { printk("%s %d\n",__FILE__,__LINE__); } free_page(x); })

typedef union _pageItem{
    union _pageItem *table;
    struct{
        unsigned long present:1;
        unsigned long write:1;
        unsigned long super:1;
        unsigned long :2;
        unsigned long access:1;
        unsigned long dirty:1;
        unsigned long :2;
        unsigned long avl:3;
    };
    uintptr_t ptr;
}PageItem;

#define clrWrite(x) ((x)->write = 0)
#define isWrite(x) (1 == (x)->write)
#define PTR(x)    ((x) & (~0xfff))
#define isPresent(x)    (1 == (x)->present)
#define clrPresent(x) ((x)->present = 0)
/* copy page memory from f to t (4kb) */
#define copy_page(t,f) \
    __asm__("cld;rep movsl;"::"S"(f),"D"(t),"c"(1024));

static void share_items(PageItem *item){
    foreach(i,0,1024){
        if(item[i].present)
            share_page(item[i].ptr);
    }
}

static PageItem *copy_dir(PageItem *dir){
    PageItem *nitm = NULL;
    nitm = (void *)get_free_page();
    if(!nitm) panic("copy_item failt : memory out!");
    foreach(i,CMEM >> 22,1024){
        clrWrite(dir + i);
        if(dir[i].present){
            share_items((PageItem*)PTR(dir[i].ptr));
            share_page(dir[i].ptr);
        }
        //clrPresent(items + i);
    }
    copy_page(nitm,dir);
    return nitm;
}

#define DIR_INDEX(x) ((x) >> 22)
#define TABLE_INDEX(x)  (((x) >> 12) & 0x3ff)

static inline void put_item(PageItem *items,void *page,int index,int mode){
    (void)mode;
    items[index] = (PageItem)(PTR((uintptr_t)page) | 7);
}


static PageItem *clone_space(PageItem *space,void *page){
    PageItem *nsp = NULL;
    PageItem *ntb = NULL;
    PageItem *tmp = (PageItem *)PTR(space[DIR_INDEX(KERNEL_STACK)].ptr);
    nsp = copy_dir(space);
    ntb = try(NULL == ,get_free_page());
    copy_page(ntb,tmp);//copy_items(tmp,0,0);
    put_item(ntb,page,TABLE_INDEX(KERNEL_STACK),7);
    put_item(nsp,ntb,DIR_INDEX(KERNEL_STACK),7);
    return nsp;
}

static void clone(object_t o){
    Task *ot = TASK(toObject(o));
    Task *nt = TASK(cloneObject(OBJECT(ot)));
    if(!nt){
        ret(o,-ENOMEM);
    }else{
        nt->core = (uintptr_t)clone_space((void *)(ot->core),nt);
        copyvm(OBJECT(ot)->private_data);
        ret(OBJECT(nt)->id,OK);
        ret(o,OBJECT(nt)->id);
    }
}

#if 1
static int delete_table(PageItem *table){
    for(int i = 0;i < 1024;i++){
        if(isPresent(table + i)){
            try(ERROR ==,free_page(table[i].ptr),{
                LOGE("table[%d] = %08x\n",i,table[i].ptr);
                return ERROR;
            });
            //table[i].present = 0;     /*! share table !*/
        }
    }
    return OK;
}
#endif

static void _delete(PageItem *dir){
    foreach(i,CMEM >> 22,1024){
        if(isPresent(dir + i)){
            if((ERROR == delete_table((PageItem *)(PTR(dir[i].ptr)))) || 
                    (ERROR == free_page(dir[i].ptr))){
                LOGE("  dir[%d] = %08x\n",i,dir[i].ptr);
                panic("free page fail");
            }
            dir[i].present = 0; /*! non-share dir !*/
        }
    }
}

static void delete(object_t o){
    Task *t = TASK(toObject(o));
    PageItem *nsp = (PageItem *)t->core;
    _delete(nsp);
    try(ERROR ==,free_page((uintptr_t)(nsp)),{
        panic("free page fail");
    });
    delvm(OBJECT(t)->private_data);
    OBJECT(t)->private_data  = NULL;
    ret(OBJECT(t)->father,o);
    /*! free_page((uintptr_t)t); !*/
}

static int put_page(PageItem *dirs,void *va,void *page){
    PageItem *table = NULL;
    if(!isPresent(dirs + DIR_INDEX((uintptr_t)va))){
        table = get_free_page();
        if(!table) 
            return -ENOMEM;
        put_item(dirs,table,DIR_INDEX((uintptr_t)va),7);
    }
    if(!page) 
        return ERROR;
    table = (void *)(((uintptr_t)dirs[DIR_INDEX((uintptr_t)va)].table) & (~0xfff));
    put_item(table,page,TABLE_INDEX((uintptr_t)va),7);
    return OK;
}

static void np_page(object_t o,void *ptr){
    Task *t = TASK(toObject(o));
    void *page = dovm(OBJECT(t)->private_data,ptr);
    long val = 0;
    if(!page) {
        val = ERROR;
        goto err_out;
    }
    LOGD("page : %p virtual : %p\n",page,ptr);
    val = put_page((PageItem *)t->core,ptr,page);
    if(val < 0)
        goto err_out;
    ret(o,val);
    return;
err_out:
    ret(o,val);
}

static PageItem *_un_table(PageItem *dir,void *va){
    PageItem *table = (void*)(((uintptr_t)dir[DIR_INDEX((uintptr_t)va)].table) & (~0xfff));
    PageItem *new_table = NULL;
    if(!(dir[DIR_INDEX((uintptr_t)va)].present)){
        LOGE("Virtual address %08x not present\n",va);
        return NULL;
    };

    for(int i = 0;i < 1024;i++){
        if(isPresent(table + i)){
            table[i].write = 0;
        }
    }

    if(page_share_nr(dir[DIR_INDEX((uintptr_t)va)].ptr) > 1){
        try(ERROR == ,free_page(dir[DIR_INDEX((uintptr_t)va)].ptr),{
            LOGE("Not release the virtual memory address %08x\n",va);
        });
        new_table = (void*)get_free_page();
        if(!new_table) 
            return NULL;
        copy_page(new_table,table);
        table = new_table;
    }
    return table;
}

static PageItem *_un_page(PageItem *table,void *va){
    PageItem *page = (void*)(((uintptr_t)table[TABLE_INDEX((uintptr_t)va)].table) & (~0xfff));
    PageItem *new_page = NULL;

    if(!(table[TABLE_INDEX((uintptr_t)va)].present)){
        LOGE("Virtual address %08x\n",va);
        return NULL;
    };

    if(page_share_nr(table[TABLE_INDEX((uintptr_t)va)].ptr) > 1){
        try(ERROR == ,free_page(table[TABLE_INDEX((uintptr_t)va)].ptr),{
            LOGE("Not release the virtual memory address %08x\n",va);
        });
        new_page = (void*)get_free_page();
        if(!new_page) return NULL;
        copy_page(new_page,page);
        page = new_page;
    }
    return page;
}

static void nw_page(object_t o,void *ptr){
    Task *t = TASK(toObject(o));
    PageItem *table = _un_table((PageItem *)t->core,ptr);
    long val = 0;
    //LOGD("virtual : %p\n",ptr);
    if(!table) {
        val = ERROR;
        goto err_out;
    }
    put_item((PageItem*)t->core,table,DIR_INDEX((uintptr_t)ptr),7);
    void *page = _un_page(table,ptr);
    if(!page) {
        val = ERROR;
        goto err_out;
    }
    put_item(table,page,TABLE_INDEX((uintptr_t)ptr),7);

    ret(o,OK);
    return;

err_out:
    ret(o,val);
}

static void *__va(PageItem *dirs,void *va){
    PageItem *table = (void*)(((uintptr_t)dirs[DIR_INDEX((uintptr_t)va)].table) & (~0xfff));
    return (void*)((((uintptr_t)table[TABLE_INDEX((uintptr_t)va)].table) & (~0xfff)) + (((uintptr_t) va) & 0xfff));
}

static void mm_execvp(object_t o,object_t file,void *ptr,cnt_t count){
    Task * t = TASK(toObject(o));
    t->registers = (void*)(KERNEL_STACK + 0x1000 - sizeof(Registers));
    Registers *reg = __va((void*)(t->core),t->registers);
    delvm(OBJECT(t)->private_data);
    OBJECT(t)->private_data = try(NULL == ,mkvm(file,ptr,count,reg,OBJECT(t)->name));
    _delete((void*)t->core);
    memset(OBJECT(t)->fns,0,sizeof(Methon) * NR_METHON);
    ret(o,OK);
}

static void _wait(object_t o __attribute__((unused))){
    ;
}

static PageItem *__clone_space__(PageItem *space,void *page){
    PageItem *nsp = (void*)get_free_page();
    PageItem *ntp = (void*)get_free_page();
    PageItem *tmp = (PageItem *)PTR(space[DIR_INDEX(KERNEL_STACK)].ptr);
    if(or(!,nsp,ntp)) 
        panic("memeory very full!-_-|||");
    copy_page(nsp,space);
    for(int i = CMEM >> 22;i < 1024;i++){
        clrPresent(nsp + i);
    }
    copy_page(ntp,tmp);
    put_item(ntp,page,TABLE_INDEX(KERNEL_STACK),7);
    put_item(nsp,ntp,DIR_INDEX(KERNEL_STACK),7);
    return nsp;
}

static void mm_iomap(object_t o,uintptr_t phys_addr __attribute((unused)) ,
        unsigned long size __attribute__((unused)))
{
    LOGT("iomap not implemented\n");
    ret(o,OK);
}

static void mm_iounmap(object_t o)
{
    LOGT("iounmap not implemented\n");
    ret(o,OK);
}

static void mm_dmamap(object_t o,uintptr_t phys_addr,uintptr_t va_addr,
        unsigned long page_nr)
{
    Task *t = TASK(toObject(o));
    phys_addr &= ~(0xfff);
    va_addr &= ~(0xfff);
    for(unsigned i = 0;i < page_nr;i++){
        share_page(phys_addr + (i << 12));
        put_page((PageItem*)t->core,(void*)phys_addr + (i << 12),(void*)va_addr + (i << 12));
    }
    ret(o,OK);
}

static Task* make_task(String name,int (*entry)(void)){
    Task *task;
    //VM *vm;
    task = TASK(cloneObject(self()));
    task->core = (uintptr_t)__clone_space__((void *)(TASK(self())->core),task);
    task->registers = (void*)(KERNEL_STACK + 0x1000 - sizeof(Registers));
    task->pri = PRI_TASK;
    task->count = 20;
    task->ucount = 20;

    strcpy(OBJECT(task)->name,name);
    /*! 之前COPY到KERBEL_STACK,这是不对的,因为还没有切换到那个页去,谨记 !*/
    memcpy(STACK(task)->stackp - sizeof(Registers),&(Registers){
            .gs = KERNEL_DATA,
            .fs = KERNEL_DATA,
            .ds = KERNEL_DATA,
            .es = KERNEL_DATA,
            .edi = 0,
            .esi = 0,
            .ebp = 0,
            .ebx = 0,
            .edx = 0,
            .ecx = 0,
            .eax = 0,
            .eip = (long)(entry),
            .cs = KERNEL_CODE,
            .eflags = 0x200,
            },sizeof(Registers));
    return task;
}

static void _mm_init(void) {
    Task *task;
    LOGD("memory manage init.\n");
    hook(MIF_CLONE,clone);
    hook(MIF_CLOSE,delete);
    hook(MIF_NOPAGE,np_page);
    hook(MIF_WPPAGE,nw_page);
    hook(MIF_EXECVP,mm_execvp);
    hook(MIF_WAIT,_wait);
    hook(MIF_IOMAP,mm_iomap);
    hook(MIF_IOUNMAP,mm_iounmap);
    hook(MIF_DMAMAP,mm_dmamap);
    extern int system_main(void);
    task = make_task("System",system_main);
    OBJECT(task)->wait = self();
    ret(OBJECT(task)->id,OK);
}

int mm_main(void){
    _mm_init();
    workloop();
    return 0;
}
