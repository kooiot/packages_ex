#!/bin/bash
ip xfrm state flush
ip xfrm state add src 172.100.0.15 dst 172.100.0.16 proto esp spi 0x11111112 mode tunnel auth sha1 0xaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa enc aes 0xffffffffffffffffffffffffffff1111
if [ $? -ne 0 ];then
	echo "ip xfrm state test failed"
	exit -1
fi
ip xfrm policy  flush
ip xfrm policy add src 192.168.18.101 dst 192.168.18.102 dir out ptype main tmpl src 192.168.18.101 dst 192.168.18.102 proto esp mode tunnel
if [ $? -ne 0 ];then
	echo "ip xfrm policy test failed"
	exit -1
fi
echo "ip xfrm test success!"
