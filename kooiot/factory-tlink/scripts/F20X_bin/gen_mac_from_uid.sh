#!/bin/sh

export_f20x_uid_mac() {
	local count="$1"
	local uid_file="/sys/fsl_otp/HW_OCOTP_CFG1"
	local uid mac0 mac1 mac2 mac3 mac_val
	local mac_base="b0c9"

	if [ -z "$count" ]; then
		echo "UNKNOWN COUNT"
		return 1
	fi
	if [ ! -e ${uid_file} ]; then
		echo "UNKNOWN UID FILE"
		return 2
	fi

	uid=$(cat ${uid_file})

	mac0="${uid:2:2}"
	mac1="${uid:4:2}"
	mac2="${uid:6:2}"
	mac3="${uid:8:2}"

	ret=""
	for i in $(seq ${count} -1 1)
	do
		mac_val="${mac_base:0:2}:${mac_base:2:2}:${mac0}:${mac1}:${mac2}:${mac3}"

		if [ -z "$ret" ]; then
			ret="${mac_val}"
		else
			ret="${ret} ${mac_val}"
		fi

		mac0_val=`expr ${mac0} + 1`
		mac0_val=$(( ${mac0_val} % 100 ))
		mac0=$(printf '%02d' ${mac0_val})
	done

	echo "${ret}"

	return 0
}

mac_file="/sys/fsl_otp/HW_OCOTP_MAC0"
mac_0=$(cat ${mac_file})

if [ $mac_0 != "0x0" ]; then
	echo "MAC exists!"
	exit 0
fi

mac="$(export_f20x_uid_mac 2)"

echo ${mac}

write_mac.sh ${mac}

rm -f /mnt/sympad/device.lis

