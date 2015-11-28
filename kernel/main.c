#include "kernel.h"
#include "version.h"

#define LOGI(fmt,...)   LOG(LOG_INFO,"kernel",fmt,##__VA_ARGS__)

extern void cons_init();
extern int printk(const char *fmt,...);
extern void god_init(void);

int errno = 0;
int main(void){
    cli();
    cons_init();
    LOGI("Welcome to NONE.\n");
    LOGI("Version : "KERNEL_VERSION"\n");
    mem_init();
    trap_init();
    god_init();
}
