/*
 *  linux/fs/file_dev.c
 *
 *  (C) 1991  Linus Torvalds
 */

#include <errno.h>
#include <fcntl.h>

#include <linux/sched.h>
#include <linux/kernel.h>
#include <asm/segment.h>

#define MIN(a,b) (((a)<(b))?(a):(b))
#define MAX(a,b) (((a)>(b))?(a):(b))

int file_read(struct m_inode * inode, struct file * filp, char * buf, int count)
{
	int left,chars,nr;
	struct buffer_head * bh;

	if ((left=count)<=0)
		return 0;
	while (left) {
		if ((nr = bmap(inode,(filp->f_pos)/BLOCK_SIZE))) {
			if (!(bh=bread(inode->i_dev,nr)))
				break;
		} else
			bh = NULL;
		nr = filp->f_pos % BLOCK_SIZE;
		chars = MIN( BLOCK_SIZE-nr , left );
		filp->f_pos += chars;
		left -= chars;
		if (bh) {
			char * p = nr + bh->b_data;
			while (chars-->0)
				put_fs_byte(*(p++),buf++);
			brelse(bh);
		} else {
			while (chars-->0)
				put_fs_byte(0,buf++);
		}
	}
	inode->i_atime = CURRENT_TIME;
	return (count-left)?(count-left):-ERROR;
}

int file_write(struct m_inode * inode, struct file * filp, char * buf, int count)
{
	off_t pos;
	int block,c;
	struct buffer_head * bh;
	char * p;
	int i=0;

/*
 * ok, append may not work when many processes are writing at the same time
 * but so what. That way leads to madness anyway.
 */

log("notice\n");
if (filp->f_flags & O_APPEND)
{
		pos = inode->i_size;
log("{\"module\":\"file_system\",\"file\":\"%s\",\"function\":\"file_write\",\"line\":%d,\"provider\":\"Mr.d\",\"time\":%d,\n\"data\":{\"Event\":\"append\",\"pos\":%d}}\n",__FILE__,__LINE__,jiffies,pos);
	
}
	else
{
		pos = filp->f_pos;
log("{\"module\":\"file_system\",\"file\":\"%s\",\"function\":\"file_write\",\"line\":%d,\"provider\":\"Mr.d\",\"time\":%d,\n\"data\":{\"Event\":\"current\",\"pos\":%d}}\n",__FILE__,__LINE__,jiffies,pos);
}
	while (i<count) {
		if (!(block = create_block(inode,pos/BLOCK_SIZE)))
			break;
		if (!(bh=bread(inode->i_dev,block)))
			break;
		c = pos % BLOCK_SIZE;
		p = c + bh->b_data;
		bh->b_dirt = 1;
		c = BLOCK_SIZE-c;
		if (c > count-i) c = count-i;
		pos += c;
		if (pos > inode->i_size) {
			inode->i_size = pos;
			inode->i_dirt = 1;
		}
		i += c;
		char name[50];int in=0;
		while (c-->0)
		{
			*(p++) = get_fs_byte(buf++);
			name[in++]=*(p-1);
		}
name[in-1]='\0';
log("{\"module\":\"file_system\",\"file\":\"%s\",\"function\":\"file_write\",\"line\":%d,\"provider\":\"Mr.d\",\"time\":%d,\n\"data\":{\"Event\":\"current\",\"count\":%d,\"content\":%s}}\n",__FILE__,__LINE__,jiffies,in,name);
		brelse(bh);
	}
	inode->i_mtime = CURRENT_TIME;
	if (!(filp->f_flags & O_APPEND)) {
		filp->f_pos = pos;
		inode->i_ctime = CURRENT_TIME;
	}
log("noticend");
	return (i?i:-1);
}
