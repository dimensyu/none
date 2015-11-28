#include "keyboard.h"
#include "keymap.h"
#include <none/if.h>
#include <none/scntl.h>
#include <stdbool.h>
#include <z.h>

#define KB_IN_BYTES 0x32
#define MAXBUFF 0x100
struct{
    int head;
    int tail;
    bool full;
    unsigned char buf[KB_IN_BYTES];
}kb_in;


static char buffer[MAXBUFF];
static cnt_t index = 0;

static object_t _caller = 0;
static cnt_t  _count = 0;
static void     *_buf = NULL;

static void _ispress(object_t caller)
{
    ret(caller,index);
}
static void _input(object_t caller __unused)
{
    //unsigned int ch = pop();
    unsigned char ch = inb(0x60);
    static const unsigned int *str = keymap[0];
    switch(ch){
    case KEY_LEFTSHIFT:
    case KEY_RIGHTSHIFT:
        //printk("KEY SHIFT\n");
        str = keymap[1];
        break;
    case 0x80 + KEY_LEFTSHIFT:
    case 0x80 + KEY_RIGHTSHIFT:
        //printk("KEY UNSHIFT\n");
        str = keymap[0];
        break;
    case KEY_BACKSPACE:
        if(index > 0){
            index--;
            printk("%c",'\b');
        }
        break;
    case KEY_ESC ... KEY_EQUAL:
    case KEY_TAB ... KEY_RIGHTBRACE:
    case KEY_A ... KEY_GRAVE:
    case KEY_BACKSLASH ... KEY_SLASH:
    case KEY_SPACE:
    case KEY_KP7 ... KEY_KPDOT:
        if(index < MAXBUFF - 1){
            buffer[index++] = str[ch];
            printk("%c",buffer[index - 1]);
        }
        break;
    case KEY_ENTER:
        if(index < MAXBUFF - 1){
            buffer[index++] = str[ch];
            printk("%c",buffer[index - 1]);
        }
        if(_caller && index) {
            copy_buffer(_caller,_buf,_count);
        }
        break;
    }
}

void copy_buffer(object_t caller,void *buf,cnt_t len)
{
    int _v = 0;;
    if(0 == index){
        _caller = caller;
        _count = len;
        _buf = buf;
    } else {
        if(len >= index){
            memcpy(buf,buffer,index);
            _v = index;
            index = 0;
        } else {
            _v = len;
            memcpy(buf,buffer,len);
            index -= len;
            memcpy(buffer,buffer + len, index);
        }
        ret(caller,_v);
        _caller = 0;
        _count = 0;
        _buf = NULL;
    }
}

static void _reset(object_t caller)
{
    outb_p(0xfe,0x64);
    ret(caller,OK);
}

static int scan_keyboard(void)
{
    int code;
    int val;

    code = inb(0x60);
    val = inb(0x61);
    outb(val | 0x80,0x61);
    outb(val,0x61);
    return code;
}

void keyboard_init(void)
{
    kb_in.head = kb_in.tail = 0;
    kb_in.full = false;
    scan_keyboard();
    hook(IF_INTR,_input);
    hook(IF_CLOSE,_reset);
    hook(IF_USER1,_ispress);
    regirq(1);
}
