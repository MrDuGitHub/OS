	### Create a file
open.c   

    int sys_creat(const char * pathname, int mode)  
    	sys_open(pathname, O_CREAT | O_TRUNC, mode);

#### Open a file
open.c    

	int sys_open(const char * filename,int flag,int mode) // P634
		# Find an empty file struction pointer for current progcess, return the index as handle
		# Set the close_on_exec
		# Find an empty file structioon in the file table
namei.c  

    	open_namei(filename,flag,mode,&inode));      // P598
		# open file,set the inode,return wrong code if failed
			dir_namei(pathname,&namelen,&basename);  // P596 basename="new"
			# Find the inode of the file specified by filename
				get_dir(pathname);                   // P594
				# Find the inode of the file specified by filename
					inode = current->pwd;
					return pwd;
			# Find the file in this dir
			find_entry(&dir,basename,namelen,&de);   // P598 P590
			# find the target and return buffer
			# If this is a create operation, apply for a new inode and add it under the dir
				new_inode(dir->i_dev); // bitmap.c

bitmap.c

				struct m_inode * new_inode(int dev)  //P561
					inode=get_empty_inode()			 

inode.c

					struct m_inode * get_empty_inode(void) //P572
bitmap.c

					sb = get_super(dev)				 

super.c
	
					struct super_block * get_super(int dev) //P579

nami.c

				add_entry(dir,basename,namelen,&de); // P592
				return;
			# If not, the file already exists, return the point of inode

### Write file
read_write.c

    sys_write(unsigned int fd,char * buf,int count) // P626
file_dev.c  

    	file_write(inode,file,buf,count);	// P616

### Close the file
open.c  

    sys_close(unsigned int fd);  //P636
		iput(filp->f_inode);


### The load of root file system
main.c
    
    main(void)
		init()
			setup((void *) &drive_info);
			(sys_setup(void * BIOS))
hd.c

			sys_setup(void * BIOS)
					rd_load(); // ramdisk.c Virtual disk
super.c 

					mount_root(); // P583

128MB  121MB 121MB+736KB  124640KB*

00000000~000003ff 引导扇区 1kb   
00000400~000007ff 引导块   1kb   
00000800~00000bff 超级块   1kb  
>05BA 2F30 0003 0008 0293 0000 1C00 1008
>137F  
>05BA：inode节点数 1466  
>2F30: 逻辑块数    12080  
>0003：i节点位图占数据块数  
>0008：逻辑块位图占数据块数  
>0293：第一个数据逻辑块号 659  
>0000：log(数据块数/逻辑块)  
>1c00 1008：文件最大长度  
>137f:magic number  

00000c00~000017ff i节点位图  3kb  
00001800~000037ff 逻辑块位图 8kb  
00038000~000a4fff i节点     645kb  
>18C9 0000 00045404 405DC2CD 00 02 0336  
>0337 0338 0339 033A 033B 033C 033D 0000  
>

000a5000~03c903ff 数据区    61357kb 59MB+941KB   