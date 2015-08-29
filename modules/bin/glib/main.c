/*********************************************************************************
 * test code
 *********************************************************************************/
#include "graphics.h"
#include <stdio.h>

extern uint16_t UTF8toUnicode(char *,int);

static void MainWindow(graphics_t *thiz,char *header,char *foobar){
    thiz->clear();
    thiz->setcolor(thiz,(color_t){.c16m.r = 255,.c16m.g = 255,.c16m.b = 255});
    thiz->text(thiz,thiz->width / 4,2,header);
    thiz->setcolor(thiz,(color_t){.c16m.r = 255,.c16m.g = 155,.c16m.b = 55});
    thiz->rectangle(thiz,2,24,thiz->width - 2,thiz->height - 24);
    thiz->text(thiz,thiz->width / 2,thiz->height - 22,foobar);
}

static void Pause(void){
    getchar();
}
int main(void){
#if 1
    graphics_t *g;
    g = newM800x600x888();
    if(g){
        g->enable();
        MainWindow(g,"启动图形模式后报告状态","按下任意键继续...");
        Pause();
    }
#endif
    extern void vbe_biosfn_set_mode(int);
    vbe_biosfn_set_mode(3);
    return 0;
}
