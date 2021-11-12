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
		"32100")
			echo "TRTX01${week:2:4}0${seq}"
			;;
		"32102")
			echo "TRTS01${week:2:4}0${seq}"
			;;
		"32104")
			echo "TRTK01${week:2:4}0${seq}"
			;;
		"32106")
			echo "DLYM01${week:2:4}0${seq}"
			;;
		"32108")
			echo "DLYM02${week:2:4}0${seq}"
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
			echo "2-32100-00${week}-${seq:1:5}"
			;;
		"TRTS01")
			echo "2-32102-00${week}-${seq:1:5}"
			;;
		"TRTK01")
			echo "2-32104-00${week}-${seq:1:5}"
			;;
		"DLYM01")
			echo "2-32106-00${week}-${seq:1:5}"
			;;
		"DLYM02")
			echo "2-32108-00${week}-${seq:1:5}"
			;;
	esac
}

