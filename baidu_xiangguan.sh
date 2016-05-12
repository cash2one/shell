cat kws.txt|while read line;do
curl -s "http://www.baidu.com/s?wd=$line&tn=baidurs2top"|sed 's/,/\n/g';
done >>ok.txt
