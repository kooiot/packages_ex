#!/bin/sh

#
# (c) 2023-2024 Cezary Jackiewicz <cezary@eko.one.pl>
#

# fine the network configruation first

. /lib/functions.sh

CONFIGSEC=$1

# find any device
DEVICES=$(find /dev -name "ttyUSB*" -o -name "ttyACM*" -o -name "wwan*at*" | sort -r)
for DEVICE in $DEVICES; do
	gcom -d $DEVICE -s /usr/share/3ginfo/check.gcom >/dev/null 2>&1
	if [ $? = 0 ]; then
		# Do not set 3ginfo state, as it is no reliable
		# uci_set_state 3ginfo "$CONFIGSEC" device "$DEVICE"
		echo "$DEVICE"
		exit 0
	fi
done

echo ""
exit 0
