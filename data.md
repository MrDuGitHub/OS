### Create a file

open.c    

	int sys_open(const char * filename,int flag,int mode) // P634

**File structure pointer array of the process**   
**close_on_exec bitmap**  
**file_table**

namei.c  

    	open_namei(filename,flag,mode,&inode)); // P591

**TO DO**  
