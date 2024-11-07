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
			echo "DLYM01${week:2:4}1${seq}"
			;;
		"32105")
			echo "DLYM02${week:2:4}1${seq}"
			;;
		"32106")
			echo "TRTX03${week:2:4}0${seq}"
			;;
		"32107")
			echo "TRTK02${week:2:4}0${seq}"
			;;
		"34100")
			echo "TRTK2X${week:2:4}1${seq}"
			;;
		"34101")
			echo "TRTK2X${week:2:4}2${seq}"
			;;
		"34102")
			echo "TRTK2X${week:2:4}3${seq}"
			;;
		"34103")
			echo "TRTK2X${week:2:4}4${seq}"
			;;
		"34104")
			echo "TRTK2X${week:2:4}5${seq}"
			;;
		"34105")
			echo "TRTK2X${week:2:4}6${seq}"
			;;
		"34106")
			echo "TRTK2X${week:2:4}7${seq}"
			;;
		"34107")
			echo "TRTK2X${week:2:4}8${seq}"
			;;
		"34108")
			echo "TRTK2X${week:2:4}9${seq}"
			;;
		"34109")
			echo "TRTK4A${week:2:4}1${seq}"
			;;
		"34110")
			echo "TRTK4A${week:2:4}2${seq}"
			;;
		"34111")
			echo "TRTK4A${week:2:4}3${seq}"
			;;
		"34112")
			echo "TRTK4G${week:2:4}1${seq}"
			;;
		"34113")
			echo "TRTK4G${week:2:4}2${seq}"
			;;
		"34114")
			echo "TRTK4G${week:2:4}3${seq}"
			;;
		"34201") # CT102
			echo "TRTE01${week:2:4}1${seq}"
			;;
		"34202") # CT102
			echo "TRTE01${week:2:4}2${seq}"
			;;
		"34203") # CTx2
			echo "TRTE01${week:2:4}3${seq}"
			;;
		"34204") # CTx3
			echo "TRTE01${week:2:4}4${seq}"
			;;
		"35100")
			echo "TRTR4X${week:2:4}1${seq}"
			;;
		"35101")
			echo "TRTR4X${week:2:4}2${seq}"
			;;
		"35200")
			echo "TRTR4X${week:2:4}3${seq}"
			;;
		"35201")
			echo "TRTR4X${week:2:4}4${seq}"
			;;
		"35300")
			echo "TRTR70${week:2:4}1${seq}"
			;;
		"35301")
			echo "TRTR70${week:2:4}2${seq}"
			;;
		"35302")
			echo "TRTR70${week:2:4}3${seq}"
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
	local sub_type="${seq:0:1}"

	case "$(board_name)" in
	"kooiot,tlink-x1"|\
	"kooiot,tlink-x1s")
		typ="KEEP_TRT_WAY"
		;;
	esac

	if [ "${typ}"x != "KEEP_TRT_WAY"x ] && [ "${sub_type}"x != "0"x ]; then
		case "${typ:0:3}" in
			"TRT")
				product_sn_decode_sub $1
				return
				;;
			"DLY")
				product_sn_decode_sub $1
				return
				;;
			*)
				;;
		esac
	fi

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
		"DLYM01") #兼容以前的格式
			echo "2-32104-00${week}-${seq:1:5}"
			;;
		"DLYM02") #兼容以前的格式
			echo "2-32105-00${week}-${seq:1:5}"
			;;
		"TRTX03")
			echo "2-32106-00${week}-${seq:1:5}"
			;;
		"TRTK02") # C410
			echo "2-32107-00${week}-${seq:1:5}"
			;;
		"TRTK20") #兼容以前的格式
			echo "2-34100-00${week}-${seq:1:5}"
			;;
		"TRTK21") #兼容以前的格式
			echo "2-34101-00${week}-${seq:1:5}"
			;;
		"TRTK22") #兼容以前的格式
			echo "2-34102-00${week}-${seq:1:5}"
			;;
		"TRTK23") #兼容以前的格式
			echo "2-34103-00${week}-${seq:1:5}"
			;;
		"TRTK24") #兼容以前的格式
			echo "2-34104-00${week}-${seq:1:5}"
			;;
		"TRTK25") #兼容以前的格式
			echo "2-34105-00${week}-${seq:1:5}"
			;;
		"TRTK26") #兼容以前的格式
			echo "2-34106-00${week}-${seq:1:5}"
			;;
		"TRTK27") #兼容以前的格式
			echo "2-34107-00${week}-${seq:1:5}"
			;;
		"TRTK28") #兼容以前的格式
			echo "2-34108-00${week}-${seq:1:5}"
			;;
		"TRTK40") #兼容以前的格式
			echo "2-34109-00${week}-${seq:1:5}"
			;;
		"TRTK41") #兼容以前的格式
			echo "2-34110-00${week}-${seq:1:5}"
			;;
		"TRTK42") #兼容以前的格式
			echo "2-34111-00${week}-${seq:1:5}"
			;;
		"TRTK43") #兼容以前的格式
			echo "2-34112-00${week}-${seq:1:5}"
			;;
		"TRTK44") #兼容以前的格式
			echo "2-34113-00${week}-${seq:1:5}"
			;;
		"TRTK45") #兼容以前的格式
			echo "2-34114-00${week}-${seq:1:5}"
			;;
		"TRTR40") #兼容以前的格式
			echo "2-35100-00${week}-${seq:1:5}"
			;;
		"TRTR41") #兼容以前的格式
			echo "2-35101-00${week}-${seq:1:5}"
			;;
		"TRTR42") #兼容以前的格式
			echo "2-35200-00${week}-${seq:1:5}"
			;;
		"TRTR43") #兼容以前的格式
			echo "2-35201-00${week}-${seq:1:5}"
			;;
		"TRTR70") #兼容以前的格式
			echo "2-35300-00${week}-${seq:1:5}"
			;;
		"TRTR71") #兼容以前的格式
			echo "2-35301-00${week}-${seq:1:5}"
			;;
		"TRTR72") #兼容以前的格式
			echo "2-35302-00${week}-${seq:1:5}"
			;;
		*)
			echo "$psn"
			;;
	esac
}

product_sn_decode_sub() {
	local psn="$1"
	local typ="${psn:0:6}"
	local week="${psn:6:4}"
	local sub_type="${psn:10:1}"
	local seq="${psn:11:5}"

	local symlink_type=""
	case "${typ}" in
		"TRTE01")
			symlink_type="3420${sub_type}"
			;;
		"TRTK20")
			symlink_type="$((34200+sub_type-1))"
			;;
		"TRTK4A")
			symlink_type="$((34109+sub_type-1))"
			;;
		"TRTK4G")
			symlink_type="$((34112+sub_type-1))"
			;;
		"TRTR40"|\
		"TRTR4X")
			if [ "${sub_type}"x == "1"x ] || [ "${sub_type}"x == "2"x ]; then 
				symlink_type="$((35100+sub_type-1))"
			else
				symlink_type="$((35200+sub_type-3))"
			fi
			;;
		"TRTR70")
			symlink_type="$((35300+sub_type-1))"
			;;
		"DLYM01")
			symlink_type="$((32104+sub_type-1))"
			;;
		"DLYM02")
			symlink_type="$((32105+sub_type-1))"
			;;
		*)
			echo "${typ}"
			;;
	esac
	echo "2-${symlink_type}-00${week}-${seq:0:5}"
}
