#!/bin/sh

sed -i 's/openwrt.freeioe.org:81/downloads.openwrt.org/g' /etc/opkg/distfeeds.conf
sed -ie '/kooiot/d' /etc/opkg/distfeeds.conf
sed -ie '/kooiot/d' /etc/opkg/customfeeds.conf
echo "src/gz kooiot http://freeioe.oss-cn-beijing.aliyuncs.com/openwrt/19.07-SNAPSHOT/packages/arm_cortex-a7_neon-vfpv4/kooiot" >> /etc/opkg/distfeeds.conf

# echo "src/gz kooiot http://<YOUR_OSS_URL>/openwrt/19.07-SNAPSHOT/packages/arm_cortex-a7_neon-vfpv4/kooiot" >> /etc/opkg/distfeeds.conf

sed -ie '/option check_signature/d' /etc/opkg.conf

echo "opkg update && opkg install auto-upgrader" > /tmp/backend_script.sh

# echo "sed -i 's/freeioe.oss-cn-beijing.aliyuncs.com/<YOUR_OSS_URL>/g'  /etc/auto_upgrader.conf" >> /tmp/backend_script.sh

echo "sed -ie '/RUN/d' /etc/auto_upgrader.conf" >> /tmp/backend_script.sh
echo "echo \"RUN=1\" >> /etc/auto_upgrader.conf" >> /tmp/backend_script.sh
echo "/etc/init.d/auto_upgrader restart" >> /tmp/backend_script.sh

chmod a+x /tmp/backend_script.sh
sh /tmp/backend_script.sh &

