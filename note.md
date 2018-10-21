### Create a file
open.c   

    int sys_creat(const char * pathname, int mode)  
    	sys_open(pathname, O_CREAT | O_TRUNC, mode);

### Open a file
open.c    

	int sys_open(const char * filename,int flag,int mode) // P634
		# Find an empty file struction point for current progcess, return the index as handle
		# Set the close_on_exec
		# Find an empty file structioon in the file table
namei.c  

    	open_namei(filename,flag,mode,&inode));      // P598
			# Find the inode of the file specified by filename
			dir_namei(pathname,&namelen,&basename);  // P596
				get_dir(pathname);                   // P594
			# Find the file in this dir
			find_entry(&dir,basename,namelen,&de);   // P598
			# If this is a create operation, apply for a new inode and add it under the dir
				new_inode(dir->i_dev); // bitmap.c
				add_entry(dir,basename,namelen,&de); // P585
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

