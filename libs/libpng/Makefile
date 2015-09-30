#
#	样板Makefile文件,集体项目根据实际情况进行简单修改即可
#	Author : lzy
.PHONY:all clean

BUILD		:= LIBRARY
c_flags	 	:= -I../zlib/ -DPNG_SETJMP_NOT_SUPPORTED \
	-DPNG_NO_FLOATING_POINT_SUPPORTED -DPNG_NO_WRITE_tIME\
	-DPNG_NO_STDIO

src_files := \
	png.c \
	pngerror.c \
	pnggccrd.c \
	pngget.c \
	pngmem.c \
	pngpread.c \
	pngread.c \
	pngrio.c \
	pngrtran.c \
	pngrutil.c \
	pngset.c \
	pngtrans.c \
	pngvcrd.c \
	pngwio.c \
	pngwrite.c \
	pngwtran.c \
	pngwutil.c

ifeq ("$(root_dir)","")
	$(error Undefined project root directory, you should run the 'source tools/setenv.sh' in the project root directory.)
else
	include $(root_dir)/tools/Makefile.rule
endif
