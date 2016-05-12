'''
fabu	昨天发布的详情页url，比如：/jiaju/qg_000.html
zq		昨天日志里抓取的url
'''
for line in `cat fabu`
	do
	if cat zq|grep "$line";then
	echo $line "y" >> temp
	else
	echo $line "n" >> temp
	fi
	done
echo "昨天发布且被抓取条数："
grep "y" temp|wc -l
cat temp|awk '{if($2=="y") {n =n+1}}END{print "抓取率",n/NR*100"%"}'
cat temp|awk '{if($2=="y") {n =n+1}}END{print "抓取率",n/NR*100"%"}' >> result
echo "没有被抓到的URL：" >>result
cat temp|awk '{if($2=="n") {print $1}}' >>result
echo "统计结果保存在result中！"
rm temp
