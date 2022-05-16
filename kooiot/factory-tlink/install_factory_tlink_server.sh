#!/bin/sh

sed -i 's/openwrt.freeioe.org:81/downloads.openwrt.org/g' /etc/opkg/distfeeds.conf
sed -ie '/video/d' /etc/opkg/distfeeds.conf
sed -ie '/freifunk/d' /etc/opkg/distfeeds.conf
sed -ie '/kooiot/d' /etc/opkg/distfeeds.conf
sed -ie '/kooiot/d' /etc/opkg/customfeeds.conf

source /etc/openwrt_release
echo "src/gz kooiot http://freeioe.oss-cn-beijing.aliyuncs.com/openwrt/${DISTRIB_RELEASE}/packages/${DISTRIB_ARCH}/kooiot" >> /etc/opkg/distfeeds.conf

# sed -ie '/option check_signature/d' /etc/opkg.conf
if [ -f /etc/opkg/keys/cce9dfbc10bada5a ]; then
echo "opkg key exists"
else
echo "untrusted comment: Local build key" > /etc/opkg/keys/cce9dfbc10bada5a
echo "RWTM6d+8ELraWs5mgLVvXjWu0abxvMzBra4vQGSnNzCBbT6+lnAcAggc" >> /etc/opkg/keys/cce9dfbc10bada5a
fi

opkg update && opkg install robot-server robot-pong robot-web

# TODO: Change network IPs

uci del network.lan.netmask
uci del network.lan.ipaddr
uci add_list network.lan.ipaddr='192.168.0.139/24'
uci add_list network.lan.ipaddr='192.168.1.139/24'
uci add_list network.lan.ipaddr='192.168.2.139/24'
uci add_list network.lan.ipaddr='192.168.3.139/24'
uci add_list network.lan.ipaddr='192.168.4.139/24'
uci commit network
