#!/bin/bash
#删除旧文件,以便后面建立最新数据
rm -rf /home/student/ip.txt bip.txt 
#定义函数myping
myping(){
#-c为ping的次数,-W为不通时候反馈时间,$1为位置变量输入网段,$i为for循环的次数,也就是IP的最后一位
    ping -c1 -W1  $1$i  &>/dev/null
#判断上面$?是否为0
    if [ $? -eq 0 ];then
#如果为0,则表示ping通并追加重定向到这个文件
        echo "$1$i " >>/home/student/ip.txt
    else
#$?不为0则输出不通并追加重定向到这个文件
        echo "$1$i 不通" >>/home/student/bip.txt
    fi
}
#定义网段
x=$1.$i
#创建for循环执行上面的函数
for  i  in  {1..255}
do
#调用上面的函数并后台执行
     myping  $x  &
done
wait
        #echo "一共`cat /home/student/ip.txt | wc -l`机器" >>/home/student/ip.txt
        #echo "一共`cat /home/student/bip.txt | wc -l`机器" >>/home/student/bip.txt
