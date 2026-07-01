#!/bin/sh

. /lib/functions.sh

# SymLink PSN example: 2-32101-001935-00100
# PSN: TRTX011935000100

# Encode product SN from symlink PSN
product_sn_encode() {
	local spsn="$1"
	local ver="${spsn:0:1}"
	local typ="${spsn:2:5}"
	local week="${spsn:8:6}"
	local seq="${spsn:15:5}"

	# Handle legacy format
	[ "$ver" = "T" ] && echo "$spsn" && return

	local prefix mid_char
	case "$typ" in
		32101) prefix="TRTX01"; mid_char="0" ;;
		32102)
			if [ "$(board_name)" = "kooiot,tlink-e1" ]; then
				prefix="TRTE01"; mid_char="9"
			else
				prefix="TRTS01"; mid_char="0"
			fi
			;;
		32103) prefix="TRTK01"; mid_char="0" ;;
		32104) prefix="DLYM01"; mid_char="1" ;;
		32105) prefix="DLYM02"; mid_char="1" ;;
		32106) prefix="TRTX03"; mid_char="0" ;;
		32107) prefix="TRTK02"; mid_char="0" ;;
		3410[0-8])
			prefix="TRTK2X"
			mid_char=$((typ - 34100 + 1))
			;;
		34109|3411[0-1])
			prefix="TRTK4A"
			mid_char=$((typ - 34109 + 1))
			;;
		3411[2-4])
			prefix="TRTK4G"
			mid_char=$((typ - 34112 + 1))
			;;
		3420[1-4])
			prefix="TRTE01"
			mid_char=$((typ - 34201 + 1))
			;;
		3430[0-7])
			prefix="TRTE02"
			mid_char=$((typ - 34300 + 1))
			;;
		3510[0-1]|3520[0-1])
			prefix="TRTR4X"
			mid_char=$((typ - 35100 + 1))
			;;
		3530[0-2])
			prefix="TRTR70"
			mid_char=$((typ - 35300 + 1))
			;;
		*) echo "$spsn"; return ;;
	esac

	echo "${prefix}${week:2:4}${mid_char}${seq}"
}

# Decode product SN to symlink PSN
# PSN format: TYPXXXXWWWWSSSSSS (type=6chars, week=4chars, seq=6chars)
# - seq[0] is mid_char (determines format type)
product_sn_decode() {
	local psn="$1"
	local typ="${psn:0:6}"
	local week="${psn:6:4}"
	local seq="${psn:10:6}"
	local mid_char="${seq:0:1}"  # PSN position 11
	local seq_num="${seq:1:5}"   # PSN position 12-16

	# Special case: keep original format for specific boards
	case "$(board_name)" in
		"kooiot,tlink-x1"|"kooiot,tlink-x1s")
			echo "$psn"
			return
			;;
	esac

	# Route to appropriate decoder based on type prefix
	case "${typ:0:3}" in
		TRT|DLY)
			if [ "$mid_char" = "0" ]; then
				# Old format: mid_char=0, direct type mapping
				product_sn_decode_old "$typ" "$week" "$seq_num"
			else
				# New format: mid_char>0, extended type calculation
				product_sn_decode_new "$typ" "$week" "$mid_char" "$seq_num"
			fi
			;;
		*)
			echo "$psn"
			;;
	esac
}

# Decode old format: mid_char=0 (TYPXXXXWWWW0YYYYY)
# Maps directly to symlink type with seq_num
product_sn_decode_old() {
	local typ="$1"
	local week="$2"
	local seq_num="$3"

	case "$typ" in
		TRTX01) echo "2-32101-00${week}-${seq_num}" ;;
		TRTS01) echo "2-32102-00${week}-${seq_num}" ;;
		TRTK01) echo "2-32103-00${week}-${seq_num}" ;;
		DLYM01) echo "2-32104-00${week}-${seq_num}" ;;
		DLYM02) echo "2-32105-00${week}-${seq_num}" ;;
		TRTX03) echo "2-32106-00${week}-${seq_num}" ;;
		TRTK02) echo "2-32107-00${week}-${seq_num}" ;;
		# Legacy compatible types with mid_char=0
		TRTK2[0-8])
			local digit="${typ:5:1}"
			echo "2-$((34100 + digit))-00${week}-${seq_num}"
			;;
		TRTK4[0-2])
			local digit="${typ:5:1}"
			echo "2-$((34109 + digit))-00${week}-${seq_num}"
			;;
		TRTK4[3-5])
			local digit="${typ:5:1}"
			echo "2-$((34112 + digit - 3))-00${week}-${seq_num}"
			;;
		TRTR4[01])
			local digit="${typ:5:1}"
			echo "2-$((35100 + digit))-00${week}-${seq_num}"
			;;
		TRTR42)
			echo "2-35200-00${week}-${seq_num}"
			;;
		TRTR43)
			echo "2-35201-00${week}-${seq_num}"
			;;
		TRTR7[0-2])
			local digit="${typ:5:1}"
			echo "2-$((35300 + digit))-00${week}-${seq_num}"
			;;
		*)
			echo "${typ}${week}0${seq_num}"
			;;
	esac
}

# Decode new format: mid_char>0 (TYPXXXXWWWWXYYYYY)
# Calculates base_type using mid_char, then maps to symlink type
product_sn_decode_new() {
	local typ="$1"
	local week="$2"
	local mid_char="$3"
	local seq_num="$4"

	local base_type
	case "$typ" in
		# E01 series: mid_char=9 maps to 32102, others to 34201-34204
		TRTE01)
			if [ "$mid_char" = "9" ]; then
				base_type=32102
			else
				base_type=$((34200 + mid_char))
			fi
			;;
		# K2x series: mid_char=1-9 -> 34100-34108
		TRTK2X)
			base_type=$((34100 + mid_char - 1))
			;;
		# E02 series: mid_char=1-8 -> 34300-34307
		TRTE02)
			base_type=$((34300 + mid_char - 1))
			;;
		# K4A series: mid_char=1-3 -> 34109-34111
		TRTK4A)
			base_type=$((34109 + mid_char - 1))
			;;
		# K4G series: mid_char=1-3 -> 34112-34114
		TRTK4G)
			base_type=$((34112 + mid_char - 1))
			;;
		# R4X series: mid_char=1-2 -> 35100-35101, 3-4 -> 35200-35201
		TRTR4X)
			if [ "$mid_char" -le 2 ]; then
				base_type=$((35100 + mid_char - 1))
			else
				base_type=$((35200 + mid_char - 3))
			fi
			;;
		# R70 series: mid_char=1-3 -> 35300-35302
		TRTR70)
			base_type=$((35300 + mid_char - 1))
			;;
		# DLYM series with mid_char>0
		DLYM01)
			base_type=$((32104 + mid_char - 1))
			;;
		DLYM02)
			base_type=$((32105 + mid_char - 1))
			;;
		*)
			echo "${typ}${week}${mid_char}${seq_num}"
			return
			;;
	esac

	echo "2-${base_type}-00${week}-${seq_num}"
}
