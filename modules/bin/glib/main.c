/*********************************************************************************
 * test code
 *********************************************************************************/
#include "graphics.h"
#include "png.h"
#include <stdlib.h>
#include <none/fcntl.h>
#include <none/types.h>
#include <stdio.h>
png_uint_32  x, y;
png_uint_32 width,height;
png_byte color_type;
png_byte bit_depth;

png_structp png_ptr;
png_infop info_ptr;
int number_of_passes;
png_bytep * row_pointers;

extern u8 UTF8toUnicode(char *,int);

static void MainWindow(graphics_t *thiz,char *header,char *foobar){
    thiz->clear();
    thiz->setcolor(thiz,(color_t){.c16m.r = 255,.c16m.g = 255,.c16m.b = 255});
    thiz->text(thiz,thiz->width / 4,2,header);
    thiz->setcolor(thiz,(color_t){.c16m.r = 255,.c16m.g = 155,.c16m.b = 55});
    thiz->rectangle(thiz,2,24,thiz->width - 2,thiz->height - 24);
    thiz->text(thiz,thiz->width / 2,thiz->height - 22,foobar);
}

static void read_handler(png_structp ptr,png_bytep data,png_size_t length)
{
    read((int)ptr->io_ptr,data,length);
}

int main(void){
    graphics_t *g;
    int fd = open("/bin/a.png",O_RDONLY);
    png_structp png_ptr;
    png_infop info_ptr;
    png_uint_32 width,height;
    int bit_depth, color_type, interlace_type;

    png_ptr = png_create_read_struct(PNG_LIBPNG_VER_STRING,
            NULL,NULL,NULL);
    if(png_ptr == NULL) {
        printf("png_create_read_struct\n");
        return -1;
    }
    info_ptr = png_create_info_struct(png_ptr);
    if(info_ptr == NULL) {
        printf("png_create_info_struct\n");
        return -1;
    }

    png_set_read_fn(png_ptr,(png_voidp)fd,read_handler);
    png_set_sig_bytes(png_ptr,0);
    png_read_info(png_ptr, info_ptr);
    png_get_IHDR(png_ptr, info_ptr, &width, &height, &bit_depth,
            &color_type, &interlace_type, NULL, NULL);
    row_pointers = (png_bytep*) malloc(sizeof(png_bytep) * height);
    for (y = 0; y < height; y++)
        row_pointers[y] = (png_byte*) malloc(png_get_rowbytes(png_ptr,info_ptr));

    png_read_image(png_ptr, row_pointers);

    g = newM800x600x888();
    if(g){
        g->enable();
        MainWindow(g,"Welcome to NONE","Press any key to continue...");
        g->setcolor(g,(color_t){.c16m.r = 255,.c16m.g = 155,.c16m.b = 55});
        for (y=0; y<height; y++) {
            png_byte* row = row_pointers[y];
            for (x=0; x<width; x++) {
                png_byte* ptr = &(row[x*4]);
                g->setcolor(g,(color_t){.c16m.r = ptr[0],.c16m.g = ptr[1],.c16m.b = ptr[2]});
                g->pixel(g,x,y);
            }
        }
    }
    return 0;
}
