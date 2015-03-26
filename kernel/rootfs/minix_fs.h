#ifndef __MINIX_FS_H__
#define __MINIX_FS_H__
#include <fs/fs.h>
#include "minix.h"
#include "../kernel.h"
#include <none/stat.h>
#include <stddef.h>
#include <x86/bitops.h>
#include <stdbool.h>

#ifdef FS_DBG
#define fs_dbg(fmt,...) dbg("ROOTFS",fmt,##__VA_ARGS__)
#else
#define fs_dbg(...)
#endif
#define fs_log(fmt,...) log("ROOTFS",fmt,##__VA_ARGS__)

#define mfs_err(fmt,...) err("ROOTFS",fmt,##__VA_ARGS__)
#define pname(name,nlen) ({\
        for(int i = 0;i < nlen && name[i];i ++)\
        printk("%c",name[i]);\
        })

#define minix_set_bit(nr,addr) \
    __set_bit((nr),(unsigned long*)(addr))
#define minix_test_bit(nr,addr) \
    test_bit((nr),(unsigned long *)(addr))
#define minix_test_and_set_bit(nr,addr) \
    __test_and_set_bit((nr),(unsigned long *)(addr))
#define minix_test_and_clear_bit(nr,addr)   \
    __test_and_clear_bit((nr),(unsigned long *)(addr))
#define minix_find_first_zero_bit(addr,size) \
    find_first_zero_bit((unsigned long *)(addr),(size))

#define current_fsuid() 0
struct minix_inode_info {
    unsigned long i_zone[V2_NR_DZONES]; 
    unsigned long indir_zone;
    unsigned long double_indir_zone;
    unsigned long triple_indir_zone;
    void          *i_rawdata;
};

struct minix_sb_info {
    unsigned long s_ninodes;
    unsigned long s_nzones;
    unsigned long s_imap_blocks;
    unsigned long s_zmap_blocks;
    unsigned long s_inosize;
    unsigned long s_dzones;
    unsigned long s_firstdatazone;
    unsigned long s_log_zone_size;
    unsigned long s_max_size;
    unsigned short s_namelen;
    unsigned short s_dirsize;
    unsigned short s_version;
    u8              **s_imap;
    u8              **s_zmap;
};

static inline struct super_block *sbi_sb(struct minix_sb_info *sbi){
    return container_of(sbi,struct super_block,s_fs_info);
}

static inline struct inode *inode_iget(struct minix_inode_info *inode_info){
    return container_of(inode_info,struct inode,i_private);
}

/* blk.c */
int inode_bread (struct inode *inode,void *buff,unsigned long zone);
int inode_bwrite(struct inode *inode,void *buff,unsigned long zone);

/* bitmap.c */
unsigned long minix_new_block(struct inode *inode);
void minix_free_block(struct inode *inode,unsigned long block);
void minix_free_inode(struct inode *inode);

/* inode.c */
unsigned long bmap(struct inode *inode,unsigned long zone,bool create);
struct inode *minix_find_inode(struct super_block *sb,unsigned long ino);
struct super_block *minix_sget(object_t dev,int *error);
struct inode *minix_new_inode(struct inode *dir,mode_t mode,int *error);
void minix_set_inode(struct inode *inode,object_t rdev);
void minix_sync_inode(struct inode *inode);

/* truncate */
void truncate(struct inode *inode);
/* dir.c */
unsigned long minix_inode_by_name(struct inode *dir,
        String name,size_t nlen);

/* namei.c */
object_t mount_open(struct inode *inode,String name,
        umode_t mode);
object_t normal_open(struct inode *inode,String name,
        int flag,umode_t mode);
int      open_namei(struct inode *root,String pathname,
        int flag,umode_t mode,struct inode **res_inode);
int      minix_mkdir(struct inode *root,String pathname,
        umode_t mode);
int      minix_rmdir(struct inode *root,String name);

/* rw.c */
void minix_read(object_t o,void *buffer,cnt_t count);
void minix_write(object_t o,void *buffer,cnt_t count);

#define ZONE_PER_BLOCK(sbi) (sbi->s_version == MINIX_V1 ?\
        (BLOCK_SIZE / sizeof(unsigned short)) :\
        (BLOCK_SIZE / sizeof(unsigned long)))

static inline unsigned long _get(struct minix_sb_info *sbi,
        void *bb,int num) {
    if(sbi->s_version == MINIX_V1)
        return ((unsigned short *)bb)[num];
    return ((unsigned long *)bb)[num];
}

static inline void _set(struct minix_sb_info *sbi,
        void *bb,int num,unsigned long indir) {
    if(sbi->s_version == MINIX_V1)
        ((unsigned short *)bb)[num] = indir;
    else if(sbi->s_version == MINIX_V2)
        ((unsigned long *)bb)[num] = indir;
}


#define DECAL_INODE(x) \
    struct super_block *sb = inode_sb(x);\
    struct minix_sb_info *unused(sbi) = sb_info(sb);\
    struct minix_inode_info *unused(mi) = inode_info(x)

#define DECAL_SB(x) \
    struct super_block *sb = inode_sb(x);\
    struct minix_sb_info *unused(sbi) = sb_info(sb);

#define CURRENT_TIME    ((struct timespace){time(NULL),0})

#endif
