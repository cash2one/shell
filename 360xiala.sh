cat kws.txt|while read line;do
curl -s "http://sug.so.360.cn/suggest?callback=suggest_so&encodein=utf-8&encodeout=utf-8&format=xml&word=$line"|grep "<word>"|grep -oP '(?<=<word>).*?(?=</word>)';
done >>ok.txt