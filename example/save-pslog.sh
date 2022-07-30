#!/bin/bash

# 指定时间段保存进程信息

t1=`date -d "2022-07-12 06:25:00" +%s`
t2=`date -d "2022-07-12 06:30:00" +%s`
 
echo > $HOME/Desktop/ps.log
echo $t1 $t2 `date +%s`
while true
do
	curtime=`date +%s`
	if [ $curtime -gt $t1 ];then		# ge 大于等于
		if [ $curtime -le $t2 ];then	# le 小于等于
			echo "save log"
			echo "log time is `date`" >> $HOME/Desktop/ps.log
			ps -ef >> $HOME/Desktop/ps.log    # -ef 可以看到父进程
		fi
	fi
	
	sleep 1
done

