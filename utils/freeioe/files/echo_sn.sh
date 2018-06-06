#!/bin/sh
echo "===DEVICE INFORMATION============================="
echo -n "Device SN "
ifconfig eth0 | grep "HWaddr" | awk '{print $5}' | sed 's/://g'
echo "--------------------------------------------------"
echo -n "br-lan"
ifconfig br-lan | grep "inet addr"
echo -n "eth1  "
ifconfig eth1 | grep "inet addr"
