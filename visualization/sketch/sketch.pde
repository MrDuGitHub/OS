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

static int[] scene={50,5,30,33,3,1};//15
static int[] scene_time={15,20,50,83,86,87};
int scene_index=0;
int scene_time_now=scene_time[scene_index];

void setup() 
{
  //size(1920, 1080); //size(2000, 1236);size(1000, 618);
  fullScreen();
  background(white);
  penguin = loadImage("penguin.jpg");
  imageMode(CENTER);
  font = loadFont("SimHei-48.vlw");
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
        case 0: scene_4();break;
        case 1: scene_1();break;
        case 2: scene_2();break;
        case 3: scene_3();break;
        case 4: scene_4();break;
        case 5: scene_5();break;
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
void arrow(int sx,int sy,int ex,int ey,int r,int g,int b)
{
     int arrow_size=5;
     strokeWeight(2);
     fill(r,g,b);
     stroke(r,g,b);
     line(sx,sy,ex,ey);
     double k=(double)(ey-sy)/(ex-sx);
     double dx=sqrt((float)(arrow_size*arrow_size/(1+k*k)));
     double dy;
     if (dx<0.01)dy=5;else dy=dx*k;
     if (ex<=sx){dx=-dx;dy=-dy;}
     triangle((int)(ex+dx),(int)(ey+dy),(int)(ex-dy),(int)(ey+dx),(int)(ex+dy),(int)(ey-dx));
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
    int[] time_f={2,5,8,11,14,15};
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
    String s2="Today,I want to introduce you to the file system."; 
    String s3="It will be very interesting.";
    String s4="So,let's begin~";
    switch(frame_index)
    {
      case 0:break;
      case 1:Text_penguin(s1,time_f[frame_index-1],3,1);break;
      case 2:Text_penguin(s2,time_f[frame_index-1],3,1);break;
      case 3:Text_penguin(s3,time_f[frame_index-1],3,1);break;
      case 4:Text_penguin(s4,time_f[frame_index-1],3,1);break;
      case 5:break;
    }
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
    
/*    penguin_X=1736;penguin_Y=863;penguin_size=0.75;
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
    
    penguin_X=1736;penguin_Y=863;penguin_size=0.75;
    int x1=penguin_X,y1=penguin_Y;
    
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
             if (dt_s(9,12))
             {
               Text_penguin(s4,9,3,1);
               Text_box(200,225,100,100,16,"boot block");
             }
             if (dt_s(12,15))
             {
               Text_penguin(s5,12,3,1);
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
               //fill(255, 153, 204); stroke(0,0,0);rect(270,480,150,30);
               fill(black);
               rect(250,480,100,100);
               Text_box(240,450,210,240,15,"05BA:iNode_number           2F30:logical_blocks        0003:inode_bitmap_blocks   0008:logical_bitmap_blocks 0293:first_logical_block   0000:log                  1c00_1008:max_length            137f:magic_number         ");
               String[] name={"iNode number","logical blocks","inode bitmap blocks","logical bitmap blocks","first logical block","log","max_length","magic number"};
               String[] num={"1466","12080","3","8","659","0","469766152","4991"};
               String[] numo={"05BA","2F30","0003","0008","0293","0000","1C00 1008","137F"};
              
               int ind=6;
               for (int i=0;i<6;i++)
               {
                  fill(white);
                  rect(200,480+30*i,180,30);
                  rect(380,480+30*i,100,30);
                  rect(460,480+30*i,80,30);
                  fill(black);
                  Text_box(200,480+30*i,180,30,16,name[i]);
                  Text_box(380,480+30*i,80,30,16,num[i]);
                  Text_box(460,480+30*i,80,30,16,numo[i]);
               }
               fill(white);rect(200,480+30*6,180,60);rect(380,480+30*6,100,60);rect(460,480+30*6,80,60);
               fill(black);Text_box(200,480+30*6,180,60,16,name[6]);
               Text_box(380,480+30*6,80,60,16,num[6]);Text_box(460,480+30*6,80,60,16,numo[6]);
               fill(white);rect(200,480+30*8,180,30);rect(380,480+30*8,100,30);rect(460,480+30*8,80,30);
               fill(black);Text_box(200,480+30*8,180,30,16,name[7]);
               Text_box(380,480+30*8,80,30,16,num[7]);Text_box(460,480+30*8,80,30,16,numo[7]);
           }
           break;
      case 2:fill(black);
             Text_penguin(s7,18,3,1);
             Line(360,300,300,360,18,3,1);
             Line(390,300,450,360,18,3,1);  
             if (dt_s(19,21))
             {
               for (int i=0;i<5;i++){
                  fill(255, 255, 153);rect(300+i*30,360,30,30);fill(black);Text_box(300+i*30,360,30,30,16,"1");}
               for (int i=0;i<5;i++){
                  fill(255, 255, 153);rect(300+i*30,390,30,30);fill(black);Text_box(300+i*30,390,30,30,16,"0");}
               for (int i=0;i<5;i++){
                  fill(255, 255, 153);rect(300+i*30,420,30,30);fill(black);Text_box(300+i*30,420,30,30,16,".");}
             }
             break;
      case 3:fill(black);
             Text_penguin(s8,21,3,1);
             Line(390,300,330,360,21,3,1);
             Line(480,300,630,360,21,3,1);  
             if (dt_s(22,24))
             {
               for (int i=0;i<10;i++){
                  fill(204, 255, 204);rect(330+i*30,360,30,30);fill(black);Text_box(330+i*30,360,30,30,16,"1");}
               for (int i=0;i<10;i++){
                  fill(204, 255, 204);rect(330+i*30,390,30,30);fill(black);Text_box(330+i*30,390,30,30,16,"0");}
               for (int i=0;i<10;i++){
                  fill(204, 255, 204);rect(330+i*30,420,30,30);fill(black);Text_box(330+i*30,420,30,30,16,".");}
             }
             break;
      case 4:fill(black);
             Text_penguin(s9,24,3,1);
             Text_penguin(s10,27,3,1);
             Line(480,300,220,360,24,6,1);
             Line(720,300,920,360,24,6,1);  
             if (dt_s(25,30))
             {
               for (int i=0;i<14;i++){
                  fill(204, 255, 255);rect(220+i*50,360,50,50);}
               if(dt_s(27,30))
               {
                 Line(470,410,370,470,27,3,1);
                 Line(520,410,620,470,27,3,1);  
                 fill(black); 
                 if (dt_s(28,30))
                 {  
                   line(470,410,370,470);
                   line(520,410,620,470);   
                   //line(480,300,220,360);
                   //line(720,300,1020,360);
                   for (int i=0;i<14;i++){fill(204, 255, 255);rect(220+i*50,360,50,50);}
                   String[] t={"i_mode","i_uid","i_size","i_mtime","i_gid","i_nlinks","i_zone[9]"};
                   String[] n={"18C9","0000","00045404","405DC2CD","00","02","0336~033D"};
                   for (int i=0;i<7;i++){
                    fill(white);rect(370,470+i*40,100,40);rect(470,470+i*40,150,40);
                    fill(black);Text_box(370,470+i*40,100,40,20,t[i]);Text_box(470,470+i*40,150,40,20,n[i]);
                    }
                 }
                }
              }
             break;
      case 5:fill(black);
             Text_penguin(s11,30,3,1);
             Text_box(850,300,100,40,24,"data blocks");
             break;
    }
  if (time()>=8)//8
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
             
        int[] box_x={300,330,360,390,480,720};
        int box_y=250,box_h=50,box_w=30;
        fill(255, 204, 153); stroke(0,0,0);rect(box_x[0],box_y,box_w,box_h);  
        fill(255, 153, 204); stroke(0,0,0);rect(box_x[1],box_y,box_w,box_h);
        fill(255, 255, 153); stroke(0,0,0);rect(box_x[2],box_y,box_w,box_h);
        fill(204, 255, 204); stroke(0,0,0);
        for (int i=0;i<3;i++)
            rect(box_x[3]+i*box_w,box_y,box_w,box_h);
        fill(204, 255, 255); stroke(0,0,0);
        for (int i=0;i<8;i++)
            rect(box_x[4]+i*box_w,box_y,box_w,box_h);
        fill(153, 204, 255); stroke(0,0,0);
        for (int i=0;i<16;i++)
            rect(box_x[5]+i*box_w,box_y,box_w,box_h);
     }
     //if (mtime()>32900)stop();
}

void scene_4()
{  
    /*fill(white);
    stroke(201,201,201);
    rect(250,50,1200,350);
    rect(250,400,500,450);
    rect(750,400,700,450);*/
    
    int[] time_f={3,6,9,12,18,27};
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
         
    int[] box_x={300,330,360,390,480,720};
    int box_y=250,box_h=50,box_w=30;
    fill(255, 204, 153); stroke(0,0,0);rect(box_x[0],box_y,box_w,box_h);  
    fill(255, 153, 204); stroke(0,0,0);rect(box_x[1],box_y,box_w,box_h);
    fill(255, 255, 153); stroke(0,0,0);rect(box_x[2],box_y,box_w,box_h);
    fill(204, 255, 204); stroke(0,0,0);
    for (int i=0;i<3;i++)
        rect(box_x[3]+i*box_w,box_y,box_w,box_h);
    fill(204, 255, 255); stroke(0,0,0);
    for (int i=0;i<8;i++)
        rect(box_x[4]+i*box_w,box_y,box_w,box_h);
    fill(153, 204, 255); stroke(0,0,0);
    for (int i=0;i<16;i++)
        rect(box_x[5]+i*box_w,box_y,box_w,box_h);
    /***basic***/
    
    String s1="Ok,now let's see how to create a file.";
    String s2="In linux, each task has a file pointer table,";
    String s3="each of which points to a file structure of the file opened by the task.";
    String s4="The first step of creation is find a empty pointer.";
    String s5="Next,find a blank item in the file table";
    String s6="and have that pointer point to it.";
    String s7="Next,Find the folder where the file was created";
    String s8="based on the path information entered.";
    
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
             for (int i=0;i<3;i++)
             {
                 rect(580,520+i*38,35,38); fade(6,3,1,0,70,114,196);Text_box(580,520+i*38,35,38,16,str(i));fill(white);
                 rect(615,520+i*38,100,38);fade(6,3,1,0,70,114,196);Text_box(615,520+i*38,100,38,16,"0x27730");fill(white);
             }
             rect(580,520+3*38,35,38); fade(6,3,1,0,70,114,196);Text_box(580,520+3*38,35,38,16,str(3));fill(white);
             rect(615,520+3*38,100,38);fade(6,3,1,0,70,114,196);Text_box(615,520+3*38,100,38,16,"0x0");fill(white);
             rect(580,520+4*38,35,50); fade(6,3,1,0,70,114,196);Text_box(580,520+4*38,35,50,16,"");fill(white);
             rect(615,520+4*38,100,50);fade(6,3,1,0,70,114,196);Text_box(615,520+4*38,100,50,10,".\n.\n.\n");fill(white);
             rect(580,532+5*38,35,38); fade(6,3,1,0,70,114,196);Text_box(580,532+5*38,35,38,16,"19");fill(white);
             rect(615,532+5*38,100,38);fade(6,3,1,0,70,114,196);Text_box(615,531+5*38,100,38,16,"0x0");fill(white);
             strokeWeight(1);
             break;
      case 3:fill(black);
             Text_penguin(s4,9,3,1);
             strokeWeight(2);stroke(70, 114, 196);fill(white);
             rect(615,520+3*38,100,38);fill(70,114,196);stroke(70, 114, 196,alpha);
             if (dt_m(9000,9600+600*3))Text_box(615,520+3*38,100,38,16,"0x0");
             else arrow(640,540+38*3,690,540+38*3,70,114,196);
             fill(white);
             strokeWeight(1);
             for (int i=0;i<4;i++)
                 if (dt_m(9000+600*i,9600+600*i))
                   arrow(800,540+38*i,750,540+38*i,70,114,196);
             break;
      case 4:fill(black);
             Text_penguin(s5,12,3,1);
             Text_penguin(s6,15,3,1);
             fade(12,6,1,0,70, 114, 196);
             line_fade(12,6,1,0,70, 114, 196);
             strokeWeight(2);
             Text_box(820+6*40,450,100,100,20,"File table");                          
             fill(white);
             for (int i=0;i<15;i++)
               rect(820+i*40,520,40,30);
             if (dt_s(13,18))
             {
                 if (dt_s(13,14)) arrow(840,630,840,580,70,114,196);
                 if (dt_s(14,15)) arrow(880,630,880,580,70,114,196);
                 if (dt_s(15,16)) arrow(920,630,920,580,70,114,196);
                 if (dt_s(16,18))
                 {         
                   Line(900,550,850,630,16,2,1);
                   Line(940,550,990,630,16,2,1);
                   if (dt_s(17,18))
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
                   //arrow(680,540+38*3,830,650,70,114,196);
                   }
                 }
             }
             strokeWeight(1);
             break; 
      case 5:fill(black);
             Text_penguin(s7,18,3,1);
             Text_penguin(s8,21,3,1);
             if(dt_s(18,20))
             {
               fill(white);strokeWeight(3);stroke(201, 201, 201,alpha);
               rect(550,650,100,40);
               rect(550,710,100,40);
               //fill(70,114,196);
               //Text_box(550,710,100,40,16,"0x256d8");         
               rect(705,650,60,40);               
               rect(705,710,60,40);
               arrow(600,670,700,670,70,114,196);
               arrow(600,730,700,730,70,114,196); 
               //fill(white);
               fill(70,114,196);
               Text_box(705,710,60,40,16,"pwd");             
               Text_box(705,650,60,40,16,"root");
             }
             stroke(black,alpha);
             Line(480,300,220,360,18,6,1);
             Line(720,300,920,360,18,6,1);  
             if (dt_s(19,27))
             {
               stroke(black,alpha);
               for (int i=0;i<14;i++){
                  fill(204, 255, 255);rect(220+i*50,360,50,50);}
             }
             if (dt_s(20,23))
             {
               fill(white);strokeWeight(3);stroke(201, 201, 201,alpha);
               rect(550,710,100,40);
               rect(705,710,60,40);
               fill(70,114,196);
               Text_box(550,710,100,40,16,"0x256d8");         
               arrow(650,730,700,730,70,114,196); 
               fill(70,114,196);
               Text_box(705,710,60,40,16,"pwd");             
             }
             if (dt_s(22,27))
             {
               stroke(black,alpha);
               Line(670,410,600,460,22,5,1);
               Line(720,410,790,460,22,5,1);
               if (dt_s(23,27))
               {
//                 fill(70,114,196);
                 fade(23,4,1,1,70,114,196);
                 Text(20,500,480,"0x256d8 pwd");
                 String tem[]={"i_mode","i_uid","i_size","i_mtime","i_zone[9]","i_wait","..."};
                 for (int i=0;i<7;i++)
                 {
                    //fill(204, 255, 255);
                    fade(23,4,1,1,204, 255, 255);
                    //stroke(black,black,black,alpha);
                    rect(600,460+50*i,190,50);
                    fade(23,4,1,1,70,114,196);
                    //fill(70,114,196);
                    Text_box(600,460+50*i,190,50,20,tem[i]);
                 }
               }
               if (dt_s(24,27))
               {
                 int tx=1000-790,ty=300-680;
                 double time=(double)(mtime()-22000)/3000;
                 arrow(790,680,(int)(790+tx*time),(int)(680+ty*time),black,black,black);
               }
             }
             break;
      case 6:stop();  
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
       if (dt_s(9,18))
       {
             strokeWeight(2);fill(white);
             stroke(70, 114, 196);
             fill(70,114,196);Text_box(615,440,100,100,24,"filp");fill(white);
             for (int i=0;i<3;i++)
             {
                 rect(580,520+i*38,35,38); fill(70,114,196);Text_box(580,520+i*38,35,38,16,str(i));fill(white);
                 rect(615,520+i*38,100,38);fill(70,114,196);Text_box(615,520+i*38,100,38,16,"0x27730");fill(white);
             }
             rect(580,520+3*38,35,38); fill(70,114,196);Text_box(580,520+3*38,35,38,16,str(3));fill(white);
             if (dt_s(12,18))
             {
               rect(615,520+3*38,100,38);fill(70,114,196);
               if (dt_s(12,16))arrow(640,540+38*3,690,540+38*3,70,114,196);
               if (dt_s(16,17))
               { 
                 int tem=mtime()-16000;
                 double x=(double)tem/1000;
                 double dx=(830-690)*x,dy=(650-540-38*3)*x;
                 arrow(640,540+38*3,690+(int)dx,540+38*3+(int)dy,70,114,196);
               }
               if (dt_s(17,18)) arrow(740,540+38*3,830,650,70,114,196);
               if (dt_s(17,18)) Text_box(615,520+3*38,100,38,16,"0x27740");
             }
             fill(white);
             strokeWeight(2);
             rect(580,520+4*38,35,50); fill(70,114,196);Text_box(580,520+4*38,35,50,16,"");fill(white);
             rect(615,520+4*38,100,50);fill(70,114,196);Text_box(615,520+4*38,100,50,10,".\n.\n.\n");fill(white);
             rect(580,532+5*38,35,38); fill(70,114,196);Text_box(580,532+5*38,35,38,16,"19");fill(white);
             rect(615,532+5*38,100,38);fill(70,114,196);Text_box(615,531+5*38,100,38,16,"0x0");fill(white);
             strokeWeight(1);
       }
    }
    if (mtime()>26970)stop(); 
}

void scene_5()
{  
    int[] time_f={1};
    if (time()==0) frame_index=0;
    int time_n=time_f[frame_index];
    if (time()>=time_n){frame_index++;frame_index%=time_f.length;time_n=time_f[frame_index];}
    fill(black);textAlign(LEFT,TOP);
    Text(24,0,0,"Scene_5,frame_"+str(frame_index));  
    Text(24,0,24,"time="+str(float(millis()/100)/10)+" s");
    Text(24,0,24*2,"L_stime="+str(time())+",L_mtime="+str(mtime()));
    fill(white);
    
    switch(frame_index)
    {
      case 0:stop();break;
    }
}
/*****************************       Scenes       ****************************/
