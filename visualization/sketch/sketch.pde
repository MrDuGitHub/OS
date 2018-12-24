PImage penguin;
int penguin_X,penguin_Y;
float penguin_size;
PFont font;

static int font_size=24;
static int size_X=1920,size_Y=1080;
static int white=255;
static int black=0;
static int s2ms=1000;
static int alpha=255;

<<<<<<< HEAD
static int[] scene     ={34, 16,23,33, 35,31,  12,  34,16,23};//14
static int[] scene_time={34,50,73,82,117,148,160,194,210,233};
=======
static int[] scene     ={14, 5,30,33, 35, 31, 12, 34, 16, 23, 15};//14
static int[] scene_time={14,19,49,82,117,148,160,194,210,233,248};
>>>>>>> 93bcc593bcbac3f5589910e2de88eb44543c9eb1
int scene_index=0;
int scene_time_now=scene_time[scene_index];

void setup() 
{
  size(1920, 1080);//size(2000, 1236);size(1000, 618);
  //fullScreen();
  background(white);
  penguin = loadImage("penguin.jpg");
  imageMode(CENTER);
}

void draw() 
{
  init();
  Loop();
}

/****************************** The time module ******************************/
//time of current scene
int time() {if (scene_index==0)return millis()/s2ms%(scene[0]+1);  else return (millis()/s2ms-scene_time[scene_index-1]);}
int mtime(){if (scene_index==0)return millis()%((scene[0]+1)*s2ms);else return (millis()-scene_time[scene_index-1]*s2ms);}
boolean dt_s(int s,int e){return time()>=s&&time()<e;}
boolean dt_m(int s,int e){return mtime()>=s&&mtime()<e;}
/****************************** The time module ******************************/

/******************************* The Main Loop *******************************/
void init()
{
    clear();
    background(white);
    if (time()>=scene[scene_index])
    {
      scene_index=(scene_index+1)%scene.length;
      scene_time_now=scene_time[scene_index];
    }
}

void Loop()
{
    switch (scene_index)
    {
<<<<<<< HEAD
        case 0: scene_7();break;
        case 1: scene_8();break;
        case 2: scene_9();break;
        case 3: scene_3();break;
        case 4: scene_4();break;
        case 5: scene_5();break;
        case 6: scene_6();break;
        case 7: scene_7();break;
        case 8: scene_8();break;
        case 9: scene_9();break;
=======
        case 0:  scene_0(); break;
        case 1:  scene_1(); break;
        case 2:  scene_2(); break;
        case 3:  scene_3(); break;
        case 4:  scene_4(); break;
        case 5:  scene_5(); break;
        case 6:  scene_6(); break;
        case 7:  scene_7(); break;
        case 8:  scene_8(); break;
        case 9:  scene_9(); break;
        case 10: scene_10();break;
>>>>>>> 93bcc593bcbac3f5589910e2de88eb44543c9eb1
    }  
}
/******************************* The Main Loop *******************************/

/**************************** The animation effect ***************************/
void fade(float base_t,float sum_t,float fade_t1,float fade_t2,int r,int g,int b)
{
    if (time()<base_t || time()>(base_t+sum_t)) return;
    if (time()-base_t<fade_t1) fill(r,g,b,(mtime()-base_t*s2ms)*alpha/(fade_t1*s2ms)); 
    else if (time()-base_t<(sum_t-fade_t2)) fill(r,g,b,alpha); 
    else fill(r,g,b,(sum_t*s2ms-(mtime()-base_t*s2ms))*alpha/(fade_t2*s2ms));
}

void line_fade(float base_t,float sum_t,float fade_t1,float fade_t2,int r,int g,int b)
{
    if (time()<base_t || time()>(base_t+sum_t)) return;
    if (time()-base_t<fade_t1) stroke(r,g,b,(mtime()-base_t*s2ms)*alpha/(fade_t1*s2ms)); 
    else if (time()-base_t<(sum_t-fade_t1)) stroke(r,g,b,alpha); 
    else stroke(r,g,b,(sum_t*s2ms-(mtime()-base_t*s2ms))*alpha/(fade_t2*s2ms));
}

void penguin_fade(float base_t,float sum_t,float fade_t1,float fade_t2)
{
    if (time()<base_t || time()>base_t+sum_t) return;
    if (time()-base_t<fade_t1) tint(white,(mtime()-base_t*s2ms)*alpha/(fade_t1*s2ms)); 
    else if (time()-base_t<(sum_t-fade_t2)) tint(white,alpha); 
    else tint(white,(sum_t*s2ms-(mtime()-base_t*s2ms))*alpha/(fade_t2*s2ms));
}

void Line(int x1,int y1,int x2,int y2,int base_t,int sum_t,int t)
{
    int dt=mtime()-base_t*s2ms;
    if (dt>=sum_t*s2ms) return;
    int dx=x2-x1,dy=y2-y1;
    if (dt<t*s2ms)line(x1,y1,x1+dt*dx/(t*s2ms),y1+dt*dy/(t*s2ms));
    else line(x1,y1,x2,y2);
}
/**************************** The animation effect ***************************/

/**************************** The module of cloud ****************************/
int [] cloud_dx={19,49,101,119,179,169,239,199,139,139,49,39,-11,-6,19};
int [] cloud_dy={19,-11,19,-16,4,29,44,104,89,119,124,78,109,39,49};
int cloud_X=206,cloud_Y=114;
void cloud(int x,int y,float size)
{
    stroke(black,alpha);
    beginShape();
    vertex(x+cloud_dx[0]*size, y+cloud_dy[14]*size);   // vertex(50,180);
    bezierVertex(x+cloud_dx[0]*size,y+cloud_dy[0]*size,x+cloud_dx[1]*size,y+cloud_dy[1]*size,x+cloud_dx[2]*size,y+cloud_dy[2]*size);
    bezierVertex(x+cloud_dx[3]*size,y+cloud_dy[3]*size,x+cloud_dx[4]*size,y+cloud_dy[4]*size,x+cloud_dx[5]*size,y+cloud_dy[5]*size);
    bezierVertex(x+cloud_dx[6]*size,y+cloud_dy[6]*size,x+cloud_dx[7]*size,y+cloud_dy[7]*size,x+cloud_dx[8]*size,y+cloud_dy[8]*size);
    bezierVertex(x+cloud_dx[9]*size,y+cloud_dy[9]*size,x+cloud_dx[10]*size,y+cloud_dy[10]*size,x+cloud_dx[11]*size,y+cloud_dy[11]*size);
    bezierVertex(x+cloud_dx[12]*size,y+cloud_dy[12]*size,x+cloud_dx[13]*size,y+cloud_dy[13]*size,x+cloud_dx[14]*size,y+cloud_dy[14]*size);
    endShape();
    ellipse(x+180*size,y+100*size,15*size,15*size);
    ellipse(x+195*size,y+108*size,10*size,10*size);
    ellipse(x+205*size,y+115*size,5*size,  5*size);
}
/***************************** The module of cloud ***************************/

/***************************** The module of arrow ***************************/     
void arrow(int sx,int sy,int ex,int ey,int r,int g,int b) //360 300 360 360
{
     int arrow_size=5;
     strokeWeight(2);
     fill(r,g,b);
     stroke(r,g,b);
     line(sx,sy,ex,ey);
     int t1,t2;
     if (ex-sx>0) t1=1;else t1=-1;
     if (ey-sy>0) t2=1;else t2=-1;
     double dx1=0,dy1=0,dx2=0,dy2=0;
     double dx=0,dy=0;
     if (sx==ex||sy==ey)
     {
       if (sx==ex&&sy==ey) return;
       if (sx==ex){dx=0;dy=t2*arrow_size;dx1=arrow_size;dy1=0;dx2=-arrow_size;dy2=0;}
       if (sy==ey){dy=0;dx=t1*arrow_size;dy1=arrow_size;dx1=0;dy2=-arrow_size;dx1=0;}
     }
     else
     {
       double k=abs((float)(ey-sy)/(ex-sx));
       dx=sqrt((float)(arrow_size*arrow_size/(1+k*k)))*t1;
       dy=abs((float)(dx))*k*t2;
       dx1=dy;dy1=-dx;dx2=-dy;dy2=dx;
     }
     triangle((int)(ex+dx),(int)(ey+dy),(int)(ex+dx1),(int)(ey+dy1),(int)(ex+dx2),(int)(ey+dy2));
     strokeWeight(1); 
}
/***************************** The module of arrow ***************************/

/***************************** The module of text ****************************/
void Text(int size,int x,int y,String s)
{
    textSize(size);
    text(s,x,y);
}

void Text_box(float x,float y,float l,float w,int text_size,String text)
{
   textSize(text_size);
   textAlign(CENTER, CENTER);
   text(text,x,y,l,w);
}

void Text_penguin(String s,float fade_bt,float fade_st,float fade_t)
{
    if(time()>=fade_bt+fade_st||time()<fade_bt)return;
    int max1=64;
    int tmp_size;
    if (s.length()<max1) tmp_size=2; else tmp_size=3;
    int dx=100,dy=40;
    int tmp_X=int(penguin_X-(penguin.width-dx)*penguin_size/2-tmp_size*cloud_X);
    int tmp_Y=int(penguin_Y-(penguin.height-dy)*penguin_size/2-tmp_size*cloud_Y);
    noFill();
    cloud(tmp_X,tmp_Y,tmp_size);
    fade(fade_bt,fade_st,fade_t,fade_t,0,0,0);
    Text_box(tmp_X+30*tmp_size,tmp_Y+20*tmp_size,139*tmp_size,58*tmp_size,font_size,s);
}
/***************************** The module of text ****************************/

/*****************************       Scenes       ****************************/
int frame_index=0;
void scene_0()
{
    int[] time_f={2,5,8,11,14};
    if (time()==0) frame_index=0;
    int time_n=time_f[frame_index];
    if (time()>=time_n){frame_index++;frame_index%=time_f.length;time_n=time_f[frame_index];}
    fill(black);textAlign(LEFT,TOP);
    Text(font_size,0,0,"Scene_0,frame_"+str(frame_index)); 
    Text(font_size,0,font_size,"time="+str(float(millis()/100)/10)+" s");
    Text(font_size,0,font_size*2,"L_stime="+str(time())+",L_mtime="+str(mtime()));
    fill(white);

    penguin_fade(0,time_f[time_f.length-1],time_f[0],0);
    image(penguin,(size_X)/2,(size_Y)/2);
    penguin_X=(size_X)/2;penguin_Y=(size_Y)/2;
    penguin_size=1;
    
    String s1="Hello!\nWelcome to the world of Linux 0.11!";
    String s2="Today,I will introduce you to the file system."; 
    String s3="It will be interesting.";
    String s4="So,let's begin~";
    switch(frame_index)
    {
      case 0:break;
      case 1:Text_penguin(s1,time_f[frame_index-1],3,1);break;
      case 2:Text_penguin(s2,time_f[frame_index-1],3,1);break;
      case 3:Text_penguin(s3,time_f[frame_index-1],3,1);break;
      case 4:Text_penguin(s4,time_f[frame_index-1],3,1);break;
    }
   // if (mtime()>900)stop();
}

void scene_1()
{
    int[] time_f={1,3,5};
    if (time()==0) frame_index=0;
    int time_n=time_f[frame_index];
    if (time()>=time_n){frame_index++;frame_index%=time_f.length;time_n=time_f[frame_index];}
    fill(0);textAlign(LEFT,TOP);
    Text(font_size,0,0,"Scene_1,frame_"+str(frame_index));  
    Text(font_size,0,font_size,"time="+str(float(millis()/100)/10)+" s");
    Text(font_size,0,font_size*2,"L_stime="+str(time())+",L_mtime="+str(mtime()));
    fill(white);
    
    int x0=size_X/2,y0=size_Y/2;
    int w0 = penguin.width, h0 = penguin.height;
    penguin_size=0.75;
    int w1 = int(w0*penguin_size),h1 = int(h0*penguin_size);
    int x1=size_X-w0,y1=size_Y-h0;
    int dx=x1-x0,dy=y1-y0,dw=w1-w0,dh=h1-h0;
    int w,h,x,y;
    w=h=x=y=0;
    switch(frame_index)
    {
      case 0: x=x0;y=y0;w=w0;h=h0;break;
      case 1: w = w0+dw*(mtime()-s2ms)/(2*s2ms);h = h0+dh*(mtime()-s2ms)/(2*s2ms);
              x = x0+dx*(mtime()-s2ms)/(2*s2ms);y = y0+dy*(mtime()-s2ms)/(2*s2ms);break;
      case 2: w = w1; h = h1; x = x1; y = y1; break;
    }
    image(penguin,x,y,w,h);
    penguin_X=x;penguin_Y=y;
}

