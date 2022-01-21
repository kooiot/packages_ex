#! /bin/sh

. /lib/functions.sh

if [ -f /lib/functions/tlink.sh ]; then
	. /lib/functions/tlink.sh
fi

if [ -f /mnt/data/factory-tlink/robot-client ]; then
	echo "Stop services.... "
	if [ -e /etc/init.d/skynet ]; then
		/etc/init.d/skynet stop
	fi
	if [ -e /etc/init.d/symlink ]; then
		/etc/init.d/symlink stop
	fi

	cd /mnt/data/factory-tlink
	echo "Start factory Test $(product_sn)"
	./robot-client --client_id="$(product_sn)"
else
	echo "ERROR: robot-client missing"
fi
