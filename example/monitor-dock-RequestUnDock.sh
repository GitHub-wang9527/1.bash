#!/bin/bash

logpath="$HOME/Desktop/tlog"
mkdir -p $logpath

# & 在后台开辟一个dbus-monitor的进程
dbus-monitor --session interface=com.deepin.dde.daemon.Dock > $logpath/log1 &
dbus-monitor --session interface=com.deepin.dde.daemon.Dock.Entry > $logpath/log2 & 

while true
do 
	time=`date "+%Y-%m-%d_%H:%M:%S"`
    echo "save log $time"

    ps -ef > $logpath/${time}-ps.log    
	echo $(dbus-send --print-reply --session --dest=com.deepin.dde.daemon.Dock /com/deepin/dde/daemon/Dock org.freedesktop.DBus.Properties.GetAll string:com.deepin.dde.daemon.Dock) > $logpath/${time}-daemon.log
    
    sleep 1
done