void scene_2()
{
    int[] time_f={3,6,9,12,15,18,21,24,27,30};
    if (time()==0) frame_index=0;
    int time_n=time_f[frame_index];
    if (time()>=time_n){frame_index++;frame_index%=time_f.length;time_n=time_f[frame_index];}
    fill(black);textAlign(LEFT,TOP);
    Text(font_size,0,0,"Scene_2,frame_"+str(frame_index));  
    Text(font_size,0,font_size,"time="+str(float(millis()/100)/10)+" s");
    Text(font_size,0,font_size*2,"L_stime="+str(time())+",L_mtime="+str(mtime()));
    fill(white);
    /*penguin_X=1736;penguin_Y=863;penguin_size=0.75;
    int x1=penguin_X,y1=penguin_Y;*/
    tint(white,alpha);
    image(penguin,penguin_X,penguin_Y,penguin.width*penguin_size,penguin.height*penguin_size);
    String s1="The FS is based on the MINIX 1.0 file system.";
    String s2="It mainly consists of six parts."; 
    String s3="The first block is the boot block.";
    String s4="The second block is the super block.";
    String s5="The third part is the inode bitmap.";
    String s6="The forth part is the logical block bitmap.";
    String s7="The fifth part is the inodes.";
    String s8="The last part is the actual data area.";
    String s9="If you use a hard disk to boot the system,";
    String s10="the FS will occupy one of the partitions.";
    int[] box_x={400,440,480,520,560,720};
    int box_y=400,box_h=50,box_w=40;
    
    switch(frame_index)
    {
      case 0:Text_penguin(s1,0,3,1);
             break;
      case 1:Text_penguin(s2,time_f[frame_index-1],3,1);
             break;
      case 2:Text_penguin(s3,time_f[frame_index-1],3,1);
             fade(6,3,3,0,255, 204, 153);line_fade(6,3,3,0,0,0,0);
             rect(box_x[0],box_y,box_w,box_h);
             fade(6,3,1,1,0,0,0);
             Text_box(box_x[0]-30,box_y-80,100,100,font_size,"boot");
             break;
      case 3:Text_penguin(s4,time_f[frame_index-1],3,1); 
             fade(9,3,2,0,255, 153, 204);line_fade(9,3,2,0,0,0,0);
             rect(box_x[1],box_y,box_w,box_h);
             fade(9,3,0,1,0,0,0);
             Text_box(box_x[1]-30,box_y+30,100,100,font_size,"super block");
             break;
      case 4:Text_penguin(s5,time_f[frame_index-1],3,1); 
             fade(12,3,1,0,255, 255, 153);line_fade(12,3,1,0,0,0,0);
             rect(box_x[2],box_y,box_w,box_h);
             fade(12,3,0,1,0,0,0);
             Text_box(box_x[2]-30,box_y-90,100,100,font_size,"inode bitmap");
             break;
      case 5:Text_penguin(s6,time_f[frame_index-1],3,1); 
             fade(15,3,1,0,204, 255, 204);line_fade(15,3,1,0,0,0,0);
             rect(box_x[3],box_y,box_w,box_h);           
             fade(15,3,0,1,0,0,0);
             Text_box(box_x[3]-30,box_y+30,100,100,font_size,"logical bitmap");
             break;
      case 6:Text_penguin(s7,time_f[frame_index-1],3,1); 
             fade(18,3,1,0,204, 255, 255);line_fade(18,3,1,0,0,0,0);
             for (int i=0;i<4;i++)
                 rect(box_x[4]+i*box_w,box_y,box_w,box_h);
             fade(18,3,0,1,0,0,0);
             Text_box(box_x[3]-30,box_y-90,300,100,font_size,"inode");
             break;
      case 7:Text_penguin(s8,time_f[frame_index-1],3,1); 
             fade(21,3,1,0,153, 204, 255);line_fade(21,3,1,0,0,0,0);
             for (int i=0;i<10;i++)
                 rect(box_x[5]+i*box_w,box_y,box_w,box_h);
             fade(21,3,0,1,0,0,0);
             Text_box(box_x[4]-30,box_y+30,700,100,font_size,"data block");
             break;
      case 8:Text_penguin(s9,time_f[frame_index-1],3,1);
             fade(24,3,1,0,255, 153, 204);line_fade(24,3,1,0,0,0,0);
             rect(400,600,40,40);           
             fade(24,3,1,0,204, 255, 255);line_fade(24,3,1,0,0,0,0);
             rect(440,600,120,40);                      
             fade(24,3,1,0,255, 255, 153);line_fade(24,3,1,0,0,0,0);
             rect(560,600,160,40);           
             fade(24,3,1,0,153, 204, 255);line_fade(24,3,1,0,0,0,0);
             rect(720,600,160,40); 
             fade(24,3,1,0,204, 255, 204);line_fade(24,3,1,0,0,0,0);
             rect(880,600,200,40); 
             fade(24,3,1,0,0,0,0);
             Text_box(400-30,500+30,100,100,16,"boot section");
             Text_box(440,570,120,100,16,"FAT32");
             Text_box(560,570,160,100,16,"NTFS");
             Text_box(720,570,160,100,16,"MINIX");
             Text_box(880,570,200,100,16,"EXT2");
             break;
      case 9:Text_penguin(s10,time_f[frame_index-1],3,1);
             Line(720,600,400,450,27,3,2);
             Line(880,600,1120,450,27,3,2);
             break;        
    }
    if (time()>=9) {fill(255, 204, 153); stroke(0,0,0);rect(box_x[0],box_y,box_w,box_h);}  
    if (time()>=12){fill(255, 153, 204); stroke(0,0,0);rect(box_x[1],box_y,box_w,box_h);}
    if (time()>=15){fill(255, 255, 153); stroke(0,0,0);rect(box_x[2],box_y,box_w,box_h);}
    if (time()>=18){fill(204, 255, 204); stroke(0,0,0);rect(box_x[3],box_y,box_w,box_h);}
    if (time()>=21)
    {
        fill(204, 255, 255); stroke(0,0,0);
        for (int i=0;i<4;i++)
            rect(box_x[4]+i*box_w,box_y,box_w,box_h);
    }
    if (time()>=24)
    {
        fill(153, 204, 255); stroke(0,0,0);
        for (int i=0;i<10;i++)
            rect(box_x[5]+i*box_w,box_y,box_w,box_h);
    }
    if (time()>=27)
    {
       fill(255, 153, 204); stroke(0,0,0);rect(400,600,40,40);           
       fill(204, 255, 255); stroke(0,0,0);rect(440,600,120,40);                      
       fill(255, 255, 153); stroke(0,0,0);rect(560,600,160,40);           
       fill(153, 204, 255); stroke(0,0,0);rect(720,600,160,40); 
       fill(204, 255, 204); stroke(0,0,0);rect(880,600,200,40); 
       fill(0); stroke(0,0,0);
       Text_box(400-30,500+30,100,100,16,"boot section");
       Text_box(440,570,120,100,16,"FAT32");
       Text_box(560,570,160,100,16,"NTFS");
       Text_box(720,570,160,100,16,"MINIX");
       Text_box(880,570,200,100,16,"EXT2");
    }
}

void scene_3()
{  
    int[] time_f={9,18,21,24,30,33};
    if (time()==0) frame_index=0;
    int time_n=time_f[frame_index];
    if (time()>=time_n){frame_index++;frame_index%=time_f.length;time_n=time_f[frame_index];}
    fill(black);textAlign(LEFT,TOP);
    Text(font_size,0,0,"Scene_3,frame_"+str(frame_index));  
    Text(font_size,0,font_size,"time="+str(float(millis()/100)/10)+" s");
    Text(font_size,0,font_size*2,"L_stime="+str(time())+",L_mtime="+str(mtime()));
    fill(white);
    /*penguin_X=1736;penguin_Y=863;penguin_size=0.75;
    int x1=penguin_X,y1=penguin_Y;*/
    tint(white,alpha);
    image(penguin,penguin_X,penguin_Y,penguin.width*penguin_size,penguin.height*penguin_size);
    String s1="For example,this is a 122MB hard disk image hdc-0.11.img.";
    String s2="The first boot sector occupies 1kb";
    String s3="The first partition is the FS of linux 0.11.";
    
    String s4="The first 1kb is a boot block used to keep the file format uniform.";
    String s5="The second block is super block ";
    String s6="that stores file system structure information and size.";
    
    String s7="Next part is the inode bitmap.";
    String s8="The forth part is the logical block bitmap.";
    
    String s9="The next one is inodes,";
    String s10="each representing a file or folder";
  
    String s11="The rest are the data blocks.";
    
    switch(frame_index)
    {
      case 0:if (dt_s(0,3))Text_penguin(s1,0,3,1);
             if (dt_s(3,6))Text_penguin(s2,3,3,1);
             if (dt_s(6,9))Text_penguin(s3,6,3,1);
             
             fade(0,9,2,0,255, 153, 204);line_fade(0,9,2,0,0,0,0);
             rect(400,150,40,40);           
             fade(0,9,2,0,204, 255, 255);line_fade(0,9,2,0,0,0,0);
             rect(440,150,400,40);                      
             fade(0,9,2,0,255, 255, 153);line_fade(0,9,2,0,0,0,0);
             rect(840,150,400,40);
             fill(black);
             fade(0,9,2,0,black,black,black);
             Text_box(400-30,80,100,100,16,"boot section");
             Text_box(600,50,400,100,24,"hdc-0.11.img 121.72MB");
             if (dt_s(3,6))Text_box(400-30,150,100,100,16,"1KB");
             if (dt_s(6,9))
             {
               Text_box(600,150,100,100,16,"60.56MB");
               Line(440,190,300,250,6,3,2);
               Line(840,190,1200,250,6,3,2);
             }
             break;
      case 1:fill(black);
             Text_penguin(s4,9,3,1);
             Text_penguin(s5,12,3,1);
             if (dt_s(9,12))Text_box(200,225,100,100,16,"boot block");
             if (dt_s(12,15))
             {
               Text_box(295,280,100,100,18,"super block");
               if (dt_s(12,14))
               {
                  Line(330,300,270,360,12,3,2);
                  Line(360,300,420,360,12,3,2);
               }
             }
             if (dt_s(14,18))//14
             {
                line(330,300,270,360);
                line(360,300,420,360);
                fill(255, 153, 204); stroke(0,0,0);rect(270,360,150,100);
                fill(black);
                Text_box(270,360,150,100,16,"05BA 2F30 0003 0008 0293 0000 1C00 1008 137F 0000 0000  ....   ");
                Text_box(295,280,100,100,18,"super block");
             }
             if (dt_s(15,18))
             {
               Text_penguin(s6,15,3,1);
               fill(black);
               String[] name={"iNode number","logical blocks","inode bitmap blocks","logical bitmap blocks","first logical block","log","max_length","magic number"};
               String[] num={"1466","12080","3","8","659","0","469766152","4991"};
               String[] numo={"05BA","2F30","0003","0008","0293","0000","1C00 1008","137F"};
              
               int ind=6;
               for (int i=0;i<6;i++)
               {
                  fade(15,3,1,0,255,153,204);
                  rect(200,480+30*i,180,30);
                  rect(380,480+30*i,100,30);
                  rect(480,480+30*i,80,30);
                  fade(15,3,1,0,black,black,black);
                  Text_box(200,480+30*i,180,30,16,name[i]);
                  Text_box(380,480+30*i,80,30,16,num[i]);
                  Text_box(480,480+30*i,80,30,16,numo[i]);
               }
               fade(15,3,1,0,255,153,204);rect(200,480+30*6,180,60);rect(380,480+30*6,100,60);rect(480,480+30*6,80,60);
               fade(15,3,1,0,black,black,black);Text_box(200,480+30*6,180,60,16,name[6]);
               Text_box(380,480+30*6,80,60,16,num[6]);Text_box(480,480+30*6,80,60,16,numo[6]);
               fade(15,3,1,0,255,153,204);rect(200,480+30*8,180,30);rect(380,480+30*8,100,30);rect(480,480+30*8,80,30);
               fade(15,3,1,0,black,black,black);Text_box(200,480+30*8,180,30,16,name[7]);
               Text_box(380,480+30*8,80,30,16,num[7]);Text_box(480,480+30*8,80,30,16,numo[7]);
           }
           break;
      case 2:fill(black);
             Text_penguin(s7,18,3,1);
             Line(360,300,300,360,18,3,1);
             Line(450,300,510,360,18,3,1);
             Text_box(350,300,100,30,20,"3kb");
             if (dt_s(19,21))
             {
               for (int i=0;i<7;i++){
                  fill(255, 255, 153);rect(300+i*30,360,30,30);fill(black);Text_box(300+i*30,360,30,30,16,"1");}
               for (int i=0;i<7;i++){
                  fill(255, 255, 153);rect(300+i*30,390,30,30);fill(black);Text_box(300+i*30,390,30,30,16,"0");}
               for (int i=0;i<7;i++){
                  fill(255, 255, 153);rect(300+i*30,420,30,30);fill(black);Text_box(300+i*30,420,30,30,16,".");}
             }
             break;
      case 3:fill(black);
             Text_penguin(s8,21,3,1);
             Line(450,300,390,360,21,3,1);
             Line(690,300,750,360,21,3,1);
             Text_box(520,300,100,30,20,"8kb");
             if (dt_s(22,24))
             {
               for (int i=0;i<12;i++){
                  fill(204, 255, 204);rect(390+i*30,360,30,30);fill(black);Text_box(390+i*30,360,30,30,16,"1");}
               for (int i=0;i<12;i++){
                  fill(204, 255, 204);rect(390+i*30,390,30,30);fill(black);Text_box(390+i*30,390,30,30,16,"0");}
               for (int i=0;i<12;i++){
                  fill(204, 255, 204);rect(390+i*30,420,30,30);fill(black);Text_box(390+i*30,420,30,30,16,".");}
             }
             break;
      case 4:fill(black);
             Text_penguin(s9,24,3,1);
             Text_penguin(s10,27,3,1);
             Line(690,300,430,360,24,6,1);
             Line(930,300,1130,360,24,6,1);  
             if (dt_s(25,30))
             {
               for (int i=0;i<14;i++){
                  fill(204, 255, 255);rect(430+i*50,360,50,50);}
               if(dt_s(27,30))
               {
                 Line(680,410,580,470,27,3,1);
                 Line(730,410,830,470,27,3,1);  
                 fill(black); 
                 if (dt_s(28,30))
                 {  
                   line(680,410,580,470);
                   line(730,410,830,470);   
                   for (int i=0;i<14;i++){fill(204, 255, 255);rect(430+i*50,360,50,50);}
                   String[] t={"i_mode","i_uid","i_size","i_mtime","i_gid","i_nlinks","i_zone[9]"};
                   String[] n={"18C9","0000","00045404","405DC2CD","00","02","0336~033D"};
                   for (int i=0;i<7;i++){
                    fill(204, 255, 255);rect(580,470+i*40,100,40);rect(680,470+i*40,150,40);
                    fill(black);Text_box(580,470+i*40,100,40,20,t[i]);Text_box(680,470+i*40,150,40,20,n[i]);
                    }
                 }
                }
              }
             break;
      case 5:fill(black);
             Text_penguin(s11,30,3,1);
             Text_box(970,300,200,40,24,"data blocks");
             break;
    }
    if (time()>=8)
    {
        fill(255, 153, 204); stroke(0,0,0);rect(400,150,40,40);           
        fill(204, 255, 255); stroke(0,0,0);rect(440,150,400,40);                      
        fill(255, 255, 153); stroke(0,0,0);rect(840,150,400,40);
   
        fill(black);
        Text_box(400-30,80,100,100,16,"boot section");
        Text_box(600,50,400,100,24,"hdc-0.11.img 121.72MB");
        Text_box(600,150,100,100,16,"60.56MB");
        line(440,190,300,250);
        line(840,190,1200,250);
             
        int[] box_x={300,330,360,450,690,930};
        int box_y=250,box_h=50,box_w=30;
        fill(255, 204, 153); stroke(0,0,0);rect(box_x[0],box_y,box_w,box_h);  
        fill(255, 153, 204); stroke(0,0,0);rect(box_x[1],box_y,box_w,box_h);
        fill(255, 255, 153); stroke(0,0,0);
        for (int i=0;i<3;i++)
            rect(box_x[2]+i*box_w,box_y,box_w,box_h);
        fill(204, 255, 204); stroke(0,0,0);
        for (int i=0;i<8;i++)
            rect(box_x[3]+i*box_w,box_y,box_w,box_h);
        fill(204, 255, 255); stroke(0,0,0);
        for (int i=0;i<8;i++)
            rect(box_x[4]+i*box_w,box_y,box_w,box_h);
        fill(153, 204, 255); stroke(0,0,0);
        for (int i=0;i<9;i++)
            rect(box_x[5]+i*box_w,box_y,box_w,box_h);
     }
     //if (mtime()>37900)stop();
}

