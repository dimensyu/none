#include "kernel.h"
#include <sys/inter.h>
#include <none/scntl.h>
#define PNAME   "Builtin"
#define PNLEN   sizeof(PNAME)

extern int cons_main();
extern int clock_main();
extern int ramdisk_main();
extern int rootfs_main();
extern int at_main();
static int system_shell();

static int system_shell(void)
{
    memcpy(self()->name,"shell",6);
    clear_methon();
    run(SYSTEM_PID,1,PRI_USER,0,0);
    return exec("/bin/v6sh",1,(char *[]){"v6sh"});
}

static void system_dup2(object_t caller,long r1,long r2)
{
    Object *obj = toObject(caller);
    if(obj->r1 < NR_FRIEND) {
        obj->friend[r1] = r2;
        ret(caller,OK);
    }
    ret(caller,-ENOSYS);
}

static void system_pri(object_t caller,long r1) 
{
    Task *task = TASK(caller);
    task->pri = r1;
    ret(caller,OK);
}

static void system_private(object_t caller) 
{
    ret(caller,objectById(caller)->private_data);
}

static void system_regirq(object_t caller,long irq)
{
    ret(caller, put_irq_handler(caller,irq));
}

static void system_getpid(object_t caller)
{
    ret(caller,caller);
}

static void system_irq(object_t caller,long irq)
{
    err("SYSTEM","Unhandle %d irq.\n",irq);
}

static void system_init(void)
{
    hook(SIF_DUP2,system_dup2);
    hook(SIF_PRIVATE,system_private);
    hook(SIF_REGIRQ,system_regirq);
    hook(SIF_INTR,system_irq);
    hook(SIF_GETPID,system_getpid);
    hook(1,system_pri);
}

static void builtin_task(void)
{
    cnt_t i = 0;
    id_t id = 0;
    struct {
        String name;
        int (*entry)();
    }tasks[] = {
        {.name = "Conslo",        .entry = cons_main},
        {.name = "Clock",         .entry = clock_main},
        {.name = "Ram Disk",      .entry = ramdisk_main},
        //{.name = "AT Disk",       .entry = at_main},
        {.name = "rootfs",        .entry = rootfs_main},
    };
hel:
    id = fork();
    if(0 == id){
        memcpy(self()->name,tasks[i].name,strlen(tasks[i].name) + 1);
        clear_methon();
        //sys_log("task(%s:%d).\n",self()->name,self()->id);
        tasks[i].entry();
    }else if(id > 0){
        i++;
        if(i < ARRAY_SIZE(tasks))
            goto hel;
    } else {
        printk("Can't fork process %s.\n",tasks[i].name);
        goto hel;
    }
    system_shell();
}

int system_main(void)
{
    id_t id = 0;
    id = fork();
    if(0 < id) {
        system_init();
        workloop();
    } else if(id == 0) {
        memcpy(self()->name,PNAME,PNLEN);
        builtin_task();
    }
    return OK;
}
