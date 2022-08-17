#!/usr/bin/env python3
# -*- coding:utf-8 -*-

# 将当前图片按照分辨率移动到指定的文件夹中

import os

# 以'/$'的代表文件夹
for name in os.popen("ls -F | grep -v '/$'").read().split("\n"):
	if (name == ""):
		continue	
	#print ("hello ", (name))
	size = os.popen("identify %s | cut -d ' ' -f 3 " % (name)).read()
	
	if size.split('x')[0] >= '4096' and size.split('x')[1] >= '2894':
		os.popen("mv %s %s" % (name, '4096x2894'))
		print ('mv ', name, size)
	elif size.split('x')[0] >= '3840' and size.split('x')[1] >= '2160':
		os.popen("mv %s %s" % (name, '3840x2160'))
		print ('mv ', name, size)
	elif size.split('x')[0] >= '2560' and size.split('x')[1] >= '1440':
		os.popen("mv %s %s" % (name, '2560x1440'))
		print ('mv ', name, size)		
	elif size.split('x')[0] >= '1920' and size.split('x')[1] >= '1080':
		os.popen("mv %s %s" % (name, '1920x1080'))
		print ('mv ', name, size)
	else:
		print ('other ', name, size)	
		
