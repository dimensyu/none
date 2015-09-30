#include "kernel.h"
#include "version.h"

extern void cons_init();
extern int printk(const char *fmt,...);
extern void god_init(void);

int errno = 0;
int main(void){
    cli();
    cons_init();
    printk("Welcome to NONE.\nVersion : "KERNEL_VERSION"\n");
    mem_init();
    trap_init();
    god_init();
}
