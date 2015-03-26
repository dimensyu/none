#include "minix_fs.h"

static int __free_indir(struct inode *inode,unsigned long blk) {
    void *bb;
    DECAL_SB(inode);
    unsigned long zone_per_block = ZONE_PER_BLOCK(sbi);
    if(!blk)
        return 1;
    bb = kalloc(sb->s_blocksize);
    if(!bb)
        return 1;
    if(OK == sb_bread(sb,bb,blk)){
        for(unsigned long i = 0;i < zone_per_block;i++){
            unsigned long block = _get(sbi,bb,i);
            if(block)
                minix_free_block(inode,block);
        }
    }
    minix_free_block(inode,blk);
    kfree(bb);
    return 0;
}

static int __free_double_indir(struct inode *inode,unsigned long blk) {
    void *bb;
    DECAL_SB(inode);
    unsigned long zone_per_block = ZONE_PER_BLOCK(sbi);
    if(!blk)
        return 1;
    bb = kalloc(sb->s_blocksize);
    if(!bb)
        return 1;
    if(OK == sb_bread(sb,bb,blk)) {
        for(unsigned long i = 0;i < zone_per_block;i++) {
            unsigned long block = _get(sbi,bb,i);
            if(block)
                __free_indir(inode,block);
        }
    }
    minix_free_block(inode,blk);
    kfree(bb);
    return 0;
}

static int __free_triple_indir(struct inode *inode,unsigned long blk) {
    void *bb;
    DECAL_SB(inode);
    unsigned long zone_per_block = ZONE_PER_BLOCK(sbi);
    if(!blk)
        return 1;
    bb = kalloc(sb->s_blocksize);
    if(!bb)
        return 1;
    if(OK == sb_bread(sb,bb,blk)) {
        for(unsigned long i = 0;i < zone_per_block;i++) {
            unsigned long block = _get(sbi,bb,i);
            if(block)
                __free_indir(inode,block);
        }
    }
    minix_free_block(inode,blk);
    kfree(bb);
    return 0;
}

void truncate(struct inode *inode) {
    DECAL_INODE(inode);
    if(!(S_ISREG(inode->i_mode) || S_ISDIR(inode->i_mode) || S_ISLNK(inode->i_mode)))
        return;
    for(unsigned long i = 0;i < sbi->s_dzones;i++){
        if(mi->i_zone[i]){
            minix_free_block(inode,mi->i_zone[i]);
            mi->i_zone[i] = 0;
        }
    }
    if(mi->indir_zone) {
        __free_indir(inode,mi->indir_zone);
        mi->indir_zone = 0;
    }
    if(mi->double_indir_zone) {
        __free_double_indir(inode,mi->double_indir_zone);
        mi->double_indir_zone = 0;
    }
    if(sbi->s_version == MINIX_V2 && mi->triple_indir_zone) {
        __free_triple_indir(inode,mi->triple_indir_zone);
        mi->triple_indir_zone = 0;
    }
}

