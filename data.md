### Create a file

open.c    

	int sys_open(const char * filename,int flag,int mode) // P634

**File structure pointer array of the process**   
**close_on_exec bitmap**  
**file_table**

namei.c  

    	open_namei(filename,flag,mode,&inode));     // P598
			# Find the inode of the file specified by filename
			dir_namei(pathname,&namelen,&basename); // P596
				get_dir(pathname);                  // P594

<font color="#dd0000">**inode**</font>  
**root and pwd inode of this process**  
**the tree of inode along the dir**


**TO DO**  
