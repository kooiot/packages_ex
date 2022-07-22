#
# Copyright (C) 2019 Dirk Chang
#
#

include $(TOPDIR)/rules.mk

PKG_NAME:=tlink-usb2lcd
PKG_VERSION:=1.0
PKG_RELEASE:=1
PKG_LICNESE:=MIT

include $(INCLUDE_DIR)/package.mk

define Package/tlink-usb2lcd
  SECTION:=kooiot
  CATEGORY:=KooIoT
  TITLE:=ThingsLink USB2LCD necessery kernel options selection
  DEPENDS:=+lcd4linux-custom +@LCD4LINUX_CUSTOM_DRIVER_FW8888 \
		   +@LCD4LINUX_CUSTOM_DRIVER_GLCD2USB \
		   +@LCD4LINUX_CUSTOM_DRIVER_LCD2USB \
		   +@LCD4LINUX_CUSTOM_DRIVER_LEDMatrix \
		   +@LCD4LINUX_CUSTOM_DRIVER_MatrixOrbital \
		   +@LCD4LINUX_CUSTOM_DRIVER_MatrixOrbitalGX \
		   +@LCD4LINUX_CUSTOM_DRIVER_NULL \
		   +@LCD4LINUX_CUSTOM_DRIVER_PNG \
		   +@LCD4LINUX_CUSTOM_DRIVER_USBLCD \
		   +@LCD4LINUX_CUSTOM_PLUGIN_button_exec \
		   +@LCD4LINUX_CUSTOM_PLUGIN_cpuinfo \
		   +@LCD4LINUX_CUSTOM_PLUGIN_diskstats \
		   +@LCD4LINUX_CUSTOM_PLUGIN_event \
		   +@LCD4LINUX_CUSTOM_PLUGIN_exec \
		   +@LCD4LINUX_CUSTOM_PLUGIN_file \
		   +@LCD4LINUX_CUSTOM_PLUGIN_loadavg \
		   +@LCD4LINUX_CUSTOM_PLUGIN_meminfo \
		   +@LCD4LINUX_CUSTOM_PLUGIN_netdev \
		   +@LCD4LINUX_CUSTOM_PLUGIN_netinfo \
		   +@LCD4LINUX_CUSTOM_PLUGIN_ppp \
		   +@LCD4LINUX_CUSTOM_PLUGIN_proc_stat \
		   +@LCD4LINUX_CUSTOM_PLUGIN_statfs \
		   +@LCD4LINUX_CUSTOM_PLUGIN_uname \
		   +@LCD4LINUX_CUSTOM_PLUGIN_uptime 
  MAINTAINER:=Dirk Chang <dirk@kooiot.com>
endef

define Package/tlink-usb2lcd/description
  ThingsLink USB2LCD selections
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/tlink-usb2lcd/install
	$(CP) ./files/* $(1)
endef

define Package/freeioe/preinst
#!/bin/sh
[ -n "$${IPKG_INSTROOT}" ] && exit 0	# if run within buildroot exit

[ -f /etc/uci-defaults/99_tlink-usb2lcd ] && rm -f /etc/uci-defaults/99_tlink-usb2lcd

# stop service if PKG_UPGRADE
[ "$${PKG_UPGRADE}" = "1" ] && /etc/init.d/lcd4linux stop >/dev/null 2>&1

[ -f /etc/lcd4linux.conf.pk ] || mv /etc/lcd4linux.conf /etc/lcd4linux.conf.pk
cp -f /etc/lcd4linux.conf.tlink /etc/lcd4linux.conf

exit 0	# suppress errors from stop command
endef

define Package/freeioe/postinst
#!/bin/sh
[ -n "$${IPKG_INSTROOT}" ] && exit 0	# if run within buildroot exit

# Start service
/etc/init.d/lcd4linux enable && /etc/init.d/lcd4linux restart >/dev/null 2>&1

exit 0
endef

define Package/freeioe/prerm
#!/bin/sh
[ -n "$${IPKG_INSTROOT}" ] && exit 0	# if run within buildroot exit

[ -f /etc/lcd4linux.conf.pk ] && mv -f /etc/lcd4linux.conf.pk /etc/lcd4linux.conf

/etc/init.d/lcd4linux restart

exit 0
endef


$(eval $(call BuildPackage,tlink-usb2lcd))
