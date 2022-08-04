#!/bin/bash
#set -x

#if [ "" == "$1" ] || [ "-h" == "$1" ] || [ "--h" == "$1" ] || [ "-help" == "$1" ] || [ "--help" == "$1" ];then
#    echo ''
#fi

sudo ls
pkill dde-launcher
dbus-send --session --print-reply --dest=com.deepin.dde.Launcher /com/deepin/dde/Launcher com.deepin.dde.Launcher.Show

for ((;;))
do
    if [ `pidof dde-launcher` ]
    then
        sudo strace -ttt -p `pidof dde-launcher`
        break
    fi
done

