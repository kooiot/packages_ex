#!/bin/sh

#
# (c) 2010-2017 Cezary Jackiewicz <cezary@eko.one.pl>
#

RES="/usr/share/3ginfo-lite"

DEVICE=$(uci -q get 3ginfo.@3ginfo[0].device)
if [ "x$DEVICE" = "x" ]; then
	touch /tmp/modem
	DEVICE=$(cat /tmp/modem)
fi

if [ "x$DEVICE" = "x" ]; then
	devices=$(ls /dev/ttyUSB* /dev/cdc-wdm* /dev/ttyACM* /dev/ttyHS* 2>/dev/null | sort -r)
	for d in $devices; do
		DEVICE=$d gcom -s $RES/probeport.gcom > /dev/null 2>&1
		if [ $? = 0 ]; then
			echo "$d" > /tmp/modem
			break
		fi
	done
	DEVICE=$(cat /tmp/modem)
fi

if [ "x$DEVICE" = "x" ]; then
	echo "{}"
	exit 0
fi

O=$(gcom -d $DEVICE -s $RES/3ginfo.gcom 2>/dev/null)

# CSQ
CSQ=$(echo "$O" | awk -F[,\ ] '/^\+CSQ/ {print $2}')

[ "x$CSQ" = "x" ] && CSQ=-1
if [ $CSQ -ge 0 -a $CSQ -le 31 ]; then
	CSQ_PER=$(($CSQ * 100/31))
else
	CSQ="-"
	CSQ_PER="0"
fi

# COPS numeric
COPS_NUM=$(echo "$O" | awk -F[\"] '/^\+COPS: .,2/ {print $2}')
if [ "x$COPS_NUM" = "x" ]; then
	COPS_NUM="-"
	COPS_MCC="-"
	COPS_MNC="-"
else
	COPS_MCC=${COPS_NUM:0:3}
	COPS_MNC=${COPS_NUM:3:3}
	COPS=$(awk -F[\;] '/'$COPS_NUM'/ {print $2}' $RES/mccmnc.dat)
fi
[ "x$COPS" = "x" ] && COPS=$COPS_NUM

# COPS alphanumeric
T=$(echo "$O" | awk -F[\"] '/^\+COPS: .,0/ {print $2}')
if [ "x$T" != "x" ]; then
	if [ "x$T" != "x$COPS" ]; then
		COPS="$T"
	fi
fi

# CREG
T=99
CNT=$(echo "$O" | grep "+CREG:" | sed 's/[^:,]//g')
if [ "x$CNT" = "x:,,," -o "x$CNT" = "x:,,,," ]; then
	T=$(echo "$O" | awk -F[,] '/^\+CREG/ {print $2}')
else
	CNT=$(echo "$O" | grep "+CGREG:" | sed 's/[^:,]//g')
	if [ "x$CNT" = "x:,,," -o "x$CNT" = "x:,,,," ]; then
		T=$(echo "$O" | awk -F[,] '/^\+CGREG/ {print $2}')
	fi
fi
case "$T" in
	0*) REG="0";;
	1*) REG="1";;
	2*) REG="2";;
	3*) REG="3";;
	5*) REG="5";;
	 *) REG="-";;
esac

# MODE
T=$(echo "$O" | awk -F[,] '/^\+COPS/ {print $4}' | head -1)
[ -z "$T" ] && T=$(echo "$O" | awk -F[,] '/^\+CREG/ {print $5}')
case "$T" in
	2*) MODE="UMTS";;
	3*) MODE="EDGE";;
	4*) MODE="HSDPA";;
	5*) MODE="HSUPA";;
	6*) MODE="HSPA";;
	7*) MODE="LTE";;
	 *) MODE="-";;
esac

echo "{\"csq\":\"$CSQ\",\"signal\":\"$CSQ_PER\",\"operator_name\":\"$COPS\",\"operator_mcc\":\"$COPS_MCC\",\"operator_mnc\":\"$COPS_MNC\",\"mode\":\"$MODE\",\"registration\":\"$REG\"}"

exit 0
