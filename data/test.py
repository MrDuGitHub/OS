#!/usr/bin/python  
#coding=utf-8  

import numpy as np
import matplotlib.pyplot as plt
import json

fp=open('write.txt','r')
fw=open('write.json','w')
y=fp.readlines()
x=0
t=0
da=[]
for i in range(int(len(y)/2)):
    print(i)
    data=json.loads(y[2*i]+y[2*i+1])
    da.append(data)
fw.write(json.dumps(da))
##    if data['provider']=='Mr.d':
##        x=x+1
fp.close()
fw.close()
'''
t=0
fp=open('1.txt','r')
y=fp.readlines()

for i in range(int(len(y)/2)):
    print(2*i+1)
    s=y[2*i]+y[2*i+1]
    
    data=json.loads((y[2*i]+y[2*i+1]).replace("d7",""))
    if data['provider']=='Mr.d':
        x=x+1
    if data['provider']=='wws':
        t=t+1
print(t)
x=x+int(5952/2)

value=[]
value.append(x)
value.append(t)
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
plt.pie(value,labels=label,explode=explode,autopct='%1.1f%%')

plt.title("Test",font) #图标题 
plt.legend()
plt.savefig('test.png')
plt.show()  #显示图
'''