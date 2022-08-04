#!/bin/bash

        dest="com.deepin.dde.daemon.Dock"
        path="/com/deepin/dde/daemon/Dock"
        inter="com.deepin.dde.daemon.Dock.RequestDock"
        app="/usr/share/applications/dde-control-center.desktop"
        num=3
         err=`dbus-send --session --print-reply --dest=$dest $path $inter string:"$app" int32:$num`
         echo $err

