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
mrd=0
wws=0
for i in range(int(len(y1)/2)):
    print(i)
    data=json.loads(y1[2*i]+y1[2*i+1])
    if data['provider']=='Mr.d':
        mrd=mrd+1
    if data['provider']=='wws':
        wws=wws+1
for i in range(int(len(y2)/2)):
    print(i)
    data=json.loads(y2[2*i]+y2[2*i+1])
    if data['provider']=='Mr.d':
        mrd=mrd+1
    if data['provider']=='wws':
        wws=wws+1
for i in range(int(len(y3)/2)):
    print(i)
    data=json.loads(y3[2*i]+y3[2*i+1])
    if data['provider']=='Mr.d':
        mrd=mrd+1
    if data['provider']=='wws':
        wws=wws+1
for i in range(int(len(y4)/2)):
    print(i)
    data=json.loads(y4[2*i]+y4[2*i+1])
    if data['provider']=='Mr.d':
        mrd=mrd+1
    if data['provider']=='wws':
        wws=wws+1
f1.close()
f2.close()
f3.close()
f4.close()

value=[]
value.append(mrd)
value.append(wws)
label=["Mr.d","wws"]
explode=[0.01,0.01]

font = {'family': 'Times New Roman',
         'weight': 'normal',
         'size': 30,
         'color':'#563f2e',
         'style':'italic',
         'size':'xx-large',
         'weight':'light'
         }
plt.figure(figsize=(10,6)) #创建绘图对象  
color=['#bee7e9','#f4606c']
plt.pie(value,labels=label,explode=explode,autopct='%1.1f%%',colors=color)

#plt.title("Data",font) #图标题 
plt.legend(fontsize='large')
plt.savefig('1.png')
plt.show()  #显示图