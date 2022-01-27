#!/bin/sh

rm -f Packages
rm -f Packages.gz
rm -f Packages.bz2
dpkg-scanpackages debs /dev/null > Packages
tar zcvf Packages.gz Packages
bzip2 -k Packages Packages.bz2
find . -name '*.DS_Store' -type f -delete
scp -r /Users/liuzhihua/Desktop/cydia root@101.34.200.141:/root/liuzhihua/