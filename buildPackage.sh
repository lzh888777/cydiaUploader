#!/bin/sh
curPath=$(cd "$(dirname $0)";pwd)
echo $curPath
rm -f Packages
rm -f Packages.gz
rm -f Packages.bz2
dpkg-scanpackages debs /dev/null > Packages
tar zcvf Packages.gz Packages
bzip2 -k Packages Packages.bz2
find . -name '*.DS_Store' -type f -delete
export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890
git add .
git commit -m 'update'
git push
# scp -r $curPath root@101.34.200.141:/root/liuzhihua/
# ssh root@101.34.200.141 'bash -s' < $curPath/git_command.sh
ssh root@101.34.200.141 > /dev/null 2>&1 << eeooff
cd /root/liuzhihua/cydia
git pull
exit
eeooff
echo Done!