void scene_4()
{  
    int[] time_f={3,9,12,19,26,35};
    if (time()==0) frame_index=0;
    int time_n=time_f[frame_index];
    if (time()>=time_n){frame_index++;frame_index%=time_f.length;time_n=time_f[frame_index];}
    fill(black);textAlign(LEFT,TOP);
    Text(24,0,0,"Scene_4,frame_"+str(frame_index));  
    Text(24,0,24,"time="+str(float(millis()/100)/10)+" s");
    Text(24,0,24*2,"L_stime="+str(time())+",L_mtime="+str(mtime()));
    fill(white);
    
    /***basic***/
    penguin_X=1736;penguin_Y=863;penguin_size=0.75;
    int x1=penguin_X,y1=penguin_Y; 
    tint(white,alpha);
    image(penguin,penguin_X,penguin_Y,penguin.width*penguin_size,penguin.height*penguin_size);
   
    fill(255, 153, 204); stroke(0,0,0);rect(400,150,40,40);           
    fill(204, 255, 255); stroke(0,0,0);rect(440,150,400,40);                      
    fill(255, 255, 153); stroke(0,0,0);rect(840,150,400,40);
 
    fill(black);
    Text_box(400-30,80,100,100,16,"boot section");
    Text_box(600,50,400,100,24,"hdc-0.11.img 121.72MB");
    Text_box(600,150,100,100,16,"60.56MB");
    line(440,190,300,250);
    line(840,190,1200,250);
    
    int[] box_x={300,330,360,450,690,930};
    int box_y=250,box_h=50,box_w=30;
    fill(255, 204, 153); stroke(0,0,0);rect(box_x[0],box_y,box_w,box_h);  
    fill(255, 153, 204); stroke(0,0,0);rect(box_x[1],box_y,box_w,box_h);
    fill(255, 255, 153); stroke(0,0,0);
    for (int i=0;i<3;i++)
        rect(box_x[2]+i*box_w,box_y,box_w,box_h);
    fill(204, 255, 204); stroke(0,0,0);
    for (int i=0;i<8;i++)
        rect(box_x[3]+i*box_w,box_y,box_w,box_h);
    fill(204, 255, 255); stroke(0,0,0);
    for (int i=0;i<8;i++)
        rect(box_x[4]+i*box_w,box_y,box_w,box_h);
    fill(153, 204, 255); stroke(0,0,0);
    for (int i=0;i<9;i++)
        rect(box_x[5]+i*box_w,box_y,box_w,box_h);
    /***basic***/
    
    String s1="Ok,now let's see how to create a file.";
    String s2="In linux, each task has a file pointer table,";
    String s3="each of which points to a file structure of the file opened by the task.";
    String s4="The first step of creation is find a empty pointer.";
    String s5="Next,find a blank item in the file table";
    String s6="and have that pointer point to it.";
    String s7="Next,find the creation location based on the path in the file name.";
    String s8="Relative path starts from pwd.";
    String s9="Find the location of the pwd data block from its inode.";
    
    switch(frame_index)
    {
      case 0:fill(black);
             Text_penguin(s1,0,3,1);
             break;
      case 1:fill(black);
             Text_penguin(s2,3,3,1);
             Text_penguin(s3,6,3,1);
             fill(white);strokeWeight(4);stroke(201, 201, 201,alpha);
             line_fade(3,3,1,0,201,201,201);
             ellipse(400,700,180,180);
             fill(black);fade(3,3,1,0,0,0,0);
             Text_box(220,520,360,360,24,"TASK");
             strokeWeight(2);fill(white);
             line_fade(3,6,1,0,70, 114, 196);
             fade(3,6,1,0,70,114,196);Text_box(570,440,100,100,24,"filp");fill(white);
             rect(535,520+0*38,35,38); fade(3,6,1,0,70,114,196);Text_box(535,520+0*38,35,38,16,"0");fill(white);
             rect(570,520+0*38,150,38);fade(3,6,1,0,70,114,196);Text_box(570,520+0*38,150,38,16,"0x27730(stdin)");fill(white);
             rect(535,520+1*38,35,38); fade(3,6,1,0,70,114,196);Text_box(535,520+1*38,35,38,16,"1");fill(white);
             rect(570,520+1*38,150,38);fade(3,6,1,0,70,114,196);Text_box(570,520+1*38,150,38,16,"0x27730(stdout)");fill(white);
             rect(535,520+2*38,35,38); fade(3,6,1,0,70,114,196);Text_box(535,520+2*38,35,38,16,"2");fill(white);
             rect(570,520+2*38,150,38);fade(3,6,1,0,70,114,196);Text_box(570,520+2*38,150,38,16,"0x27730(stderr)");fill(white);
             rect(535,520+3*38,35,38); fade(3,6,1,0,70,114,196);Text_box(535,520+3*38,35,38,16,"3");fill(white);
             rect(570,520+3*38,150,38);fade(3,6,1,0,70,114,196);Text_box(570,520+3*38,150,38,16,"0x0(NULL)");fill(white);
             rect(535,520+4*38,35,50); fade(3,6,1,0,70,114,196);Text_box(535,520+4*38,35,50,16,"");fill(white);
             rect(570,520+4*38,150,50);fade(3,6,1,0,70,114,196);Text_box(570,520+4*38,150,50,10,".\n.\n.\n");fill(white);
             rect(535,532+5*38,35,38); fade(3,6,1,0,70,114,196);Text_box(535,532+5*38,35,38,16,"19");fill(white);
             rect(570,532+5*38,150,38);fade(3,6,1,0,70,114,196);Text_box(570,531+5*38,150,38,16,"0x0(NULL)");fill(white);
             strokeWeight(1);
             break;
      case 2:fill(black);
             Text_penguin(s4,9,3,1);
             strokeWeight(2);stroke(70, 114, 196);fill(white);
             rect(570,520+3*38,150,38);fill(70,114,196);stroke(70, 114, 196,alpha);
             if (dt_m(9000,9600+600*3))Text_box(570,520+3*38,150,38,16,"0x0(NULL)");
             else arrow(615,540+38*3,665,540+38*3,70,114,196);
             fill(white);
             strokeWeight(1);
             for (int i=0;i<4;i++)
                 if (dt_m(9000+600*i,9600+600*i))
                   arrow(800,540+38*i,750,540+38*i,70,114,196);
             break;
      case 3:fill(black);
             Text_penguin(s5,12,3,1);
             Text_penguin(s6,15,3,1);
             fade(12,7,1,0,70, 114, 196);
             line_fade(12,7,1,0,70, 114, 196);
             strokeWeight(2);
             Text_box(820+6*40,450,100,100,20,"File table");                          
             fill(white);
             for (int i=0;i<15;i++)
               rect(820+i*40,520,40,30);
             if (dt_s(13,19))
             {
                 if (dt_s(13,14)) arrow(840,630,840,580,70,114,196);
                 if (dt_s(14,15)) arrow(880,630,880,580,70,114,196);
                 if (dt_s(15,16)) arrow(920,630,920,580,70,114,196);
                 if (dt_s(16,19))
                 {         
                   Line(900,550,850,630,16,3,1);
                   Line(940,550,990,630,16,3,1);
                   if (dt_s(17,19))
                   {
                     String[] tem={"f_mode","f_flags","f_count","f_inode","off_t"};
                     for (int i=0;i<5;i++)
                     {
                       fill(white);
                       rect(850,630+i*40,80,40);rect(930,630+i*40,60,40);
                       fill(70,114,196);
                       Text_box(850,630+i*40,80,40,18,tem[i]);
                     }
                     Text_box(930,630+2*40,60,40,20,"0");
                   }
                 }
             }
             strokeWeight(1);
             break; 
      case 4:fill(black);
             Text_penguin(s7,19,4,1);
             Text_penguin(s8,23,3,1);
             if(dt_s(19,23))
             {
               fade(19,4,2,0,white,white,white);
               strokeWeight(3);stroke(201, 201, 201,alpha);
               rect(550,650,100,40);
               rect(550,710,100,40);
               rect(705,650,60,40);               
               rect(705,710,60,40);
               arrow(600,670,700,670,70,114,196);
               arrow(600,730,700,730,70,114,196); 
               fade(19,4,2,0,70,114,196);
               Text_box(705,710,60,40,18,"pwd");             
               Text_box(705,650,60,40,18,"root");
             }
             stroke(black,alpha);
             if (dt_s(23,26))
             {
               fill(white);strokeWeight(3);stroke(201, 201, 201,alpha);
               rect(550,710,100,40);
               rect(705,710,60,40);
               fade(23,3,1,0,70,114,196);
               Text_box(550,710,100,40,18,"0x256d8");         
               arrow(650,730,700,730,70,114,196); 
               fill(70,114,196);
               Text_box(705,710,60,40,18,"pwd");             
             }
             break;
       case 5:fill(black);
             Text_penguin(s9,26,8,1);
             Line(690,300,430,360,26,9,1);
             Line(930,300,1130,360,26,9,1);  
             if (dt_s(27,35))
             {
               stroke(black,alpha);
               for (int i=0;i<14;i++){
                  fill(204, 255, 255);rect(430+i*50,360,50,50);}
             }
             if (dt_s(29,35))
             {
               stroke(black,alpha);
               Line(680,410,600,460,29,6,1);
               Line(730,410,790,460,29,6,1);
               if (dt_s(30,35))
               {
                 fill(70,114,196);
                 Text(20,500,480,"0x256d8 pwd");
                 String tem[]={"i_mode","i_uid","i_size","i_mtime","i_zone[9]","i_wait","..."};
                 for (int i=0;i<7;i++)
                 {
                    fade(30,5,1,0,204, 255, 255);
                    rect(600,460+50*i,190,50);
                    fade(30,5,1,0,70,114,196);
                    Text_box(600,460+50*i,190,50,20,tem[i]);
                 }
               }
               if (dt_s(32,34))
               {
                 int tx=1000-790,ty=300-680;
                 double time=(double)(mtime()-32000)/2000;
                 arrow(790,680,(int)(790+tx*time),(int)(680+ty*time),black,black,black);
               }
               if (dt_s(34,35))arrow(790,680,1000,300,black,black,black);
             }
             break;
    }
    if (time()>=6)
    {
       fill(white);
       strokeWeight(4);
       stroke(201, 201, 201,alpha);
       ellipse(400,700,180,180);
       fill(black);
       Text_box(220,520,360,360,24,"TASK");
       strokeWeight(1);
       if (dt_s(9,19))
       {
             strokeWeight(2);fill(white);
             stroke(70, 114, 196);
             int tx1=570,tx2=535;
             fill(70,114,196);Text_box(tx1,440,100,100,24,"filp");fill(white);
          
             rect(tx2,520+0*38,35,38); fill(70,114,196);Text_box(tx2,520+0*38,35,38,16,str(0));fill(white);
             rect(tx1,520+0*38,150,38);fill(70,114,196);Text_box(tx1,520+0*38,150,38,16,"0x27730(stdin)");fill(white);
             rect(tx2,520+1*38,35,38); fill(70,114,196);Text_box(tx2,520+1*38,35,38,16,str(1));fill(white);
             rect(tx1,520+1*38,150,38);fill(70,114,196);Text_box(tx1,520+1*38,150,38,16,"0x27730(stdout)");fill(white);
             rect(tx2,520+2*38,35,38); fill(70,114,196);Text_box(tx2,520+2*38,35,38,16,str(2));fill(white);
             rect(tx1,520+2*38,150,38);fill(70,114,196);Text_box(tx1,520+2*38,150,38,16,"0x27730(stderr)");fill(white);
             
             rect(tx2,520+3*38,35,38); fill(70,114,196);Text_box(tx2,520+3*38,35,38,16,str(3));fill(white);
             if (dt_s(12,19))
             {
               rect(tx1,520+3*38,150,38);fill(70,114,196);
               if (dt_s(12,16))arrow(615,540+38*3,665,540+38*3,70,114,196);
               if (dt_s(16,17))
               { 
                 int tem=mtime()-16000;
                 double x=(double)tem/1000;
                 double dx=(830-690)*x,dy=(650-540-38*3)*x;
                 arrow(640,540+38*3,690+(int)dx,540+38*3+(int)dy,70,114,196);
               }
               if (dt_s(17,19)) 
               {
                 arrow(740,540+38*3,830,650,70,114,196);
                 Text_box(tx1,520+3*38,150,38,16,"0x27740(?)");
               }
             }
             fill(white);
             strokeWeight(2);
             rect(tx2,520+4*38,35,50); fill(70,114,196);Text_box(tx2,520+4*38,35,50,16,"");fill(white);
             rect(tx1,520+4*38,150,50);fill(70,114,196);Text_box(tx1,520+4*38,150,50,10,".\n.\n.\n");fill(white);
             rect(tx2,532+5*38,35,38); fill(70,114,196);Text_box(tx2,532+5*38,35,38,16,"19");fill(white);
             rect(tx1,532+5*38,150,38);fill(70,114,196);Text_box(tx1,531+5*38,150,38,16,"0x0(NULL)");fill(white);
             strokeWeight(1);
       }
    }
    //if (mtime()>32970)stop(); 
}

