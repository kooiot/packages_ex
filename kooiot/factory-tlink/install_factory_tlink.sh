#!/bin/sh

sed -i 's/openwrt.freeioe.org:81/downloads.openwrt.org/g' /etc/opkg/distfeeds.conf
sed -ie '/kooiot/d' /etc/opkg/distfeeds.conf
sed -ie '/kooiot/d' /etc/opkg/customfeeds.conf
. /etc/openwrt_release
echo "src/gz kooiot http://freeioe.oss-cn-beijing.aliyuncs.com/openwrt/$(DISTRIB_RELEASE)/packages/$(DISTRIB_ARCH)/kooiot" >> /etc/opkg/distfeeds.conf

# sed -ie '/option check_signature/d' /etc/opkg.conf
echo "untrusted comment: Local build key\nRWTM6d+8ELraWs5mgLVvXjWu0abxvMzBra4vQGSnNzCBbT6+lnAcAggc" > /etc/opkg/keys/cce9dfbc10bada5a

opkg update && opkg install factory-tlink robot-client

cp -p /usr/bin/robot-client /mnt/factory-tlink/
cp -p /etc/robot/robot-client/* /mnt/factory-tlink/
