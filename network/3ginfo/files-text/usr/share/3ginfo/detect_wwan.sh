#!/bin/sh

#
# (c) 2026 Dirk Chang <dirk@kooiot.com>
#

. /lib/functions.sh
. /usr/share/libubox/jshn.sh

CONFIGSEC=$1

find_wwan_iface() {
	local cfg="$1"
	local proto device
	config_get proto "$cfg" proto
	[ "$proto" = wwan ] || return 0

	local driver=$(uci_get_state network "$cfg" driver)
	[ -z "$driver" ] && return 0

	local ctl_device=$(uci_get_state network "$cfg" ctl_device)
	local dat_device=$(uci_get_state network "$cfg" dat_device)

	[ -n "$dat_device" ] && device=$dat_device

	# Only comgt(3g.sh) use dat_device for dial-out 
	case $driver in
	comgt)
		[ -n "$ctl_device" ] && device=$ctl_device
		;;
	esac

	[ -n "device" ] && {
		uci_set_state 3ginfo "$CONFIGSEC" device "$device"
		uci_set_state 3ginfo "$CONFIGSEC" network "$cfg"
		echo "$device"
		exit 0
	}
}

getdevicepath() {
	devname="$(basename $1)"
	case "$devname" in
	'wwan'*'at'*)
		devpath="$(readlink -f /sys/class/wwan/$devname/device)"
		echo ${devpath%/*/*/*}
		;;
	'ttyACM'*)
		devpath="$(readlink -f /sys/class/tty/$devname/device)"
		echo ${devpath%/*}
		;;
	'tty'*)
		devpath="$(readlink -f /sys/class/tty/$devname/device)"
		echo ${devpath%/*/*}
		;;
	*)
		devpath="$(readlink -f /sys/class/usbmisc/$devname/device)"
		echo ${devpath%/*}
		;;
	esac
}

find_wwan_iface2() {
	local cfg="$1"
	local proto_want="${2}"
	local proto device
	config_get proto "$cfg" proto
	[ "$proto" = "$proto_want" ] || return 0

	uci_set_state 3ginfo "$CONFIGSEC" network "$cfg"

	local dat_device
	local ctl_device=$(uci_get_state network "$cfg" "device")

	local devpath=$(getdevicepath "$ctl_device")
	local vid=$(cat $devpath/idVendor)
	local pid=$(cat $devpath/idProduct)

	local devicename
	for a in $(ls /sys/bus/usb/devices); do
		local vendor product
		[ -z "$usb" -a -f /sys/bus/usb/devices/$a/idVendor -a  -f /sys/bus/usb/devices/$a/idProduct ] || continue
		vendor=$(cat /sys/bus/usb/devices/$a/idVendor)
		product=$(cat /sys/bus/usb/devices/$a/idProduct)
		[ "$vendor" = "$vid" ] && [ "$product" = "$pid" ] && {
			devicename=$a
		}
	done
	[ -f "/lib/network/wwan/$vid:$pid" ] && {
		local old_cb control data

		json_set_namespace wwan old_cb
		json_init
		json_load "$(cat "/lib/network/wwan/$vid:$pid")"
		json_select
		json_get_vars desc control data type
		json_set_namespace "$old_cb"

		[ -n "$control" -o -n "$data" ] && {
			ttys=$(ls -d /sys/bus/usb/devices/$devicename/${devicename}*/tty?* /sys/bus/usb/devices/$devicename/${devicename}*/tty/tty?* | sed "s/.*\///g" | tr "\n" " ")
			[ -n "$control" ] && {
				ctl_device=/dev/$(echo $ttys | cut -d" " -f $((control + 1)))
			}
			[ -n "$data" ] && {
				dat_device=/dev/$(echo $ttys | cut -d" " -f $((data + 1)))
			}
		}
	}

	[ -n "$dat_device" ] && device=$dat_device

	# Only comgt(3g.sh) use dat_device for dial-out 
	case $proto in
	3g)
		[ -n "$ctl_device" ] && device=$ctl_device
		;;
	esac

	[ -n "device" ] && {
		uci_set_state 3ginfo "$CONFIGSEC" device "$device"
		uci_set_state 3ginfo "$CONFIGSEC" network "$cfg"
		echo "$device"
		exit 0
	}
	echo ""
	exit 0
}

config_load network
config_foreach find_wwan_iface interface
config_foreach find_wwan_iface2 interface 'qmi'
config_foreach find_wwan_iface2 interface '3g'
config_foreach find_wwan_iface2 interface 'ncm'