void scene_5()
{  
    int[] time_f={7,13,17,23,31};
    if (time()==0) frame_index=0;
    int time_n=time_f[frame_index];
    if (time()>=time_n){frame_index++;frame_index%=time_f.length;time_n=time_f[frame_index];}
    fill(black);textAlign(LEFT,TOP);
    Text(24,0,0,"Scene_5,frame_"+str(frame_index));  
    Text(24,0,24,"time="+str(float(millis()/100)/10)+" s");
    Text(24,0,24*2,"L_stime="+str(time())+",L_mtime="+str(mtime()));
    fill(white);
    /***basic***/
    penguin_X=1736;penguin_Y=863;penguin_size=0.75;
    int x1=penguin_X,y1=penguin_Y; 
    tint(white,alpha);
    image(penguin,penguin_X,penguin_Y,penguin.width*penguin_size,penguin.height*penguin_size);
   
    fill(255, 153, 204); stroke(0,0,0);rect(400,150,40,40);           
    fill(204, 255, 255); stroke(0,0,0);rect(440,150,400,40);                      
    fill(255, 255, 153); stroke(0,0,0);rect(840,150,400,40);
 
    fill(black);
    Text_box(400-30,80,100,100,16,"boot section");
    Text_box(600,50,400,100,24,"hdc-0.11.img 121.72MB");
    Text_box(600,150,100,100,16,"60.56MB");
    line(440,190,300,250);
    line(840,190,1200,250);
         
    int[] box_x={300,330,360,450,690,930};
    int box_y=250,box_h=50,box_w=30;
    fill(255, 204, 153); stroke(0,0,0);rect(box_x[0],box_y,box_w,box_h);  
    fill(255, 153, 204); stroke(0,0,0);rect(box_x[1],box_y,box_w,box_h);
    fill(255, 255, 153); stroke(0,0,0);
    for (int i=0;i<3;i++)
        rect(box_x[2]+i*box_w,box_y,box_w,box_h);
    fill(204, 255, 204); stroke(0,0,0);
    for (int i=0;i<8;i++)
        rect(box_x[3]+i*box_w,box_y,box_w,box_h);
    fill(204, 255, 255); stroke(0,0,0);
    for (int i=0;i<8;i++)
        rect(box_x[4]+i*box_w,box_y,box_w,box_h);
    fill(153, 204, 255); stroke(0,0,0);
    for (int i=0;i<9;i++)
        rect(box_x[5]+i*box_w,box_y,box_w,box_h);
        
    fill(white);
    strokeWeight(4);
    stroke(201, 201, 201,alpha);
    ellipse(400,700,180,180);
    fill(black);
    Text_box(220,520,360,360,24,"TASK");
    strokeWeight(1);
    /***basic***/
    String s1="Then find out if there is this file in this directory";
    String s2="If the file was not found, it proves to be a file creation operation";
    String s3="We need to find an empty inode for it.";
    String s4="First,get the inode bitmap from the superblock.";
    String s5="And find the first empty bit in the bitmap.";
    String s6="Initialize the corresponding inode.";
    String s7="Finally, add this item in the current directory.";
    String s8="OK!The hello file has been successfully created!";
    switch(frame_index)
    {
      case 0:
            Text_penguin(s1,0,3,1);
            Text_penguin(s2,3,4,1);
            Line(990,300,950,330,0,10,1);
            Line(1020,300,1060,330,0,10,1);
            String tem[]={".","..",".profile",".bash_history","hello.c","mtools.howto","examples","README","shoelace.tar.Z",
                          "shoe","linux0.tgz","linux-0.00","gcclib140","MBR","part13","MBR3","mbr3","part14"};
            if (dt_s(1,7))
            {
              for (int i=0;i<18;i++)
              {
                fade(1,10,1,0,153,204,255);
                rect(950,330+i*30,110,30);
                fade(1,10,1,0,black,black,black);
                Text_box(950,330+i*30,110,30,16,tem[i]);
                if((mtime()-1000)/300<17)
                  arrow(900,345+30*(mtime()-1000)/300,940,345+30*(mtime()-1000)/300,70,114,196);
              }
            }
            break;
      case 1:
            Text_penguin(s3,7,3,1);
            Text_penguin(s4,10,13,1);
            Line(330,300,270,360,7,6,1);
            Line(360,300,420,360,7,6,1);
            if (dt_s(8,13))
            {
              fade(8,5,1,0,255,153,204); 
              stroke(0,0,0);rect(270,360,150,100);rect(270,460,150,50);
              fade(8,5,1,0,black,black,black);
              Text_box(270,360,150,100,16,"05BA 2F30 0003 0008 0293 0000 1C00 1008 137F 0000 0000  ....   ");
              Text_box(295,280,100,100,18,"super block");
              Text_box(270,460,150,50,16,"0x2F774 0xXXXXX 0xXXXXX 0xXXXXX");
              if (dt_s(10,12))
              {
                 int dx=250-260,dy=380-460;
                 double dt=(double)(mtime()-10000)/2000;
                 Text_box(270+(int)(-75*dt),460+(int)(-100*dt),75,25,16,"0x2F774");
              }
              if (dt_s(12,13))Text_box(270-75,460-100,75,25,16,"0x2F774");
            }
            break;
      case 2:Text_penguin(s5,13,3,1);
             stroke(black,alpha);fill(black,alpha);
             Text_box(270-75,460-100,75,25,16,"0x2F774");
             Line(360,300,300,360,13,4,1);
             Line(390,300,510,360,13,4,1);  
             if (dt_s(14,15))
             {
               for (int i=0;i<2;i++){
                  fill(255, 255, 153);rect(300+i*30,360,30,30);fill(black);Text_box(300+i*30,360,30,30,16,"1");}
               for (int i=2;i<7;i++){
                  fill(255, 255, 153);rect(300+i*30,360,30,30);fill(black);Text_box(300+i*30,360,30,30,16,"0");}
               for (int i=0;i<7;i++){
                  fill(255, 255, 153);rect(300+i*30,390,30,30);fill(black);Text_box(300+i*30,390,30,30,16,"0");}
               for (int i=0;i<7;i++){
                  fill(255, 255, 153);rect(300+i*30,420,30,30);fill(black);Text_box(300+i*30,420,30,30,16,".");}
             }
             if (dt_s(15,17))
             {
               arrow(375,310,375,350,black,black,black);
               for (int i=0;i<2;i++){
                  fill(255, 255, 153);rect(300+i*30,360,30,30);fill(black);Text_box(300+i*30,360,30,30,16,"1");}
               fill(255, 255, 153);rect(300+2*30,360,30,30);fade(15,2,1,0,black,black,black);Text_box(300+2*30,360,30,30,16,"1");
               for (int i=3;i<7;i++){
                  fill(255, 255, 153);rect(300+i*30,360,30,30);fill(black);Text_box(300+i*30,360,30,30,16,"0");}
               for (int i=0;i<7;i++){
                  fill(255, 255, 153);rect(300+i*30,390,30,30);fill(black);Text_box(300+i*30,390,30,30,16,"0");}
               for (int i=0;i<7;i++){
                  fill(255, 255, 153);rect(300+i*30,420,30,30);fill(black);Text_box(300+i*30,420,30,30,16,".");}
             }
             break;
      case 3:Text_penguin(s6,17,6,1);
             Line(690,300,580,360,17,6,1);
             Line(930,300,1280,360,17,6,1);  
             if (dt_s(18,23))
             {
               for (int i=0;i<14;i++){fill(204, 255, 255);rect(580+i*50,360,50,50);}
               fill(black); Text_box(580+2*50,360,50,50,24,"2");
               if(dt_s(19,23))
               {
                 Line(680,410,580,470,19,3,1);
                 Line(730,410,830,470,19,3,1);  
                 fill(black); 
                 if (dt_s(20,23))
                 {  
                   line(680,410,580,470);
                   line(730,410,830,470);   
                   String[] t={"i_mode","i_uid","i_size","i_mtime","i_gid","i_nlinks","i_zone[9]"};
                   String[] n={"0x8810","0000","...","5BFC1D33","00","01","..."};
                   for (int i=0;i<7;i++){
                    fill(204, 255, 255);rect(580,470+i*40,100,40);rect(680,470+i*40,150,40);
                    fill(black);Text_box(580,470+i*40,100,40,20,t[i]);
                    fade(20,3,1,0,black,black,black);Text_box(680,470+i*40,150,40,20,n[i]);
                    }
                 }
                }
              }
             break;
      case 4:Text_penguin(s7,23,5,1);
             Text_penguin(s8,28,3,1);
             Line(990,300,950,330,23,5,1);
             Line(1020,300,1060,330,23,5,1);
             if (dt_s(24,28))
             {
               String newtem[]={".","..",".profile",".bash_history","hello.c","mtools.howto","examples","README","shoelace.tar.Z",
                           "shoe","linux0.tgz","linux-0.00","gcclib140","MBR","part13","MBR3","mbr3","part14"};
               for (int i=0;i<18;i++)
               {
                 fade(24,4,1,0,153,204,255);
                 rect(950,330+i*30,110,30);
                 fade(24,4,1,0,black,black,black);
                 Text_box(950,330+i*30,110,30,16,newtem[i]);
               }
               if (dt_s(26,28))
               {
                   fade(26,2,1,0,153,204,255);
                   rect(950,330+18*30,110,30);
                   fade(26,2,1,0,black,black,black);
                   Text_box(950,330+18*30,110,30,16,"hello");
               }
             }
             break;
      case 5:stop();break;
    }
    //if (mtime()>30900) stop();
}

