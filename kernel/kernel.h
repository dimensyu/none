#ifndef __KERNEL_H__
#define __KERNEL_H__

#include "const.h"
#include "task.h"
#include <none/types.h>
#include <sys/inter.h>
#include <x86/io.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include "log.h"

#include <z.h>

extern Task *leading;
#define self()  OBJECT(leading)

extern void sched(void);
extern int doint(object_t obj,unsigned long fn,unsigned long r1,unsigned long r2,unsigned long r3);

#define proc_number(rp) ((rp)->pid)
#define proc_addr(pid)  (task[pid])

#define do_switch() __asm__("int $0x81\n\t\t")

/* */
#define getcr3()    ({  \
        uintptr_t _cr3;   \
        __asm__("movl %%cr3,%0\n\t\t":"=a"(_cr3)); \
        _cr3;   \
        })

#define ldcr3(cr3)  ({\
        __asm__("movl %0,%%cr3\n\t\t"::"a"(cr3));\
        })

#define getcr2()    ({  \
        uintptr_t _cr2;   \
        __asm__("movl %%cr2,%0\n\t\t":"=a"(_cr2)); \
        _cr2;   \
        })

#define SET_ERR(n) ({errno = n;})

static inline  void clear_methon(void) 
{
    for(int i = 0;i < NR_METHON;i++)
        hook(i,NULL);
}
extern void trap_init(void);
extern void mem_init(void);
void print_cpu_info(Registers *reg);
/* */
extern void disable_irq(int irq);
extern void enable_irq(int irq);
extern int  put_irq_handler(object_t o,int irq);

extern void* get_free_page(void);
extern void* get_kfree_page(void);
#define get_free_object get_kfree_page
extern int free_page(uintptr_t);
extern int share_page(uintptr_t);
extern int page_share_nr(uintptr_t page);
extern int printk(const char *fmt,...);
extern void printx(const char *data,cnt_t count);
extern void panic(const char *msg);

extern void *kalloc(unsigned int);
extern void kfree_s(void *,unsigned int);
#define kfree(p)    \
    kfree_s(p,0) 
  //  ({ printk("%s:%d : %p.\n",__FILE__,__LINE__,p);kfree_s(p,0); })
//#define kalloc(n) ({void *_v = kalloc(n);printk("%s:%d [%p:%d]\n",__FILE__,__LINE__,_v,n);_v;})
Object *objectById(object_t id);

#endif
