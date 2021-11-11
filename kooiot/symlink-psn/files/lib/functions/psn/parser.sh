#!/bin/sh

# SymLink PSN example: 2-32101-001935-00100
# PSN: TRTX011935000100

product_sn_encode() {
	local spsn="$1"
	local ver="${spsn:0:1}"
	local typ="${spsn:2:5}"
	local week="${spsn:8:6}"
	local seq="${spsn:15:5}"

	case "${typ}" in
		"32101")
			echo "TRTX01${week:2:4}0${seq}"
			;;
		"32102")
			echo "TRTK01${week:2:4}0${seq}"
			;;
	esac
}

product_sn_decode() {
	local psn="$1"
	local typ="${psn:0:6}"
	local week="${psn:6:4}"
	local seq="${psn:10:6}"

	case "${typ}" in
		"TRTX01")
			echo "2-32101-00${week}-${seq:1:5}"
			;;
		"TRTK01")
			echo "2-32102-00${week}-${seq:1:5}"
			;;
	esac
}

