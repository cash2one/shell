cat links.txt|while read line;do curl -s $line |grep "anscont"|wc -l;done >> ok.txt
