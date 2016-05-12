#!bin/bash

#############本工具由【方法SEO博客http://seofangfa.com】提供，欢迎反馈问题~~~#############
#############2015年8月14日#############

#############作用################
#用shell批量提取76页百度搜索结果url

#############用法################
#1、安装cygwin，【高清视频！】win7系统Cygwin安装教程及常用工具安装使用教程：http://seofangfa.com/shell/cygwin-setup.html
#2、cd 命令切换到工作目录；
#3、输入time bash -x baidu76.sh
#4、等运行完毕，查看结果，结果存在ok.txt文件中。

#############注意事项#############
#1、kws.txt：关键词列表，一行一个，UTF-8编码
#2、ok.txt：百度搜索结果76页的URL集合
#3、关键词越多，结果越准确，所以，第一步你得挖掘足够多、足够精准的行业关键词，教程看下面：
##1、【超级简单好用！】批量采集百度相关搜索关键词：http://seofangfa.com/seo-tool/baidu-related.html
##2、【亲测好用！】shell批量采集百度下拉框关键词：http://seofangfa.com/seo-tool/shell-baidu-xiala.html
##3、shell快速批量获取百度商情关键词【带指数】：http://seofangfa.com/shell/baidukeyword-shangqing.html



#批量提取76页百度搜索结果url
a=0
cat kws.txt|while read line;do
	let a+=1
	echo $a
	echo $line
	for i in `seq 0 10 750`;do 
		curl -s "http://www.baidu.com/s?wd=$line&pn=$i" | grep -o "http://www.baidu.com/link\?[^\"|\']*"|xargs curl -s -i|grep "Location"|sed 's/Location://g'; 
	done >>ok.txt
done