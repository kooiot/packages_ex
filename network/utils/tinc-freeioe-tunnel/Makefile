#
# Copyright (C) 2019 Dirk Chang
#
#

include $(TOPDIR)/rules.mk

PKG_NAME:=tinc-freeioe-tunnel
PKG_VERSION:=20190819
PKG_RELEASE:=3
PKG_LICNESE:=MIT

include $(INCLUDE_DIR)/package.mk

define Package/tinc-freeioe-tunnel
  SECTION:=net
  CATEGORY:=Network
  TITLE:=FreeIOE network tunnel over tinc
  DEPENDS:=+tinc
  MAINTAINER:=Dirk Chang <dirk@kooiot.com>
endef

define Package/tinc-freeioe-tunnel/description
  Utils to build network tunnel over tinc with FreeIOE services
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/tinc-freeioe-tunnel/install
	$(INSTALL_DIR) $(1)/etc/tinc
	$(CP) ./files/etc/tinc/* $(1)/etc/tinc
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./uci_defaults/tinc-freeioe-tunnel $(1)/etc/uci-defaults/tinc-freeioe-tunnel
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/init.d/symbridge $(1)/etc/init.d/symbridge
	$(INSTALL_BIN) ./files/init.d/symrouter $(1)/etc/init.d/symrouter
endef

define Package/tinc-freeioe-tunnel/postinst
	#!/bin/sh
	[ -n "$${IPKG_INSTROOT}" ] && exit 0	# if run within buildroot exit

	if [ -f /etc/uci-defaults/tinc-freeioe-tunnel ]; then
		sh /etc/uci-defaults/tinc-freeioe-tunnel
		rm -f /etc/uci-defaults/tinc-freeioe-tunnel
	fi
endef

define Package/tinc-freeioe-tunnel/prerm
	#!/bin/sh
	[ -n "$${IPKG_INSTROOT}" ] && exit 0	# if run within buildroot exit

	/etc/init.d/symbridge stop
	/etc/init.d/symbridge disable

	/etc/init.d/symrouter stop
	/etc/init.d/symrouter disable

	uci del_list network.lan.ifname='symgridge'
	uci delete network.symrouter
	uci commit network

	exit 0
endef

$(eval $(call BuildPackage,tinc-freeioe-tunnel))
