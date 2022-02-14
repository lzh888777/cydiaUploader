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
# scp -r $curPath root@101.34.200.141:/root/liuzhihua/
ssh root@101.34.200.141 'bash -s' < /root/liuzhihua/cydia/git_command.sh