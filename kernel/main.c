#include "kernel.h"
#include "version.h"

extern void cons_init();
extern int printk(const char *fmt,...);
extern void god_init(void);

int errno = 0;
int main(void){
    cli();
    cons_init();
    printk("Welcome to NONE.\nversion : "KERNEL_VERSION"\n");
    mm_init();
    trap_init();
    god_init();
}
