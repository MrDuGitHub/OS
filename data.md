### Create a file

open.c    

	int sys_open(const char * filename,int flag,int mode) // P634

**File structure pointer array of the process**   
**close_on_exec bitmap**  
**file_table**

namei.c  

    	open_namei(filename,flag,mode,&inode));     // P598

<font color="#dd0000" size=5>**inode**</font>  
**root and pwd inode of this process**  
**the tree of inodes along the dir**  
**the files in the dir**  
**the new inode**

### Write file

  
<font color="#dd0000" size=5>**TO DO**</font> 