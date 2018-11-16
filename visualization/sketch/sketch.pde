PImage penguin;
int penguin_X,penguin_Y;
float penguin_size;

static int size_X=1920,size_Y=1080;

static int[] scene={23,5,22,1};
static int[] scene_time={23,28,50,51};
int scene_index=0;
int scene_time_now=scene_time[scene_index];


void setup() 
{
  size(1920, 1080); //size(2000, 1236);size(1000, 618);
  background(255);
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
int time() {if (scene_index==0)return millis()/1000%(scene[0]+1);else return (millis()/1000-scene_time[scene_index-1]);}
int mtime(){if (scene_index==0)return millis()%((scene[0]+1)*1000);     else return (millis()-scene_time[scene_index-1]*1000);}
/****************************** The time module ******************************/

/******************************* The Main Loop *******************************/
void init()
{
    clear();
    background(255);
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
        case 0: scene_2();break;
        case 1: stop();scene_1();break;
        case 2: scene_2();break;
        case 3: stop();   break;
    }  
}
/******************************* The Main Loop *******************************/

/**************************** The animation effect ***************************/
void fade(float base_t,float sum_t,float fade_t)
{
    if (time()-base_t<fade_t) fill(0,0,0,(mtime()-base_t*1000)*255/(fade_t*1000)); 
    else if (time()-base_t<(sum_t-fade_t)) fill(0,0,0,255); 
    else fill(0,0,0,(sum_t*1000-(mtime()-base_t*1000))*255/(fade_t*1000));
}

void penguin_fade(float base_t,float sum_t,float fade_t1,float fade_t2)
{
    if (time()-base_t<fade_t1) tint(255,(mtime()-base_t*1000)*255/(fade_t1*1000)); 
    else if (time()-base_t<(sum_t-fade_t2)) tint(255,255); 
    else tint(255,(sum_t*1000-(mtime()-base_t*1000))*255/(fade_t2*1000));
}
/**************************** The animation effect ***************************/

/**************************** The module of cloud ****************************/
int [] cloud_dx={19,49,101,119,179,169,239,199,139,139,49,39,-11,-6,19};
int [] cloud_dy={19,-11,19,-16,4,29,44,104,89,119,124,78,109,39,49};
int cloud_X=206,cloud_Y=114;
void cloud(int x,int y,float size)
{
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
    ellipse(x+205*size,y+115*size,5*size,5*size);
}
/***************************** The module of cloud ***************************/

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
    int tmp_size;
    if (s.length()<64) tmp_size=2; else tmp_size=3;
    int dx=100,dy=40;
    int tmp_X=int(penguin_X-(penguin.width-dx)*penguin_size/2-tmp_size*cloud_X);
    int tmp_Y=int(penguin_Y-(penguin.height-dy)*penguin_size/2-tmp_size*cloud_Y);
    noFill();
    cloud(tmp_X,tmp_Y,tmp_size);
    fade(fade_bt,fade_st,fade_t);
    Text_box(tmp_X+30*tmp_size,tmp_Y+20*tmp_size,139*tmp_size,58*tmp_size,24,s);
}
/***************************** The module of text ****************************/

