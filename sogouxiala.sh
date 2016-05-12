cat kws.txt|while read line;do
curl -s "http://www.sogou.com/suggnew/ajajjson?type=web&key=$line" |iconv -f gbk -t utf-8|awk -F"[" '{print $3}'|sed 's/,/\n/g'|sed 's/]/ /g'|sed 's/"/ /g';
done >>ok.txt