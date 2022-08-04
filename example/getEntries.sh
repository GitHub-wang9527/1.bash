#!/bin/bash

dbuspath=$(dbus-send --print-reply --session --dest=com.deepin.dde.daemon.Dock /com/deepin/dde/daemon/Dock org.freedesktop.DBus.Properties.Get string:com.deepin.dde.daemon.Dock string:Entries)
dbuspath=$(echo $dbuspath |grep -o -P '(?<=\[).*(?=\])')
echo $dbuspath
dbuspath=${dbuspath//'object path '/''}
dbuspath=${dbuspath//\"/''}                # 移除双引号

txt=$HOME/Desktop/dock.entries.txt
echo '' > $txt
for path in `echo $dbuspath | awk -F ' ' '{for(i=1;i<=NF;i++)print $i}' `
do
    echo '' >> $txt
    dbus-send --print-reply --session --dest=com.deepin.dde.daemon.Dock $path org.freedesktop.DBus.Properties.GetAll string:com.deepin.dde.daemon.Dock.Entry >> $txt
done