void scene_6()
{  
    int[] time_f={7,12};
    if (time()==0) frame_index=0;
    int time_n=time_f[frame_index];
    if (time()>=time_n){frame_index++;frame_index%=time_f.length;time_n=time_f[frame_index];}
    fill(black);textAlign(LEFT,TOP);
    Text(24,0,0,"Scene_6,frame_"+str(frame_index));  
    Text(24,0,24,"time="+str(float(millis()/100)/10)+" s");
    Text(24,0,24*2,"L_stime="+str(time())+",L_mtime="+str(mtime()));
    fill(white);
    /***basic***/
    /*penguin_X=1736;penguin_Y=863;penguin_size=0.75;
    int x1=penguin_X,y1=penguin_Y;*/ 
    tint(white,alpha);
    image(penguin,penguin_X,penguin_Y,penguin.width*penguin_size,penguin.height*penguin_size);
   
    fill(255, 153, 204); stroke(0,0,0);rect(400,150,40,40);           
    fill(204, 255, 255); stroke(0,0,0);rect(440,150,400,40);                      
    fill(255, 255, 153); stroke(0,0,0);rect(840,150,400,40);
 
    fill(black);
    Text_box(400-30,80,100,100,16,"boot section");
    Text_box(600,50,400,100,24,"hdc-0.11.img 121.72MB");
    Text_box(600,150,100,100,16,"60.56MB");
    line(440,190,300,250);
    line(840,190,1200,250);
         
    int[] box_x={300,330,360,450,690,930};
    int box_y=250,box_h=50,box_w=30;
    fill(255, 204, 153); stroke(0,0,0);rect(box_x[0],box_y,box_w,box_h);  
    fill(255, 153, 204); stroke(0,0,0);rect(box_x[1],box_y,box_w,box_h);
    fill(255, 255, 153); stroke(0,0,0);
    for (int i=0;i<3;i++)
        rect(box_x[2]+i*box_w,box_y,box_w,box_h);
    fill(204, 255, 204); stroke(0,0,0);
    for (int i=0;i<8;i++)
        rect(box_x[3]+i*box_w,box_y,box_w,box_h);
    fill(204, 255, 255); stroke(0,0,0);
    for (int i=0;i<8;i++)
        rect(box_x[4]+i*box_w,box_y,box_w,box_h);
    fill(153, 204, 255); stroke(0,0,0);
    for (int i=0;i<9;i++)
        rect(box_x[5]+i*box_w,box_y,box_w,box_h);
        
    fill(white);
    strokeWeight(4);
    stroke(201, 201, 201,alpha);
    ellipse(400,700,180,180);
    fill(black);
    Text_box(220,520,360,360,24,"TASK");
    strokeWeight(1);
    /***basic***/
    
    String s1="Now,we can fill in the contents of the file table.";
    String s2="And return the handle of the newly created file.";
    String s3="When you want to open the file,";
    String s4="you can find it in this directory and eventually return its handle.";
    
    switch(frame_index)
    {
      case 0:Text_penguin(s1,0,4,1);
             Text_penguin(s2,4,3,1);
             strokeWeight(2);fill(white);
             line_fade(0,7,2,0,70, 114, 196);
             fade(0,7,2,0,70,114,196);Text_box(615,440,100,100,24,"filp");fill(white);
             
             rect(535,520+0*38,35,38); fade(0,7,2,0,70,114,196);Text_box(535,520+0*38,35,38,16,"0");fill(white);
             rect(570,520+0*38,150,38);fade(0,7,2,0,70,114,196);Text_box(570,520+0*38,150,38,16,"0x27730(stdin)");fill(white);
             rect(535,520+1*38,35,38); fade(0,7,2,0,70,114,196);Text_box(535,520+1*38,35,38,16,"1");fill(white);
             rect(570,520+1*38,150,38);fade(0,7,2,0,70,114,196);Text_box(570,520+1*38,150,38,16,"0x27730(stdout)");fill(white);
             rect(535,520+2*38,35,38); fade(0,7,2,0,70,114,196);Text_box(535,520+2*38,35,38,16,"2");fill(white);
             rect(570,520+2*38,150,38);fade(0,7,2,0,70,114,196);Text_box(570,520+2*38,150,38,16,"0x27730(stderr)");fill(white);
             rect(535,520+3*38,35,38); fade(0,7,2,0,70,114,196);Text_box(535,520+3*38,35,38,16,"3");fill(white);
             rect(570,520+3*38,150,38);fade(0,7,2,0,70,114,196);Text_box(570,520+3*38,150,38,16,"0x27740(hello)");fill(white);
             rect(535,520+4*38,35,50); fade(0,7,2,0,70,114,196);Text_box(535,520+4*38,35,50,16,"");fill(white);
             rect(570,520+4*38,150,50);fade(0,7,2,0,70,114,196);Text_box(570,520+4*38,150,50,10,".\n.\n.\n");fill(white);
             rect(535,532+5*38,35,38); fade(0,7,2,0,70,114,196);Text_box(535,532+5*38,35,38,16,"19");fill(white);
             rect(570,532+5*38,150,38);fade(0,7,2,0,70,114,196);Text_box(570,531+5*38,150,38,16,"0x0(NULL)");fill(white);
             strokeWeight(1);
             
             fade(0,7,2,0,70, 114, 196);
             line_fade(0,7,2,0,70, 114, 196);
             strokeWeight(2);
             Text_box(820+6*40,450,100,100,20,"File table");                          
             fill(white);
             for (int i=0;i<15;i++)
             rect(820+i*40,520,40,30);        
             Line(900,550,850,630,0,7,0);
             Line(940,550,990,630,0,7,0);
             String[] tem={"f_mode","f_flags","f_count","f_inode","off_t"};
             for (int i=0;i<5;i++)
             {
               fill(white);
               line_fade(0,7,2,0,70, 114, 196);
               rect(850,630+i*40,80,40);rect(930,630+i*40,60,40);
               fade(0,7,2,0,70, 114, 196);
               Text_box(850,630+i*40,80,40,18,tem[i]);
             }
             Text_box(930,630+2*40,60,40,20,"0");
             if(dt_s(4,7))
             {
               arrow(740,540+38*3,830,650,70,114,196);
               String s[]={"0x8810","577","0","xxxx","xxxx"};
               for (int i=0;i<5;i++)
               {
                 fade(4,3,1,0,70, 114, 196);
                 Text_box(930,630+i*40,60,40,20,s[i]);
               }
             }
             strokeWeight(1);
             break;
      case 1:Text_penguin(s3,7,2,1);
             Text_penguin(s4,9,3,1);
             break;
    }
    //if (mtime()>11900)stop();
}

