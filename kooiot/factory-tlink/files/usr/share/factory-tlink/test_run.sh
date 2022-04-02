#! /bin/sh

. /lib/functions.sh

DIR=$1
PSN=$2

if [ -f /lib/functions/tlink.sh ]; then
	. /lib/functions/tlink.sh
	DIR=/mnt/data/factory-tlink
	PSN=$(product_sn)
fi

if [ -f ${DIR}/robot-client ]; then
	cd ${DIR}
	echo "Start factory Test ${PSN}"
	./robot-client --client_id="${PSN}"
else
	echo "ERROR: robot-client missing"
fi
