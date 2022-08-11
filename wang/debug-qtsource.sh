
export QDBUS_DEBUG=1
export QT_DEBUG_PLUGINS=1
export QT_LOGGING_RULES="kwin_*.debug=true;kwin*=true;kwin_libinput=false;"


# qtsrc环境变量
qtbuilddir=/media/wangbin/WB1T/workspace/qtsource/build
export LD_LIBRARY_PATH=$qtbuilddir/lib
export QT_QPA_PLATFORM_PLUGIN_PATH=$qtbuilddir/plugins/platforms
export QT_PLUGIN_PATH=$qtbuilddir/plugins
export PKG_CONFIG_PATH=$qtbuilddir/lib/pkgconfig

qtcreator