/*****************************       Scenes       ****************************/
int frame_index=0;
void scene_0()
{
    int[] time_f={2,7,13,18,22,23};
    int time_n=time_f[frame_index];
    if (time()==0) frame_index=0;
    if (time()>=time_n) 
    {
        frame_index++;frame_index%=time_f.length;
        time_n=time_f[frame_index];
    }
    fill(0);
    textAlign(LEFT,TOP);
    Text(24,0,0,"Scene_0,frame_"+str(frame_index)); 
    Text(24,0,24,"time="+str(float(millis()/100)/10)+" s");
    Text(24,0,24*2,"L_stime="+str(time())+",L_mtime="+str(mtime()));
    fill(255);

    penguin_fade(0,time_f[time_f.length-1],time_f[0],0);
    image(penguin,(size_X)/2,(size_Y)/2);
    penguin_X=(size_X)/2;penguin_Y=(size_Y)/2;
    penguin_size=1;
    
    String s1="Hello!\nWelcome to the world of Linux 0.11!";
    String s2="Today,I want to introduce you to the file system."; 
    String s3="This is the s3,and I don't know what else to say.";
    String s4="So...\nHappy New Year!everyone~";
    switch(frame_index)
    {
      case 0:break;
      case 1:Text_penguin(s1,time_f[frame_index-1],5,1.5);break;
      case 2:Text_penguin(s2,time_f[frame_index-1],5,1.5);break;
      case 3:Text_penguin(s3,time_f[frame_index-1],5,1.5);break;
      case 4:Text_penguin(s4,time_f[frame_index-1],5,1.5);break;
      case 5:break;
    }
}

void scene_1()
{
    int[] time_f={1,3,5};
    if (time()==0) frame_index=0;
    int time_n=time_f[frame_index];
    if (time()>=time_n) 
    {
        frame_index++;frame_index%=time_f.length;
        time_n=time_f[frame_index];
    }
    fill(0);
    textAlign(LEFT,TOP);
    Text(24,0,0,"Scene_1,frame_"+str(frame_index));  
    Text(24,0,24,"time="+str(float(millis()/100)/10)+" s");
    Text(24,0,24*2,"L_stime="+str(time())+",L_mtime="+str(mtime()));
    fill(255);
    
    int x0=size_X/2,y0=size_Y/2;
    int w0 = penguin.width, h0 = penguin.height;
    float penguin_size=0.75;
    int w1 = int(w0*penguin_size),h1 = int(h0*penguin_size);
    int x1=size_X-w0,y1=size_Y-h0;
    int dx=x1-x0,dy=y1-y0,dw=w1-w0,dh=h1-h0;
    int w,h,x,y;
    w=h=x=y=0;
    switch(frame_index)
    {
      case 0: x=x0;y=y0;w=w0;h=h0;break;
      case 1: w = w0+dw*(mtime()-1000)/2000;h = h0+dh*(mtime()-1000)/2000;
              x = x0+dx*(mtime()-1000)/2000;y = y0+dy*(mtime()-1000)/2000;break;
      case 2: w = w1; h = h1; x = x1; y = y1; break;
    }
    image(penguin,x,y,w,h);
    penguin_X=x;penguin_Y=y;
}

void scene_2()
{
    int[] time_f={5,10,15,20,22};
    if (time()==0) frame_index=0;
    int time_n=time_f[frame_index];
    if (time()>=time_n) 
    {
        frame_index++;frame_index%=time_f.length;
        time_n=time_f[frame_index];
    }
    fill(0);
    textAlign(LEFT,TOP);
    Text(24,0,0,"Scene_2,frame_"+str(frame_index));  
    Text(24,0,24,"time="+str(float(millis()/100)/10)+" s");
    Text(24,0,24*2,"L_stime="+str(time())+",L_mtime="+str(mtime()));
    fill(255);
    
    penguin_X=1736;penguin_Y=863;penguin_size=0.75;
    int x1=penguin_X,y1=penguin_Y;
    //println(x1,y1);
    image(penguin,penguin_X,penguin_Y);
    String s1="Hello!\nWelcome to the world of Linux 0.11!";
    String s2="Today,I want to introduce you to the file system."; 
    String s3="This is the s3,and I don't know what else to say.";
    String s4="So...\nHappy New Year!everyone~";
    switch(frame_index)
    {
      case 0:Text_penguin(s1,0,5,1.5);break;
      case 1:Text_penguin(s2,time_f[frame_index-1],5,1.5);break;
      case 2:Text_penguin(s3,time_f[frame_index-1],5,1.5);break;
      case 3:Text_penguin(s4,time_f[frame_index-1],5,1.5);break;
      case 4:break;
    }
}
/*****************************       Scenes       ****************************/
