#! /bin/bash

mkdir -p temp 

cp -p ~/mycode/robot/release/robot-client_linux_arm temp/robot-client
cp -r ~/mycode/robot/conf/robot-client/config.yaml temp/
cp -r ~/mycode/packages_ex/kooiot/factory-tlink/files/usr/share/factory-tlink/* temp/
rm -f temp/rc.local

scp -rp temp symlink:/root/factory-tlink
scp -rp F20X_bin/* symlink:/usr/sbin

rm temp -rf
