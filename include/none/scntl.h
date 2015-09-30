#ifndef __NONE_SCNTL_H__
#define __NONE_SCNTL_H__

#include <none/if.h>

/* mm interface */
#define MIF_OPEN    IF_OPEN
#define MIF_CLOSE   IF_CLOSE
#define MIF_CLONE   IF_CLONE
#define MIF_IOMAP   IF_IOMAP
#define MIF_IOUNMAP IF_IOUNMAP
#define MIF_NOPAGE  IF_USER1
#define MIF_WPPAGE  IF_USER2
#define MIF_EXECVP  IF_USER3
#define MIF_WAIT    IF_USER4
#define MIF_DMAMAP  IF_USER5

/* system interface */
#define SIF_PRI     IF_USER1
#define SIF_DUP2    IF_USER2
#define SIF_PRIVATE IF_USER3
#define SIF_REGIRQ  IF_USER4
#define SIF_INTR    IF_INTR
#include <sys/inter.h>

#define self_private()  (void*)run0(SYSTEM_PID,SIF_PRIVATE)
#define regirq(irq)     run1(SYSTEM_PID,SIF_REGIRQ,irq)

#endif
