# Linux 0.11 Visualization
==============

Linux 0.11内核可视化·修改版内核代码
基于[Linux-0.11-lab](https://git.sinomo.net/os-visualization/linux-0.11-lab),使用方法一致。

## 启动调试
只需运行run.sh即可启动qemu调试。
```shell
./run.sh
```
关闭qemu后，在gdb窗口中输入`q`指令退出gdb。

## log()函数
`log()`函数可以将调试信息输出到`output.txt`中。它的使用方法与`printf`类似。
注意，每次启动调试都会清空output.txt。
