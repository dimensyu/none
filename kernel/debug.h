#ifndef __DEBUG_H__
#define __DEBUG_H__

#define DEBUG
#define TODO

#define xFS_DBG
#define xSYS_DBG
#define xMM_DBG
#define MP_DBG
#define xPRINT_SCHED

#define err(own,fmt,...)    printk("[\er%6s\ew] "fmt,own,##__VA_ARGS__)
#define log(own,fmt,...)    printk("[\eb%6s\ew] "fmt,own,##__VA_ARGS__)

#ifdef DEBUG
#define  dbg(own,fmt,...)   printk("[\eb%6s\ew] "fmt,own,##__VA_ARGS__)
#else
#define dbg(...)
#endif

#ifdef TODO
#define todo(fmt,...)   printk("[\egTODO  \ew] "fmt" %s:%d\ew\n",##__VA_ARGS__,__FILE__,__LINE__)
#else
#define todo(...)
#endif


#endif
