/*
 *  linux/fs/read_write.c
 *
 *  (C) 1991  Linus Torvalds
 */

#include <sys/stat.h>
#include <errno.h>
#include <sys/types.h>

#include <linux/kernel.h>
#include <linux/sched.h>
#include <asm/segment.h>

extern int rw_char(int rw,int dev, char * buf, int count, off_t * pos);
extern int read_pipe(struct m_inode * inode, char * buf, int count);
extern int write_pipe(struct m_inode * inode, char * buf, int count);
extern int block_read(int dev, off_t * pos, char * buf, int count);
extern int block_write(int dev, off_t * pos, char * buf, int count);
extern int file_read(struct m_inode * inode, struct file * filp,
		char * buf, int count);
extern int file_write(struct m_inode * inode, struct file * filp,
		char * buf, int count);

int sys_lseek(unsigned int fd,off_t offset, int origin)
{
	struct file * file;
	int tmp;

	if (fd >= NR_OPEN || !(file=current->filp[fd]) || !(file->f_inode)
	   || !IS_SEEKABLE(MAJOR(file->f_inode->i_dev)))
		return -EBADF;
	if (file->f_inode->i_pipe)
		return -ESPIPE;
	switch (origin) {
		case 0:
			if (offset<0) return -EINVAL;
			file->f_pos=offset;
			break;
		case 1:
			if (file->f_pos+offset<0) return -EINVAL;
			file->f_pos += offset;
			break;
		case 2:
			if ((tmp=file->f_inode->i_size+offset) < 0)
				return -EINVAL;
			file->f_pos = tmp;
			break;
		default:
			return -EINVAL;
	}
	return file->f_pos;
}

int sys_read(unsigned int fd,char * buf,int count)
{
	struct file * file;
	struct m_inode * inode;

	if (fd>=NR_OPEN || count<0 || !(file=current->filp[fd]))
		return -EINVAL;
	if (!count)
		return 0;
	verify_area(buf,count);
	inode = file->f_inode;
	if (inode->i_pipe)
		return (file->f_mode&1)?read_pipe(inode,buf,count):-EIO;
	if (S_ISCHR(inode->i_mode))
		return rw_char(READ,inode->i_zone[0],buf,count,&file->f_pos);
	if (S_ISBLK(inode->i_mode))
		return block_read(inode->i_zone[0],&file->f_pos,buf,count);
	if (S_ISDIR(inode->i_mode) || S_ISREG(inode->i_mode)) {
		if (count+file->f_pos > inode->i_size)
			count = inode->i_size - file->f_pos;
		if (count<=0)
			return 0;
		return file_read(inode,file,buf,count);
	}
	printk("(Read)inode->i_mode=%06o\n\r",inode->i_mode);
	return -EINVAL;
}

int sys_write(unsigned int fd,char * buf,int count)
{
	struct file * file;
	struct m_inode * inode;
log("{\"module\":\"file_system\",\"file\":\"%s\",\"function\":\"sys_write\",\"line\":%d,\"provider\":\"wws\",\"time\":%d,\n\"data\":{\"Event\":\"notcie \"}}\n",__FILE__,__LINE__,jiffies);
	if (fd>=NR_OPEN || count <0 || !(file=current->filp[fd]))
		return -EINVAL;
	if (!count)
		return 0;
	log("{\"module\":\"file_system\",\"file\":\"%s\",\"function\":\"sys_write\",\"line\":%d,\"provider\":\"wws\",\"time\":%d,\n\"data\":{\"Event\":\"write a file\",\"fd\":%d,\"file\":%x,\"f_node\":%d,\"count\":%d}}\n",__FILE__,__LINE__,jiffies,fd,file,file->f_inode,count);
	log("{\"module\":\"file_system\",\"file\":\"%s\",\"function\":\"sys_write\",\"line\":%d,\"provider\":\"wws\",\"time\":%d,\n\"data\":{\"Event\":\"judege_file_type:pipe\",\"inode->pipe\":%d}}\n",__FILE__,__LINE__,jiffies,inode->i_pipe);
	inode=file->f_inode;
	if (inode->i_pipe)
		return (file->f_mode&2)?write_pipe(inode,buf,count):-EIO;

	log("{\"module\":\"file_system\",\"file\":\"%s\",\"function\":\"sys_write\",\"line\":%d,\"provider\":\"wws\",\"time\":%d,\n\"data\":{\"Event\":\"judege_file_type\",\"inode->i_mode\":%d}}\n",__FILE__,__LINE__,jiffies,inode->i_mode);

	if (S_ISCHR(inode->i_mode))
		return rw_char(WRITE,inode->i_zone[0],buf,count,&file->f_pos);
	if (S_ISBLK(inode->i_mode))
		return block_write(inode->i_zone[0],&file->f_pos,buf,count);
	if (S_ISREG(inode->i_mode))
{int i=0;
		
		log("{\"module\":\"file_system\",\"file\":\"%s\",\"function\":\"sys_write\",\"line\":%d,\"provider\":\"wws\",\"time\":%d,\n\"data\":{\"Event\":\"write a normal file\",\"fd\":%d}}\n",__FILE__,__LINE__,jiffies,fd);
i=file_write(inode,file,buf,count);
log("{\"module\":\"file_system\",\"file\":\"%s\",\"function\":\"sys_write\",\"line\":%d,\"provider\":\"wws\",\"time\":%d,\n\"data\":{\"Event\":\"end \"}}\n",__FILE__,__LINE__,jiffies);

		return i;

}	printk("(Write)inode->i_mode=%06o\n\r",inode->i_mode);
	return -EINVAL;
}
