rsync.exe -azvP --port=31777 000.000.000.000::hclog/000.000/weblog.gz /cygdrive/e/backup/log/zhishi_jiaju/42/
rsync.exe -azvP --port=31777 000.000.000.000::hclog/000.000/weblog.gz /cygdrive/e/backup/log/zhishi_jiaju/43/

cd /cygdrive/e/backup/log/zhishi_jiaju/42
gunzip -c weblog.gz > 1.log
mv 1.log ../
cd /cygdrive/e/backup/log/zhishi_jiaju/43
gunzip -c weblog.gz > 2.log
mv 2.log ../
cd /cygdrive/e/backup/log/zhishi_jiaju
echo '脚本开始,合并日志...'
cat 2.log >>1.log
mv 1.log all.log
rm 2.log
echo '合并完成,开始分析.'
echo '/*******************百度*******************/'
echo '	总抓取：'
grep 'Baiduspider/2.0' all.log|awk '{print $7}'|wc -l
echo '	总不重复抓取：'
grep 'Baiduspider/2.0' all.log|awk '{print $7}'|sort|uniq -c|wc -l
echo '	抓取状态码个数：'
grep 'Baiduspider/2.0' all.log|awk '{print $9}'|sort|uniq -c|sort -r
echo '	家居总抓取：'
grep 'Baiduspider/2.0' all.log|awk '{if(match($7,"jiaju")) print $7}'|wc -l
echo '	家居不重复抓取：'
grep 'Baiduspider/2.0' all.log|awk '{if(match($7,"jiaju")) print $7}'|sort|uniq -c|wc -l
echo '	抓取状态码个数：'
grep 'Baiduspider/2.0' all.log|grep 'jiaju'|awk '{print $9}'|sort|uniq -c|sort -r
echo '	详情页抓取：'
grep 'Baiduspider/2.0' all.log|awk '{print $7}'|grep -P "^/jiaju/qg_[0-9]{1,6}\.html$"|wc -l
echo '	详情页不重复抓取量：'
grep 'Baiduspider/2.0' all.log|awk '{print $7}'|grep -P "^/jiaju/qg_[0-9]{1,6}\.html$"|sort|uniq -c|wc -l
#echo '	zqURL >>>>>>>>>>>'
#grep 'Baiduspider/2.0' all.log|awk '{print $7}'|grep -P "^/jiaju/qg_[0-9]{1,6}\.html$"|sort|uniq > zq
echo '	百度流量：'
grep -P '\.baidu\.com/.*(wd|word)=' all.log|grep 'jiaju'|wc -l
echo '  抓取前二十：'
grep 'Baiduspider/2.0' all.log|awk '{if($7~/jiaju/) print $7 $9}'|sort|uniq -c|sort -r|head -20
echo '/*******************搜狗*******************/'
echo '	总抓取：'
grep 'Sogou web spider/4.0' all.log|awk '{print $7}'|wc -l
echo '	总不重复抓取：'
grep 'Sogou web spider/4.0' all.log|awk '{print $7}'|sort|uniq -c|wc -l
echo '	抓取状态码个数：'
grep 'Sogou web spider/4.0' all.log|awk '{print $9}'|sort|uniq -c|sort -r
echo '	家居总抓取：'
grep 'Sogou web spider/4.0' all.log|awk '{if(match($7,"jiaju")) print $7}'|wc -l
echo '	家居不重复抓取：'
grep 'Sogou web spider/4.0' all.log|awk '{if(match($7,"jiaju")) print $7}'|sort|uniq -c|wc -l
echo '	抓取状态码个数：'
grep 'Sogou web spider/4.0' all.log|grep 'jiaju'|awk '{print $9}'|sort|uniq -c|sort -r
echo '	搜狗流量'
grep -P '\.sogou\.com/.*(query)=' all.log|grep 'jiaju'|wc -l
echo '	360流量'
grep -P '\.(so|haosou)\.com/.*(q|k)=' all.log|grep 'jiaju'|wc -l
rm all.log
#grep "Baiduspider/2.0" all.log|grep 'jiaju'|awk '{print $7}'|awk -F"[/_]" '{print $3 $4}'|sort|uniq -c|sort -nr>fenbu.CSV
