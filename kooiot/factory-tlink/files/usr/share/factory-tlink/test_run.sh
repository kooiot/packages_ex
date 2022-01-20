#! /bin/sh

if [ -f /mnt/data/factory-tlink/robot-client ]; then
# Stop services
	/etc/init.d/skynet stop
	/etc/init.d/symlink stop
# Start robot-client
	cd /mnt/data/factory-tlink
	./robot-client
else
	echo "ERROR: robot-client missing"
fi
