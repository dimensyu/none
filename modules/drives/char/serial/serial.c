#include <posix.h>
#include <stdio.h>
#include <stdlib.h>
#include <none/if.h>
#include <none/fcntl.h>
#include <none/scntl.h>
#include <sys/inter.h>

#define sr_log(fmt,...) printf("[\ebSerial\ew] "fmt,##__VA_ARGS__)

typedef struct _ioInq{
    object_t caller;
    off_t    count;
    off_t    offset;
    char     *buffer;
    struct _ioInq *next;
}IOInq;

static IOInq *inq = NULL;
static IOInq *tail = NULL;

static void sl_init(int port){
    outb_p(0x80,port + 3);
    outb_p(0x30,port);
    outb_p(0x00,port + 1);
    outb_p(0x03,port + 3);
    outb_p(0x0b,port + 4);
    outb_p(0x0d,port + 1);
    (void)inb(port);
}

static void rs_push(IOInq *in){
    if(!inq){
        inq = in;
        tail = inq;
    }
    tail->next = in;
    tail = in;
    tail->next = NULL;
}

static void rs_pop(void){
    IOInq *in;
    if(inq){
        in = inq;
        inq = inq->next;
        free(in);
    }
}


static void rs_write(object_t caller,void *ptr,cnt_t count){
    IOInq *in = malloc(sizeof(IOInq));
    if(in){
        in->caller = caller;
        in->buffer = ptr;
        in->offset = 0;
        in->next = NULL;
        in->count = count;
        rs_push(in);
    }
    outb(inb_p(0x3f8 + 1) | 0x02,0x3f8 + 1);
}

static void _io(object_t caller){
    (void)caller;
    int status;
    if(inq){
        status = inb_p(0x3fa);
        if(!(status & 1)){
            switch(status){
            case 0: inb_p(0x3fe); break;
            case 6: inb_p(0x3fd);break;
            case 4: break;
            case 2: 
again:
                    if(inq){
                        if(inq->offset < inq->count){
                            outb_p(inq->buffer[inq->offset],0x3f8);
                            inq->offset++;
                        }else{
                            ret(inq->caller,OK);
                            rs_pop();
                            goto again;
                        }
                    }else{
                        outb_p(inb_p(0x3f9) & 0xd,0x3f9);
                    }
                    break;
            }
        }
    }
}

static void rs_open(object_t caller)
{
    ret(caller,getpid());
}

static void rs_init(void){
    int fd;
    sl_init(0x3f8);
    hook(IF_WRITE,rs_write);
    hook(IF_INTR,_io);
    hook(IF_OPEN,rs_open);
    regirq(4);
    fd = open("/dev/ttyS0",O_RDONLY);
    run(fd,FIF_MOUNT,getpid(),0,0);
}

int main(void){
    sr_log("serial startup...\n");
    rs_init();
    workloop();
    return 0;
}
