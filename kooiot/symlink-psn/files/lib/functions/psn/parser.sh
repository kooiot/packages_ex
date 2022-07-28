#!/bin/sh

. /lib/functions.sh

# SymLink PSN example: 2-32101-001935-00100
# PSN: TRTX011935000100

product_sn_x01_x03() {
	local sn_num="$1"
	case "$(board_name)" in
		"kooiot,tlink-x1"|\
		"kooiot,tlink-x1s")
			echo "TRTX01${sn_num}"
		;;
		"kooiot,tlink-x3")
			echo "TRTX03${sn_num}"
		;;
		*)
			echo "UNKNOWN.Board!"
		;;
	esac
}

product_sn_encode() {
	local spsn="$1"
	local ver="${spsn:0:1}"
	local typ="${spsn:2:5}"
	local week="${spsn:8:6}"
	local seq="${spsn:15:5}"

	if [ "$ver" == "T" ]; then
		typ="KEEP_TRT_WAY"
	fi

	case "${typ}" in
		"32101")
			# product_sn_x01_x03 "${week:2:4}0${seq}"
			echo "TRTX01${week:2:4}0${seq}"
			;;
		"32102")
			echo "TRTS01${week:2:4}0${seq}"
			;;
		"32103")
			echo "TRTK01${week:2:4}0${seq}"
			;;
		"32104")
			echo "DLYM01${week:2:4}0${seq}"
			;;
		"32105")
			echo "DLYM02${week:2:4}0${seq}"
			;;
		"32106")
			echo "TRTX03${week:2:4}0${seq}"
			;;
		"32107")
			echo "TRTK02${week:2:4}0${seq}"
			;;
		*)
			echo "$spsn"
			;;
	esac
}

product_sn_decode() {
	local psn="$1"
	local typ="${psn:0:6}"
	local week="${psn:6:4}"
	local seq="${psn:10:6}"

	case "$(board_name)" in
	"kooiot,tlink-x1"|\
	"kooiot,tlink-x1s")
		typ="KEEP_TRT_WAY"
		;;
	esac

	case "${typ}" in
		"TRTX01")
			echo "2-32101-00${week}-${seq:1:5}"
			;;
		"TRTS01")
			echo "2-32102-00${week}-${seq:1:5}"
			;;
		"TRTK01")
			echo "2-32103-00${week}-${seq:1:5}"
			;;
		"DLYM01")
			echo "2-32104-00${week}-${seq:1:5}"
			;;
		"DLYM02")
			echo "2-32105-00${week}-${seq:1:5}"
			;;
		"TRTX03")
			echo "2-32106-00${week}-${seq:1:5}"
			;;
		"TRTK02")
			echo "2-32107-00${week}-${seq:1:5}"
			;;
		*)
			echo "$psn"
			;;
	esac
}