void scene_7()
{
    int[] time_f={3,6,9,16,24,26,31};
    if (time()==0) frame_index=0;
    int time_n=time_f[frame_index];
    if (time()>=time_n){frame_index++;frame_index%=time_f.length;time_n=time_f[frame_index];}
    fill(black);textAlign(LEFT,TOP);
    Text(24,0,0,"Scene_7,frame_"+str(frame_index));  
    Text(24,0,24,"time="+str(float(millis()/100)/10)+" s");
    Text(24,0,24*2,"L_stime="+str(time())+",L_mtime="+str(mtime()));
    fill(white);
    
    /***basic***/
    penguin_X=1736;penguin_Y=863;penguin_size=0.75;
    int x1=penguin_X,y1=penguin_Y; 
    tint(white,alpha);
    image(penguin,penguin_X,penguin_Y,penguin.width*penguin_size,penguin.height*penguin_size);
   
    fill(255, 153, 204); stroke(0,0,0);rect(400,150,40,40);           
    fill(204, 255, 255); stroke(0,0,0);rect(440,150,400,40);                      
    fill(255, 255, 153); stroke(0,0,0);rect(840,150,400,40);
 
    fill(black);
    Text_box(400-30,80,100,100,16,"boot section");
    Text_box(600,50,400,100,24,"hdc-0.11.img 121.72MB");
    Text_box(600,150,100,100,16,"60.56MB");
    line(440,190,300,250);
    line(840,190,1200,250);
    
    int[] box_x={300,330,360,450,690,930};
    int box_y=250,box_h=50,box_w=30;
    fill(255, 204, 153); stroke(0,0,0);rect(box_x[0],box_y,box_w,box_h);  
    fill(255, 153, 204); stroke(0,0,0);rect(box_x[1],box_y,box_w,box_h);
    fill(255, 255, 153); stroke(0,0,0);
    for (int i=0;i<3;i++)
        rect(box_x[2]+i*box_w,box_y,box_w,box_h);
    fill(204, 255, 204); stroke(0,0,0);
    for (int i=0;i<8;i++)
        rect(box_x[3]+i*box_w,box_y,box_w,box_h);
    fill(204, 255, 255); stroke(0,0,0);
    for (int i=0;i<8;i++)
        rect(box_x[4]+i*box_w,box_y,box_w,box_h);
    fill(153, 204, 255); stroke(0,0,0);
    for (int i=0;i<9;i++)
        rect(box_x[5]+i*box_w,box_y,box_w,box_h);
    /***basic***/
    
    String s1="Later, let's see how to write a file";
    String s2="the task with the file handle which is the std:out and contents and the length of bytes";
    String s3="finds the file structure pointer";
    String s4="Then find the corresponding file table item";
    String s5="Next,judge the inode type, regular file";
    String s6="judge append or current pointer to append";
    String s7="pos/BLOCK_SIZE, create a new block";
   // String s8="find the super block, scan the first empty logic bit map";
    
    switch(frame_index)
    {
      case 0:fill(black);
             Text_penguin(s1,0,3,1);
             break;
      case 1:fill(black);
             Text_penguin(s2,3,3,1);
             fill(white);strokeWeight(4);stroke(201, 201, 201,alpha);
             line_fade(3,3,1,0,201,201,201);
             ellipse(400,700,180,180);
             fill(black);fade(3,3,1,0,0,0,0);
             Text_box(220,520,360,360,24,"TASK");
             strokeWeight(1);
             break;
      case 2:fill(black);
             Text_penguin(s3,6,3,1);
             strokeWeight(2);fill(white);
             line_fade(6,3,1,0,70, 114, 196);
             fade(6,3,1,0,70,114,196);Text_box(615,440,100,100,24,"filp");fill(white);
             rect(580,520+0*38,35,38); fade(6,3,1,0,70,114,196);Text_box(580,520+0*38,35,38,16,str(0));fill(white);
             rect(615,520+0*38,100,38);fade(6,3,1,0,70,114,196);Text_box(615,520+0*38,100,38,16,".");fill(white);
             rect(580,520+1*38,35,38); fade(6,3,1,0,70,114,196);Text_box(580,520+1*38,35,38,16,str(1));fill(white);
             rect(615,520+1*38,100,38);fade(6,3,1,0,70,114,196);Text_box(615,520+1*38,100,38,16,"0x28740");fill(white);
             rect(580,520+2*38,35,38); fade(6,3,1,0,70,114,196);Text_box(580,520+2*38,35,38,16,str(2));fill(white);
             rect(615,520+2*38,100,38);fade(6,3,1,0,70,114,196);Text_box(615,520+2*38,100,38,16,".");fill(white);
             rect(580,520+3*38,35,38); fade(6,3,1,0,70,114,196);Text_box(580,520+3*38,35,38,16,str(3));fill(white);
             rect(615,520+3*38,100,38);fade(6,3,1,0,70,114,196);Text_box(615,520+3*38,100,38,16,".");fill(white);
             rect(580,520+4*38,35,50); fade(6,3,1,0,70,114,196);Text_box(580,520+4*38,35,50,16,"");fill(white);
             rect(615,520+4*38,100,50);fade(6,3,1,0,70,114,196);Text_box(615,520+4*38,100,50,10,".\n.\n.\n");fill(white);
             rect(580,532+5*38,35,38); fade(6,3,1,0,70,114,196);Text_box(580,532+5*38,35,38,16,"19");fill(white);
             rect(615,532+5*38,100,38);fade(6,3,1,0,70,114,196);Text_box(615,531+5*38,100,38,16,"0x0");fill(white);
             strokeWeight(1);
             break;
 
      case 3:fill(black);
             Text_penguin(s4,12,3,1);
             fade(9,6,1,0,70, 114, 196);
             line_fade(9,6,1,0,70, 114, 196);
             strokeWeight(2);
             Text_box(820+6*40,450,100,100,20,"File table");                          
             fill(white);
             for (int i=0;i<15;i++) rect(820+i*40,520,40,30);
             if (dt_s(10,15))
             {         
               Line(900,550,850,630,10,5,1);
               Line(940,550,990,630,10,5,1);
               if (dt_s(11,15))
               {
                 String[] tem={"f_mode","f_flags","f_count","f_inode","off_t"};
                 for (int i=0;i<5;i++)
                 {
                   fill(white);
                   rect(850,630+i*40,80,40);rect(930,630+i*40,60,40);
                   fill(70,114,196);
                   Text_box(850,630+i*40,80,40,18,tem[i]);
                 }
                 Text_box(930,630+1*40,60,40,20,"577");
               }
             }
             strokeWeight(1);
             break; 
      case 4:fill(black);
             Text_penguin(s5,21,2,1);
             stroke(black,alpha);
             Line(690,300,430,360,16,9,1);
             Line(930,300,1130,360,16,9,1);  
             if (dt_s(17,24))
             {
               stroke(black,alpha);
               for (int i=0;i<14;i++){fill(204, 255, 255);rect(430+i*50,360,50,50);}
             }
             if (dt_s(18,24))
             {
               stroke(black,alpha);
               Line(680,410,600,460,18,5,1);
               Line(730,410,790,460,18,5,1);
               if (dt_s(19,24))
               {
                 fade(19,5,1,0,70,114,196);
                 String tem[]={"i_mode","i_pipe","i_size","i_mtime","i_zone[9]","i_wait","..."};
                 for (int i=0;i<7;i++)
                 {
                    fade(19,5,1,0,204, 255, 255);
                    rect(600,460+50*i,100,50);
                    rect(700,460+50*i,90,50);
                    fade(19,5,1,0,70,114,196);
                    Text_box(600,460+50*i,100,50,18,tem[i]);
                 }
                 Text_box(700,460+50,100,50,18,"0");
                 Text_box(700,460,100,50,18,"100600");
               if (dt_s(20,21))arrow(850,460+70,800,460+70,70,114,196);
               if (dt_s(21,22))arrow(850,460+20,800,460+20,70,114,196);   
               }
             }
             break;     
      case 5:
             fill(black);
           
             strokeWeight(2);
             fill(70,114,196);
             Text_box(820+6*40,450,100,100,20,"File table");                          
             fill(white);
              stroke(70, 114, 196);
             for (int i=0;i<15;i++)
               rect(820+i*40,520,40,30);
           
               
                 //if (dt_s(14,15)) arrow(880,630,880,580,70,114,196);
                // if (dt_s(15,16)) arrow(920,630,920,580,70,114,196);
                        
                   Line(900,550,850,630,27,11,0);
                   Line(940,550,990,630,27,11,0);
                 
                     String[] tem={"f_mode","f_flags","f_count","f_inode","off_t","f_pos"};
                     for (int i=0;i<6;i++)
                     {
                       fill(white);
                       rect(850,630+i*40,80,40);rect(930,630+i*40,60,40);
                       fill(70,114,196);
                       Text_box(850,630+i*40,80,40,18,tem[i]);
                     }
                     Text_box(930,630+1*40,60,40,20,"577");
                       Text_penguin(s6,27,3,1);
                     if (dt_s(27,28)) 
                     {
                       
                       arrow(1020,690,1000,690,70,114,196);
                         
                   }
                     if (dt_s(28,29)) 
                     Text_box(930,630+5*40,60,40,20,"0");
                    // Text_box(930,630+2*40,60,40,20,"0");
                   //arrow(680,540+38*3,830,650,70,114,196);
                  
                
             
             strokeWeight(1);
            break;
            
      case 6:
           fill(black);
             Text_penguin(s7,30,3,1);
           //  Text_penguin(s8,21,3,1);
          
             stroke(black,alpha);
             Line(690,300,430,360,18,9,1);
             Line(930,300,1130,360,18,9,1);  
            
             
               stroke(black,alpha);
               for (int i=0;i<14;i++){
                  fill(204, 255, 255);rect(430+i*50,360,50,50);}
             
         
            
               stroke(black,alpha);
             line(680,410,600,460);
              line(730,410,790,460);
           
//                 fill(70,114,196);
                 fade(23,4,1,0,70,114,196);
                
                 String tem1[]={"i_mode","i_pipe","i_size","i_mtime","i_zone[9]","i_dev","..."};
                 for (int i=0;i<7;i++)
                 {
                    //fill(204, 255, 255);
                    fill(204, 255, 255);
                    //stroke(black,black,black,alpha);
                    rect(600,460+50*i,100,50);
                    rect(700,460+50*i,90,50);
                    fill(0,114,196);
                   // fill(black);
                    Text_box(600,460+50*i,100,50,20,tem1[i]);
                 }
                 Text_box(700,460,100,50,20,"100600");
               // if (dt_s(23,24)) arrow(850,460+70,800,460+70,70,114,196);
               // if (dt_s(24,25)) arrow(850,460+20,800,460+20,70,114,196);
                 Text_box(700,460+50,100,50,20,"0");
                 Text_box(700,460+50*5,100,50,20,"769");
                      if (dt_s(30,31))
               {
                
                 arrow(700+200,480+50*5,700+100,480+50*5,black,black,black);
               }
                /* if (dt_s(31,34))
               {
                 int tx=1000-790,ty=300-680;
                 double time=(double)(mtime()-31000)/3000;
                 arrow(790,680,(int)(790+tx*time),(int)(680+ty*time),black,black,black);
               }*/
               
               
             
             
             break;
          
      case 8:stop();  
             break;
    }
    if (time()>=6)
    {
       fill(white);
       strokeWeight(4);
       stroke(201, 201, 201,alpha);
       ellipse(400,700,180,180);
       fill(black);
       Text_box(220,520,360,360,24,"TASK");
       strokeWeight(1);
       if (dt_s(9,15))
       {
             strokeWeight(2);fill(white);
             stroke(70, 114, 196);
             fill(70,114,196);Text_box(615,440,100,100,24,"filp");fill(white);
       
             rect(580,520+0*38,35,38); fill(70,114,196);Text_box(580,520+0*38,35,38,16,str(0));fill(white);
             rect(615,520+0*38,100,38);fill(70,114,196);Text_box(615,520+0*38,100,38,16,".");fill(white);
             rect(580,520+1*38,35,38); fill(70,114,196);Text_box(580,520+1*38,35,38,16,str(1));fill(white);
             rect(615,520+1*38,100,38);fill(70,114,196);;Text_box(615,520+1*38,100,38,16,"0x28740");fill(white);
             rect(580,520+2*38,35,38); fill(70,114,196);Text_box(580,520+2*38,35,38,16,str(2));fill(white);
             rect(615,520+2*38,100,38);fill(70,114,196);Text_box(615,520+2*38,100,38,16,".");fill(white);
             rect(580,520+3*38,35,38); fill(70,114,196);Text_box(580,520+3*38,35,38,16,str(3));fill(white);
             rect(615,520+3*38,100,38);fill(70,114,196);Text_box(615,520+3*38,100,38,16,".");fill(white);
             rect(580,520+4*38,35,50);fill(70,114,196);Text_box(580,520+4*38,35,50,16,"");fill(white);
             rect(615,520+4*38,100,50);fill(70,114,196);Text_box(615,520+4*38,100,50,10,".\n.\n.\n");fill(white);
             rect(580,532+5*38,35,38); fill(70,114,196);Text_box(580,532+5*38,35,38,16,"19");fill(white);
             rect(615,532+5*38,100,38);fill(70,114,196);Text_box(615,531+5*38,100,38,16,"0x0");fill(white);
             if (dt_s(9,15))
             {
               //rect(300,520+3*38,100,38);
               rect(615,520+3*38,100,38);fill(70,114,196);
               if (dt_s(9,13))//arrow(640,540+38*3,690,540+38*3,70,114,196);
              if (dt_s(13,14))
               { 
                int tem=mtime()-16000;
                 double x=(double)tem/1000;
                 double dx=(830-690)*x,dy=(650-540-38*3)*x;
                 arrow(640,540+38*3,690+(int)dx,540+38*3+(int)dy,70,114,196);
               }
               if (dt_s(12,14)) 
               {
                  int tx=830-740,ty=650-540-38;
                 double time=(double)(mtime()-12000)/2000;
                 arrow(740,540+38*1,(int)(740+tx*time),(int)(540+38*1+ty*time),70,114,196);
             
           }
              if (dt_s(14,15)) arrow(740,540+38*1,830,650,70,114,196);
             // if (dt_s(17,18)) Text_box(615,520+3*38,100,38,16,"0x27740");
             }
            // if(dt_s(18,19)
             fill(white);
             strokeWeight(2);
             rect(580,520+4*38,35,50); fill(70,114,196);Text_box(580,520+4*38,35,50,16,"");fill(white);
             rect(615,520+4*38,100,50);fill(70,114,196);Text_box(615,520+4*38,100,50,10,".\n.\n.\n");fill(white);
             rect(580,532+5*38,35,38); fill(70,114,196);Text_box(580,532+5*38,35,38,16,"19");fill(white);
             rect(615,532+5*38,100,38);fill(70,114,196);Text_box(615,531+5*38,100,38,16,"0x0");fill(white);
             strokeWeight(1);
       }
       
       
       if(dt_s(24,26))
       {
          strokeWeight(2);fill(white);
             stroke(70, 114, 196);
             fill(70,114,196);Text_box(615,440,100,100,24,"filp");fill(white);
       
             rect(580,520+0*38,35,38); fill(70,114,196);Text_box(580,520+0*38,35,38,16,str(0));fill(white);
             rect(615,520+0*38,100,38);fill(70,114,196);Text_box(615,520+0*38,100,38,16,".");fill(white);
             rect(580,520+1*38,35,38); fill(70,114,196);Text_box(580,520+1*38,35,38,16,str(1));fill(white);
             rect(615,520+1*38,100,38);fill(70,114,196);;Text_box(615,520+1*38,100,38,16,"0x28740");fill(white);
             rect(580,520+2*38,35,38); fill(70,114,196);Text_box(580,520+2*38,35,38,16,str(2));fill(white);
             rect(615,520+2*38,100,38);fill(70,114,196);Text_box(615,520+2*38,100,38,16,".");fill(white);
             rect(580,520+3*38,35,38); fill(70,114,196);Text_box(580,520+3*38,35,38,16,str(3));fill(white);
             rect(615,520+3*38,100,38);fill(70,114,196);Text_box(615,520+3*38,100,38,16,".");fill(white);
             rect(580,520+4*38,35,50);fill(70,114,196);Text_box(580,520+4*38,35,50,16,"");fill(white);
             rect(615,520+4*38,100,50);fill(70,114,196);Text_box(615,520+4*38,100,50,10,".\n.\n.\n");fill(white);
             rect(580,532+5*38,35,38); fill(70,114,196);Text_box(580,532+5*38,35,38,16,"19");fill(white);
             rect(615,532+5*38,100,38);fill(70,114,196);Text_box(615,531+5*38,100,38,16,"0x0");fill(white);
             if (dt_s(9,15))
             {
               //rect(300,520+3*38,100,38);
               rect(615,520+3*38,100,38);fill(70,114,196);
               if (dt_s(12,16))//arrow(640,540+38*3,690,540+38*3,70,114,196);
              if (dt_s(16,17))
               { 
                int tem=mtime()-16000;
                 double x=(double)tem/1000;
                 double dx=(830-690)*x,dy=(650-540-38*3)*x;
                 arrow(640,540+38*3,690+(int)dx,540+38*3+(int)dy,70,114,196);
               }
               if (dt_s(17,18)) arrow(740,540+38*1,830,650,70,114,196);
             // if (dt_s(17,18)) Text_box(615,520+3*38,100,38,16,"0x27740");
             }
            // if(dt_s(18,19)
             fill(white);
             strokeWeight(2);
             rect(580,520+4*38,35,50); fill(70,114,196);Text_box(580,520+4*38,35,50,16,"");fill(white);
             rect(615,520+4*38,100,50);fill(70,114,196);Text_box(615,520+4*38,100,50,10,".\n.\n.\n");fill(white);
             rect(580,532+5*38,35,38); fill(70,114,196);Text_box(580,532+5*38,35,38,16,"19");fill(white);
             rect(615,532+5*38,100,38);fill(70,114,196);Text_box(615,531+5*38,100,38,16,"0x0");fill(white);
             strokeWeight(1);
       
       }
       
     //   arrow(790,680,(int)(790+tx*time),(int)(680+ty*time),black,black,black);
       
       
    }
     
     
     
     
     
     
     
     
     
     
     
     
     
     
    // if (mtime()>34990) stop();
     
}
void scene_8()
{  
  
  
  
 int[] time_f={6,16};
    if (time()==0) frame_index=0;
    int time_n=time_f[frame_index];
    if (time()>=time_n){frame_index++;frame_index%=time_f.length;time_n=time_f[frame_index];}
    fill(black);textAlign(LEFT,TOP);
    Text(24,0,0,"Scene_8,frame_"+str(frame_index));  
    Text(24,0,24,"time="+str(float(millis()/100)/10)+" s");
    Text(24,0,24*2,"L_stime="+str(time())+",L_mtime="+str(mtime()));
    fill(white);
        /***basic***/
    penguin_X=1736;penguin_Y=863;penguin_size=0.75;
    int x1=penguin_X,y1=penguin_Y; 
    tint(white,alpha);
    image(penguin,penguin_X,penguin_Y,penguin.width*penguin_size,penguin.height*penguin_size);
   
    fill(255, 153, 204); stroke(0,0,0);rect(400,150,40,40);           
    fill(204, 255, 255); stroke(0,0,0);rect(440,150,400,40);                      
    fill(255, 255, 153); stroke(0,0,0);rect(840,150,400,40);
 
    fill(black);
    Text_box(400-30,80,100,100,16,"boot section");
    Text_box(600,50,400,100,24,"hdc-0.11.img 121.72MB");
    Text_box(600,150,100,100,16,"60.56MB");
    line(440,190,300,250);
    line(840,190,1200,250);
         
    int[] box_x={300,330,360,450,690,930};
    int box_y=250,box_h=50,box_w=30;
    fill(255, 204, 153); stroke(0,0,0);rect(box_x[0],box_y,box_w,box_h);  
    fill(255, 153, 204); stroke(0,0,0);rect(box_x[1],box_y,box_w,box_h);
    fill(255, 255, 153); stroke(0,0,0);
    for (int i=0;i<3;i++)
        rect(box_x[2]+i*box_w,box_y,box_w,box_h);
    fill(204, 255, 204); stroke(0,0,0);
    for (int i=0;i<8;i++)
        rect(box_x[3]+i*box_w,box_y,box_w,box_h);
    fill(204, 255, 255); stroke(0,0,0);
    for (int i=0;i<8;i++)
        rect(box_x[4]+i*box_w,box_y,box_w,box_h);
    fill(153, 204, 255); stroke(0,0,0);
    for (int i=0;i<9;i++)
        rect(box_x[5]+i*box_w,box_y,box_w,box_h);
        
     fill(white);
     strokeWeight(4);
     stroke(201, 201, 201,alpha);
     ellipse(400,700,180,180);
     fill(black);
     Text_box(220,520,360,360,24,"TASK");
     strokeWeight(1);
    /***basic***/
    String s1="find the super block, scan the first empty logic bit map";
    String s2=" ";
    String s3="";
    String s4="First,get the inode bitmap from the superblock.";
    String s5="And find the first empty bit in the bitmap.";
    String s6="set the bit";
    String s7="Finally, add this item in the current directory.";
    String s8="OK!The hello file has been successfully created!";
     switch(frame_index)
    {
          case 0:
            Text_penguin(s1,0,3,1);
            Text_penguin(s4,3,6,1);
           // Line(330,300,270,360,7,6,1);
           // Line(360,300,420,360,7,6,1);
            if (dt_s(0,5))
            {
              fade(0,5,1,0,255,153,204); 
              stroke(0,0,0);rect(270,360,150,100);rect(270,460,150,50);
              fade(0,5,1,0,black,black,black);
              Text_box(270,360,150,100,16,"05BA 2F30 0003 0008 0293 0000 1C00 1008 137F 0000 0000  ....   ");
              Text_box(295,280,100,100,18,"super block");
              Text_box(270,460,150,50,16,"0x2F774 0xXXXXX 0xXXXXX 0xXXXXX");
              if (dt_s(2,4))
              {
                 int dx=460-310,dy=310-460;
                 double dt=(double)(mtime()-2000)/2000;
                arrow(310,460,310+(int)(dx*dt),(int)(460+dy*dt),black,black,black);
              }
             // if (dt_s(12,13))arrow(310,460,370,310,black,black,black);
            }
            break;
     case 1:
     
     
     
     if (dt_s(6,7))
      arrow(460,350,460,310,black,black,black);
      if (dt_s(7,8))
      arrow(490,350,490,310,black,black,black);
      if (dt_s(8,9))
      arrow(530,350,530,310,black,black,black);
     
     Text_penguin(s5,6,8,1);
      Text_penguin(s6,14,2,1);
     if(dt_s(9,16)){
             Line(510,300,450,360,9,9,1);
             Line(540,300,660,360,9,9,1);  }
             if (dt_s(10,13))
             {
               for (int i=0;i<2;i++){
                  fill(204, 255, 204);rect(450+i*30,360,30,30);fill(black);Text_box(450+i*30,360,30,30,16,"1");}
               for (int i=2;i<7;i++){
                   fill(204, 255, 204);rect(450+i*30,360,30,30);fill(black);Text_box(450+i*30,360,30,30,16,"1");}
               for (int i=0;i<7;i++){
                  fill(204, 255, 204);rect(450+i*30,390,30,30);fill(black);Text_box(450+i*30,390,30,30,16,".");}
               for (int i=0;i<3;i++){
                   fill(204, 255, 204);rect(450+i*30,420,30,30);fill(black);Text_box(450+i*30,420,30,30,16,".");}
                   fill(204, 255, 204);rect(450+3*30,420,30,30);fill(black);Text_box(450+3*30,420,30,30,16,"0");
                  for (int i=4;i<7;i++){
                   fill(204, 255, 204);rect(450+i*30,420,30,30);fill(black);Text_box(450+i*30,420,30,30,16,".");}
                   
             }
             if (dt_s(13,16))
             {
                arrow(560,480,560,460,black,black,black);
               for (int i=0;i<2;i++){
                    fill(204, 255, 204);rect(450+i*30,360,30,30);fill(black);Text_box(450+i*30,360,30,30,16,"1");}
               for (int i=2;i<7;i++){
                    fill(204, 255, 204);rect(450+i*30,360,30,30);fill(black);Text_box(450+i*30,360,30,30,16,"1");}
               for (int i=0;i<7;i++){
                    fill(204, 255, 204);rect(450+i*30,390,30,30);fill(black);Text_box(450+i*30,390,30,30,16,".");}
               for (int i=0;i<3;i++){
                   fill(204, 255, 204);rect(450+i*30,420,30,30);fill(black);Text_box(450+i*30,420,30,30,16,".");}
                   if(dt_s(13,14)){
                   fill(204, 255, 204);rect(450+3*30,420,30,30);fill(black);Text_box(450+3*30,420,30,30,16,"0");}
                  
                  if(dt_s(14,16)){
                   fill(204, 255, 204);rect(450+3*30,420,30,30);fill(black);Text_box(450+3*30,420,30,30,16,"1");}
                   
                  for (int i=4;i<7;i++){
                   fill(204, 255, 204);rect(450+i*30,420,30,30);fill(black);Text_box(450+i*30,420,30,30,16,".");}
             
           
         }
                   
          
            break;
    }
 //if (mtime()>19990) stop();
}
void scene_9()
{  
    int[] time_f={5,11,20,23};
    if (time()==0) frame_index=0;
    int time_n=time_f[frame_index];
    if (time()>=time_n){frame_index++;frame_index%=time_f.length;time_n=time_f[frame_index];}
    fill(black);textAlign(LEFT,TOP);
    Text(24,0,0,"Scene_9,frame_"+str(frame_index));  
    Text(24,0,24,"time="+str(float(millis()/100)/10)+" s");
    Text(24,0,24*2,"L_stime="+str(time())+",L_mtime="+str(mtime()));
    fill(white);
         /***basic***/
    penguin_X=1736;penguin_Y=863;penguin_size=0.75;
    int x1=penguin_X,y1=penguin_Y; 
    tint(white,alpha);
    image(penguin,penguin_X,penguin_Y,penguin.width*penguin_size,penguin.height*penguin_size);
   
    fill(255, 153, 204); stroke(0,0,0);rect(400,150,40,40);           
    fill(204, 255, 255); stroke(0,0,0);rect(440,150,400,40);                      
    fill(255, 255, 153); stroke(0,0,0);rect(840,150,400,40);
 
    fill(black);
    Text_box(400-30,80,100,100,16,"boot section");
    Text_box(600,50,400,100,24,"hdc-0.11.img 121.72MB");
    Text_box(600,150,100,100,16,"60.56MB");
    line(440,190,300,250);
    line(840,190,1200,250);
         
    int[] box_x={300,330,360,450,690,930};
    int box_y=250,box_h=50,box_w=30;
    fill(255, 204, 153); stroke(0,0,0);rect(box_x[0],box_y,box_w,box_h);  
    fill(255, 153, 204); stroke(0,0,0);rect(box_x[1],box_y,box_w,box_h);
    fill(255, 255, 153); stroke(0,0,0);
    for (int i=0;i<3;i++)
        rect(box_x[2]+i*box_w,box_y,box_w,box_h);
    fill(204, 255, 204); stroke(0,0,0);
    for (int i=0;i<8;i++)
        rect(box_x[3]+i*box_w,box_y,box_w,box_h);
    fill(204, 255, 255); stroke(0,0,0);
    for (int i=0;i<8;i++)
        rect(box_x[4]+i*box_w,box_y,box_w,box_h);
    fill(153, 204, 255); stroke(0,0,0);
    for (int i=0;i<9;i++)
        rect(box_x[5]+i*box_w,box_y,box_w,box_h);
        
    fill(white);
    strokeWeight(4);
    stroke(201, 201, 201,alpha);
   // ellipse(400,700,180,180);
    //fill(black);
    //Text_box(220,520,360,360,24,"TASK");
    strokeWeight(1);
    /***basic***/
    String s1="Scan the free block list to find the free buffer";
    String s2="the first item is selected"; 
    String s3="Modify the buffer header content ";
    String s4="set i_dirt one and set i_size six to modfiy imode information";
    String s5="write the content into the buffer";
    String s6="set time";
    String s7="modify the file table f_pos";
    String s8="The last part is the actual data area.";
    String s9="If you use a hard disk to boot the system,";
    String s10="the FS will occupy one of the partitions.";
    switch(frame_index)
    {
      case 0:
      
      Text_penguin(s1,0,4,1);
        Text_penguin(s2,4,8,1);
       fill(black);
               rect(250,480,100,100);
              // Text_box(240,450,210,240,15,"05BA:iNode_number           2F30:logical_blocks        0003:inode_bitmap_blocks   0008:logical_bitmap_blocks 0293:first_logical_block   0000:log                  1c00_1008:max_length            137f:magic_number         ");
               String[] name={"b_data","b_count","b_dirt","b_lock","b_uptodate","b_dev","b_prev_free","b_next_free"};
               String[] num={"1466","12080","3","8","659","0","469766152","4991"};
               String[] numo={"05BA","2F30","0003","0008","0293","0000","1C00 1008","137F"};
              
               int ind=6;
             fill(255, 204, 153); stroke(0,0,0);
             rect(100,480+40,80,30);
             fill(black);
             Text_box(100,480+40,80,30,16,"free_list");
             arrow(180,480+30,190,480+5,black,black,black);
               for (int i=0;i<8;i++)
               {
                  fill(255, 153, 204);
                  rect(200,480+30*i,180,30);
                  rect(420,480+30*i,180,30);
                  rect(640,480+30*i,180,30);
                  rect(860,480+30*i,180,30);
                  fill(black);
                  Text_box(200,480+30*i,180,30,16,name[i]);
                  Text_box(420,480+30*i,180,30,16,name[i]);
                  Text_box(640,480+30*i,180,30,16,name[i]);
                  Text_box(860,480+30*i,180,30,16,name[i]);
               }
               arrow(380,480+30*8-15,410,480+30*8-15,black,black,black);
               arrow(610,480+30*8-15,630,480+30*8-15,black,black,black); 
               arrow(820,480+30*8-15,850,480+30*8-15,black,black,black);
               arrow(860,480+30*7-15,830,480+30*7-15,black,black,black);
               arrow(630,480+30*7-15,610,480+30*7-15,black,black,black); 
               arrow(410+5,480+30*7-15,380+5,480+30*7-15,black,black,black);
              if(dt_s(2,5))
              {
               arrow(290,470,290,450,black,black,black);
              }
               if(dt_s(3,5))
              {
               //arrow(290,460,290,440,black,black,black);
               
                fill(204, 255, 204); stroke(0,0,0);
                  rect(200,480-150+30*0,180,90);
                   fill(black);
                  Text_box(200,480-120+30*0,180,30,16,"buffer");
              }
      break;
      
      case 1:
         Text_penguin(s2,5,5,1);
         Text_penguin(s3,10,1,1);
                   String[] name1={"b_data","b_count","b_dirt","b_lock","b_uptodate","b_dev","b_prev_free","b_next_free"};
         if (dt_s(6,7)){
                   for (int i=0;i<8;i++)
               {
                  fill(255, 153, 204);
                  rect(200,480+30*i,180,30);
                
                  fill(black);
                  Text_box(200,480+30*i,180,30,16,name1[i]);

               }
                   fill(204, 255, 204); stroke(0,0,0);
                  rect(200,480-150+30*0,180,90);
                   fill(black);
                  Text_box(200,480-120+30*0,180,30,16,"buffer");
         }
          if (dt_s(7,10))
               {
                 int tx=600-200,ty=200;
                 double time=(double)(mtime()-6000)/4000;
                 
                 for (int i=0;i<8;i++)
               {
                  fill(255, 153, 204);
                  rect((int)(200+tx*time),(int)(480+30*i+ty*time),180,30);
                
                  fill(black);
                  Text_box((int)(200+tx*time),(int)(480+30*i+ty*time),180,30,16,name1[i]);

               }
                   fill(204, 255, 204); stroke(0,0,0);
                  rect((int)(200+tx*time),(int)(480-150+30*0+ty*time),180,90);
                   fill(black);
                  Text_box((int)(200+tx*time),(int)(480-120+30*0+ty*time),180,30,16,"buffer");
                 
                // arrow(790,680,(int)(790+tx*time),(int)(680+ty*time),black,black,black);
                } 
              if (dt_s(10,11))
               {
      String[] name2={"","1","1","0","1","","",""};
   
                  for (int i=0;i<8;i++)
               {
               
                   fill(255, 153, 204);
                  rect(600,680+30*i,180,30);
                  rect(780,680+30*i,80,30);
                  fill(black);
                  Text_box(600,680+30*i,180,30,16,name1[i]);
                  Text_box(780,680+30*i,80,30,16,name2[i]);
               }
                arrow(660,670,660,650,black,black,black);
                   fill(204, 255, 204); stroke(0,0,0);
                  rect((int)(600),(int)(680-150+30*0),180,90);
                   fill(black);
                  Text_box((int)(600),(int)(680-120+30*0),180,30,16,"buffer");
               
               
               }
           
         
     
      
        
      break;
      
      case 2:
      
      
      String[] name3={"b_data","b_count","b_dirt","b_lock","b_uptodate","b_dev","b_prev_free","b_next_free"};
 
      String[] name2={"","1","1","0","1","","",""};
          for (int i=0;i<8;i++)
               {
               
                   fill(255, 153, 204);
                  rect(1400,80+30*i,180,30);
                  rect(1580,80+30*i,80,30);
                  fill(black);
                  Text_box(1400,80+30*i,180,30,16,name3[i]);
                  Text_box(1580,80+30*i,80,30,16,name2[i]);
               }
                arrow(1450,70,1450,55,black,black,black);
                   fill(204, 255, 204); stroke(0,0,0);
                  rect((int)(1400),(int)(80-80+30*0),180,50);
                   fill(black);
                //  Text_box((int)(1400),(int)(80-60+30*0),180,20,16,"buffer");
       
               
              Text_penguin(s4,11,2,1);   
                Text_penguin(s5,14,1,1); 
                 Text_penguin(s6,15,1,1); 
                 stroke(black,alpha);
           //  Line(690,300,430,360,18,9,1);
            // Line(930,300,1130,360,18,9,1);  
            
             
               stroke(black,alpha);
               for (int i=0;i<14;i++){
                  fill(204, 255, 255);rect(430+i*50,360,50,50);}
             
         
            
               stroke(black,alpha);
             line(680,410,600,460);
              line(730,410,790,460);
           
//                 fill(70,114,196);
                 fade(23,4,1,0,70,114,196);
                
                 String tem1[]={"i_mode","i_pipe","i_dirt","i_ctime","i_size","i_mtime","i_zone[9]","i_dev","..."};
                 for (int i=0;i<7;i++)
                 {
                    //fill(204, 255, 255);
                    fill(204, 255, 255);
                    //stroke(black,black,black,alpha);
                    rect(600,460+50*i,100,50);
                    rect(700,460+50*i,90,50);
                    fill(0,114,196);
                   // fill(black);
                    Text_box(600,460+50*i,100,50,20,tem1[i]);
                 }
                 Text_box(700,460,100,50,20,"100600");
               // if (dt_s(23,24)) arrow(850,460+70,800,460+70,70,114,196);
               // if (dt_s(24,25)) arrow(850,460+20,800,460+20,70,114,196);
                 Text_box(700,460+50,100,50,20,"0");
                 //Text_box(700,460+50*7,100,50,20,"769");
                      if (dt_s(30,31))
               {
                
                 arrow(700+200,480+50*5,700+100,480+50*5,black,black,black);
               }
                 if(dt_s(14,20))
               {
               
                  Text_box((int)(1400),(int)(80-60+30*0),180,20,16,"hello");
                // Text_box(700,460+50*2,100,50,20,"1");
                //   Text_box(700,460+50*3,100,50,20,"1543243302");
               }
               if(dt_s(13,20))
               {
               
                 Text_box(700,460+50*2,100,50,20,"1");
                 Text_box(700,460+50*4,100,50,20,"6");
                   
               }
                   if(dt_s(15,20))
               {
               
                 Text_box(700,460+50*3,100,50,20,"1543243302");  
                   //Text_box(700,460+50*3,100,50,20,"1543243302");
               }
                       if(dt_s(16,20))
               {
               
                 Text_box(700,460+50*5,100,50,20," 1543243302");
                   //Text_box(700,460+50*3,100,50,20,"1543243302");
               }
               
              
            break;
        case 3:
                   fill(black);
             Text_penguin(s7,20,2,1);
             fade(12,6,1,0,70, 114, 196);
             line_fade(12,6,1,0,70, 114, 196);
             strokeWeight(2);
             fill(70,114,196);
             Text_box(820+6*40,450,100,100,20,"File table");                          
             fill(white);
              stroke(70, 114, 196);
             for (int i=0;i<15;i++)
               rect(820+i*40,520,40,30);
           
               
                 //if (dt_s(14,15)) arrow(880,630,880,580,70,114,196);
                // if (dt_s(15,16)) arrow(920,630,920,580,70,114,196);
                        
                  // Line(900,550,850,630,27,11,0);
                  // Line(940,550,990,630,27,11,0);
                   line(900,550,850,630);
                  line(940,550,990,630);
                     String[] tem={"f_mode","f_flags","f_count","f_inode","off_t","f_pos"};
                     for (int i=0;i<6;i++)
                     {
                       fill(white);
                       rect(850,630+i*40,80,40);rect(930,630+i*40,60,40);
                       fill(70,114,196);
                       Text_box(850,630+i*40,80,40,18,tem[i]);
                     }
                     Text_box(930,630+1*40,60,40,20,"577");
                     //  Text_penguin(s6,27,3,1);
                     if (dt_s(27,28)) 
                     {
                       
                       arrow(1020,690,1000,690,70,114,196);
                         
                   }
                     if (dt_s(22,23)) 
                     Text_box(930,630+5*40,60,40,20,"6");
                    // Text_box(930,630+2*40,60,40,20,"0");
                   //arrow(680,540+38*3,830,650,70,114,196);
                  
                
             
             strokeWeight(1);
        break;
  }
    
    
    if (mtime()>22900)stop();
<<<<<<< HEAD
}
=======
}
void scene_10()
{  
    int[] time_f={7,15};
    if (time()==0) frame_index=0;
    int time_n=time_f[frame_index];
    if (time()>=time_n){frame_index++;frame_index%=time_f.length;time_n=time_f[frame_index];}
    fill(black);textAlign(LEFT,TOP);
    Text(24,0,0,"Scene_10,frame_"+str(frame_index));  
    Text(24,0,24,"time="+str(float(millis()/100)/10)+" s");
    Text(24,0,24*2,"L_stime="+str(time())+",L_mtime="+str(mtime()));
    fill(white);
         /***basic***/
    penguin_X=1736;penguin_Y=863;penguin_size=0.75;
    int x1=penguin_X,y1=penguin_Y; 
    tint(white,alpha);
    image(penguin,penguin_X,penguin_Y,penguin.width*penguin_size,penguin.height*penguin_size);
   
    fill(255, 153, 204); stroke(0,0,0);rect(400,150,40,40);           
    fill(204, 255, 255); stroke(0,0,0);rect(440,150,400,40);                      
    fill(255, 255, 153); stroke(0,0,0);rect(840,150,400,40);
 
    fill(black);
    Text_box(400-30,80,100,100,16,"boot section");
    Text_box(600,50,400,100,24,"hdc-0.11.img 121.72MB");
    Text_box(600,150,100,100,16,"60.56MB");
    line(440,190,300,250);
    line(840,190,1200,250);
         
    int[] box_x={300,330,360,450,690,930};
    int box_y=250,box_h=50,box_w=30;
    fill(255, 204, 153); stroke(0,0,0);rect(box_x[0],box_y,box_w,box_h);  
    fill(255, 153, 204); stroke(0,0,0);rect(box_x[1],box_y,box_w,box_h);
    fill(255, 255, 153); stroke(0,0,0);
    for (int i=0;i<3;i++)
        rect(box_x[2]+i*box_w,box_y,box_w,box_h);
    fill(204, 255, 204); stroke(0,0,0);
    for (int i=0;i<8;i++)
        rect(box_x[3]+i*box_w,box_y,box_w,box_h);
    fill(204, 255, 255); stroke(0,0,0);
    for (int i=0;i<8;i++)
        rect(box_x[4]+i*box_w,box_y,box_w,box_h);
    fill(153, 204, 255); stroke(0,0,0);
    for (int i=0;i<9;i++)
        rect(box_x[5]+i*box_w,box_y,box_w,box_h);
        
    fill(white);
    strokeWeight(4);
    stroke(201, 201, 201,alpha);
    ellipse(400,700,180,180);
    fill(black);
    Text_box(220,520,360,360,24,"TASK");
    strokeWeight(1);
    /***basic***/
    
    String s1="Now,present the process of the close";
    String s2="And return the handle of the newly created file.";
    String s3="First of all, the handle of the closing file is be set null";
    String s4="Then just need to release the inode";
       String s5="Write the inode information to the buffer";
    String s6="Then modify the i_diry zero";
    switch(frame_index)
    {
      case 0:Text_penguin(s1,0,4,1);
             //Text_penguin(s2,4,3,1);
               Text_penguin(s3,5,2,1);
             strokeWeight(2);fill(white);
             line_fade(0,7,2,0,70, 114, 196);
             fade(0,7,2,0,70,114,196);Text_box(615,440,100,100,24,"filp");fill(white);
            /* for (int i=0;i<3;i++)
             {
                 rect(580,520+i*38,35,38); fade(0,7,2,0,70,114,196);Text_box(580,520+i*38,35,38,16,str(i));fill(white);
                 rect(615,520+i*38,100,38);fade(0,7,2,0,70,114,196);Text_box(615,520+i*38,100,38,16,"0x27730");fill(white);
             }
             rect(580,520+3*38,35,38); fade(0,7,2,0,70,114,196);Text_box(580,520+3*38,35,38,16,str(3));fill(white);
             rect(615,520+3*38,100,38);fade(0,7,2,0,70,114,196);Text_box(615,520+3*38,100,38,16,"0x27740");fill(white);
             rect(580,520+4*38,35,50); fade(0,7,2,0,70,114,196);Text_box(580,520+4*38,35,50,16,"");fill(white);
             rect(615,520+4*38,100,50);fade(0,7,2,0,70,114,196);Text_box(615,520+4*38,100,50,10,".\n.\n.\n");fill(white);
             rect(580,532+5*38,35,38); fade(0,7,2,0,70,114,196);Text_box(580,532+5*38,35,38,16,"19");fill(white);
             rect(615,532+5*38,100,38);fade(0,7,2,0,70,114,196);Text_box(615,531+5*38,100,38,16,"0x0");fill(white);
            */
             rect(535,520+0*38,35,38); fade(0,7,2,0,70,114,196);Text_box(535,520+0*38,35,38,16,"0");fill(white);
             rect(570,520+0*38,150,38);fade(0,7,2,0,70,114,196);Text_box(570,520+0*38,150,38,16,"0x27730(stdin)");fill(white);
             rect(535,520+1*38,35,38); fade(0,7,2,0,70,114,196);Text_box(535,520+1*38,35,38,16,"1");fill(white);
             rect(570,520+1*38,150,38);fade(0,7,2,0,70,114,196);Text_box(570,520+1*38,150,38,16,"0x27730(stdout)");fill(white);
             rect(535,520+2*38,35,38); fade(0,7,2,0,70,114,196);Text_box(535,520+2*38,35,38,16,"2");fill(white);
             rect(570,520+2*38,150,38);fade(0,7,2,0,70,114,196);Text_box(570,520+2*38,150,38,16,"0x27730(stderr)");fill(white);
             rect(535,520+3*38,35,38); fade(0,7,2,0,70,114,196);Text_box(535,520+3*38,35,38,16,"3");fill(white);
              if(dt_s(0,5)){
             rect(570,520+3*38,150,38);fade(0,7,2,0,70,114,196);Text_box(570,520+3*38,150,38,16,"0x27740(hello)");fill(white);
              }rect(535,520+4*38,35,50); fade(0,7,2,0,70,114,196);Text_box(535,520+4*38,35,50,16,"");fill(white);
             rect(570,520+4*38,150,50);fade(0,7,2,0,70,114,196);Text_box(570,520+4*38,150,50,10,".\n.\n.\n");fill(white);
             rect(535,532+5*38,35,38); fade(0,7,2,0,70,114,196);Text_box(535,532+5*38,35,38,16,"19");fill(white);
             rect(570,532+5*38,150,38);fade(0,7,2,0,70,114,196);Text_box(570,531+5*38,150,38,16,"0x0(NULL)");fill(white);
 
             strokeWeight(1);
             
             fade(0,7,2,0,70, 114, 196);
             line_fade(0,7,2,0,70, 114, 196);
             strokeWeight(2);
             Text_box(820+6*40,450,100,100,20,"File table");                          
             fill(white);
             for (int i=0;i<15;i++)
             rect(820+i*40,520,40,30);        
             Line(900,550,850,630,0,7,0);
             Line(940,550,990,630,0,7,0);
             String[] tem={"f_mode","f_flags","f_count","f_inode","off_t"};
             for (int i=0;i<5;i++)
             {
               fill(white);
              // fade(0,3,2,0,70, 114, 196);
               line_fade(0,7,2,0,70, 114, 196);
               rect(850,630+i*40,80,40);rect(930,630+i*40,60,40);
               fade(0,7,2,0,70, 114, 196);
               Text_box(850,630+i*40,80,40,18,tem[i]);
             }
             //Text_box(930,630+2*40,60,40,20,"0");
             if(dt_s(4,5))
             {
              
               String s[]={"0x8810","577","1","xxxx","xxxx"};
               for (int i=0;i<5;i++)
               {
                 fade(4,3,1,0,70, 114, 196);
                 Text_box(930,630+i*40,60,40,20,s[i]);
               }
             }
             if(dt_s(5,7))
             {
              
               String s[]={"0x8810","577","1","xxxx","xxxx"};
               for (int i=0;i<5;i++)
               {
                 if(i!=2){
                 fade(4,3,1,0,70, 114, 196);
                 Text_box(930,630+i*40,60,40,20,s[i]);
                 }
               }
             }
             if(dt_s(4,5))
              arrow(740,540+38*3,830,650,70,114,196);
            
              fill(white);
                if(dt_s(5,7))
                {
                  
                     rect(570,520+3*38,150,38);
                     fade(0,7,2,0,70,114,196);
                     Text_box(570,520+3*38,150,38,16,"null");
                    // fill(white);
                 Text_box(930,630+2*40,60,40,20,"0");
              
            }
             strokeWeight(1);
             break;
      case 1://Text_penguin(s3,7,2,1);
        Text_penguin(s4,7,3,1);
        Text_penguin(s5,10,2,1);
        Text_penguin(s6,12,3,1);
              
      
        line(690,300,580,360);
        line(930,300,1280,360);
           
                 
                 for (int i=0;i<14;i++){
                  fill(204, 255, 255);rect(580+i*50,360,50,50);}
                 fill(black); Text_box(580+2*50,360,50,50,24,"2");
                    fill(black); 
                   line(680,410,580,470);
                   line(730,410,830,470);   
                   String[] t={"i_mode","i_dirt","i_size","i_mtime","i_gid","i_nlinks","i_zone[9]"};
                   String[] n={"0x8810","1","...","5BFC1D33","00","01","..."};
                   if(dt_s(7,13)){
                   for (int i=0;i<7;i++){
                    fill(204, 255, 255);rect(580,470+i*40,100,40);rect(680,470+i*40,150,40);
                    fill(black);Text_box(580,470+i*40,100,40,20,t[i]);
                   // fade(20,3,1,0,black,black,black);
                   Text_box(680,470+i*40,150,40,20,n[i]);
                   }}
                     if(dt_s(13,16)){
                   for (int i=0;i<7;i++){
                    fill(204, 255, 255);rect(580,470+i*40,100,40);rect(680,470+i*40,150,40);
                    fill(black);Text_box(580,470+i*40,100,40,20,t[i]);
                   // fade(20,3,1,0,black,black,black);
                   if(i!=1)
                   Text_box(680,470+i*40,150,40,20,n[i]);
                   else
                    Text_box(680,470+i*40,150,40,20,"0");
                   }}
                   
             break;
             
  
    }
   if (mtime()>14900)stop();
}
>>>>>>> 93bcc593bcbac3f5589910e2de88eb44543c9eb1
