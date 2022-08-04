#!/bin/bash
#set -x

num=0
for((;;))
do
    num=$[$num+1]
    log="`date -R`: 第 $num 次测试......"
    echo $log

    WID=`xdotool search --name "Qt Creator" | head -1`
    xdotool windowfocus $WID
    xdotool key F5

    sleep 4
    dbus-send --session --print-reply --dest=com.deepin.dde.Launcher /com/deepin/dde/Launcher com.deepin.dde.Launcher.Show
    if [ `echo $?` -ne 0 ];then
        exit        # dbus返回值不好获取 不为0 认为失败
    fi

    sleep 2
    dbus-send --session --print-reply --dest=com.deepin.dde.Launcher /com/deepin/dde/Launcher com.deepin.dde.Launcher.Exit
    if [ `echo $?` -ne 0 ];then
        exit        # dbus返回值不好获取 不为0 认为失败
    fi

    sleep 2
done
