#!/bin/sh

[ "$DEVTYPE" = usb_device ] || exit 0

vid=$(cat /sys$DEVPATH/idVendor)
pid=$(cat /sys$DEVPATH/idProduct)

[ "$vid" = "0403" -a "$pid" = "c630" ] && {
	[ "$ACTION" = bind ] && {
		logger -t hotplug "restart lcd4linux service.."
		/etc/init.d/lcd4linux restart &
	}
	[ "$ACTION" = unbind ] && {
		logger -t hotplug "stop lcd4linux service.."
		/etc/init.d/lcd4linux stop &
	}
}
