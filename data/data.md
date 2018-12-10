## File system

### Create a file

open.c    

	int sys_open(const char * filename,int flag,int mode) // P634

**File structure pointer array of the process**   
**close\_on\_exec bitmap**  
**file\_table**

namei.c  

    	open_namei(filename,flag,mode,&inode));     // P598

<font color="#dd0000" size=5>**inode**</font>  
**root and pwd inode of this process**  
**the tree of inodes along the dir**  
**the files in the dir**  
**the new inode**

### Write file
read_write.c

    sys_write(unsigned int fd,char * buf,int count) // P626
file_dev.c  

    	file_write(inode,file,buf,count);	// P616
  
**data block**  
**pos pointer**  

### Close file
open.c  

    sys_close(unsigned int fd);  //P636
**file structure**

<font color="#dd0000" size=5>**The basic module as above.**</font> 




