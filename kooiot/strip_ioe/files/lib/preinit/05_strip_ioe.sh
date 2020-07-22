do_uncompress_ioe() {
	if [ -f /usr/ioe/ipt/freeioe.tar.gz ]; then
		tar -C /usr/ioe/freeioe -xzf /usr/ioe/ipt/freeioe.tar.gz
		ln -s /usr/ioe/freeioe/openwrt/init.d/skynet /etc/init.d/skynet
	fi
	if [ -f /usr/ioe/ipt/skynet.tar.gz ]; then
		tar -C /usr/ioe/skynet -xzf /usr/ioe/ipt/freeioe.tar.gz
	fi
}

boot_hook_add preinit_main do_uncompress_ioe
