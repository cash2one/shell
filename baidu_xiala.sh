cat kws.txt|while read line;do curl -s http://suggestion.baidu.com/su?wd=$line|iconv -f gbk -t utf-8|grep -oP '(?<=").*?(?=")'|egrep -v "baidu|,";done >>ok.txt