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

