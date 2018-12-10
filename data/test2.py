#!/usr/bin/python  
#coding=utf-8  

import numpy as np
import matplotlib.pyplot as plt
import json

f1=open('create.txt','r')
f2=open('open.txt','r')
f3=open('write.txt','r')
f4=open('close.txt','r')
y1=f1.readlines()
y2=f2.readlines()
y3=f3.readlines()
y4=f4.readlines()


value_hour=[]
value_hour.append(len(y1)/2)
value_hour.append(len(y2)/2)
value_hour.append(len(y3)/2)
value_hour.append(len(y4)/2)

f1.close()
f2.close()
f3.close()
f4.close()

print(value_hour)
font = {'family': 'Times New Roman',
         'weight': 'normal',
         'size': 30,
		 'color':'#563f2e',
		 'style':'italic',
		 'size':'xx-large',
		 'weight':'light'
         }
		 
plt.figure(figsize=(8,6)) #创建绘图对象  
color=['#bee7e9','#bee7e9','#f4606c','#f4606c']
color0=['#f4606c','#f4606c','#bee7e9','#bee7e9']
plt.bar(range(len(value_hour)),value_hour,width=0.4,color=color)
plt.bar(range(len(value_hour)),value_hour,width=0,color=color0)

plt.xlabel("operation",font) #X轴标签  
plt.ylabel("size",font)  #Y轴标签  
plt.title("Data distribution for different operations",font) #图标题 
##plt.title("Don't make decisions late at night",color='#563f2e',fontstyle='italic',fontsize='xx-large',fontweight='light') #图标题 
op=['create','open','write','close']
my_x_ticks = np.arange(0, 4,1)
my_y_ticks = np.arange(0, 4801, 400)
plt.xticks(my_x_ticks,op)
plt.yticks(my_y_ticks)
plt.tick_params(labelsize=12)
plt.legend(['Mr.d','wws'],loc='best',fontsize='large',ncol=1,handlelength=2)
plt.savefig('2.png')
#plt.savefig('picture/hour.png')
plt.show()  #显示图