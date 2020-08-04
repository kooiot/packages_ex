#!/bin/sh

gpio_out() {
	local gpio_pin
	local value

	gpio_pin="$1"
	value="$2"

	local gpio_path="/sys/class/gpio/gpio${gpio_pin}"
	# export GPIO pin for access
	[ -d "$gpio_path" ] || {
		echo "$gpio_pin" >/sys/class/gpio/export
		# we need to wait a bit until the GPIO appears
		[ -d "$gpio_path" ] || sleep 1
		echo out >"$gpio_path/direction"
	}
	# write 0 or 1 to the "value" field
	{ [ "$value" = "0" ] && echo "0" || echo "1"; } >"$gpio_path/value"
}

gpio_in() {
	local gpio_pin

	gpio_pin="$1"

	local gpio_path="/sys/class/gpio/gpio${gpio_pin}"
	# export GPIO pin for access
	[ -d "$gpio_path" ] || {
		echo "$gpio_pin" >/sys/class/gpio/export
		# we need to wait a bit until the GPIO appears
		[ -d "$gpio_path" ] || sleep 1
		echo in >"$gpio_path/direction"
	}
	# read the "value" field
	return $(cat $gpio_path/value)
}

export_product_sn_kooiot() {
	product_sn=$(uci -p /var/state/ get system.sys_info.serial 2>/dev/null)

	mkdir -p /tmp/sysinfo

	if [ -z "${product_sn}" ]; then
		return
	fi

	[ -e /tmp/sysinfo/product_sn ] || \
		echo "BMTR01${product_sn:2:6}0${product_sn:8:3}" > /tmp/sysinfo/product_sn

	[ -e /tmp/sysinfo/cloud ] || \
		echo "ioe.thingsroot.com" > /tmp/sysinfo/cloud
}


product_sn() {
	if [ ! -e /tmp/sysinfo/product_sn ]; then
		export_product_sn_kooiot
	fi

	[ -e /tmp/sysinfo/product_sn ] && cat /tmp/sysinfo/product_sn || echo "UNKNOWN_DEVICE_SN"
}

ioe_cloud() {
	[ -e /tmp/sysinfo/cloud ] && cat /tmp/sysinfo/cloud || echo "ioe.kooiot.com"
}

avoid_empty_passwd() {
	if ( grep -qs '^root::' /etc/shadow && \
		 [ -z "$FAILSAFE" ] )
	then
		local default_pw='root:$1$pMlMRXYW$H06ycPKhVzpVfSsy2zc1P0:17997'
		sed -i "s/^root::0:/${default_pw}/g" /etc/shadow
cat << EOF
=== WARNING! =====================================
The default root password created on this device!
--------------------------------------------------
EOF
	fi
}


#test() {
#	local mac
#	read_tlink_efuse_mac mac 1
#	echo "MAC ${mac}"
#}
#
#test
