#ifndef __NONE_VM_H__
#define __NONE_VM_H__
#include <elf.h>
#include <none/list.h>
#include <stddef.h>

#define LOGE(fmt,...)   LOG(LOG_ERR,MM_LOG_TARGET,fmt,##__VA_ARGS__)
#define LOGT(fmt,...)   TODO(MM_LOG_TARGET,fmt,##__VA_ARGS__)

#include "../kernel.h"

#define MM_LOG_TARGET    "mm"
#ifdef  MM_DEBUG
    #define LOGD(fmt,...)   DBG(MM_LOG_TARGET,fmt,##__VA_ARGS__)
#else
    #define LOGD(...)
#endif

typedef struct{
    unsigned long   flags;   /*! 段标志 !*/
    void            *vaddr;  /*! 段虚拟内存开始地址 !*/
    size_t          memsz;   /*! 段占虚拟内存大小 !*/
    size_t          filesz;  /*! 段占文件大小 !*/
    off_t           offset;  /*! 段在文件中的偏移 !*/
    struct list_head list;
}VM;

typedef struct {
    cnt_t   cnt;          /*! 段共享计数 !*/
    object_t  object;       /*! 段关联文件 !*/
    struct list_head list;
}VMHead;

void *mkvm(object_t,void *ptr,cnt_t ,Registers *reg,char *name);
void *dovm(VMHead*,void *vaddr);
void copyvm(VMHead *);
void delvm(VMHead *vm);

#endif
