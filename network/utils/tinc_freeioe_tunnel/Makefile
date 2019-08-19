#
# Copyright (C) 2019 Dirk Chang
#
#

include $(TOPDIR)/rules.mk

PKG_NAME:=tinc_freeioe_tunnel
PKG_VERSION:=20190819
PKG_RELEASE:=2
PKG_LICNESE:=MIT

include $(INCLUDE_DIR)/package.mk

define Package/tinc_freeioe_tunnel
  SECTION:=net
  CATEGORY:=Network
  TITLE:=FreeIOE network tunnel over tinc
  DEPENDS:=+tinc
  MAINTAINER:=Dirk Chang <dirk@kooiot.com>
endef

define Package/tinc_freeioe_tunnel/description
  Utils to build network tunnel over tinc with FreeIOE services
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/tinc_freeioe_tunnel/install
	$(INSTALL_DIR) $(1)/etc/tinc
	$(CP) ./files/etc/tinc/* $(1)/etc/tinc
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./uci_defaults/tinc_freeioe_tunnel $(1)/etc/uci-defaults/tinc_freeioe_tunnel
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/init.d/symbridge $(1)/etc/init.d/symbridge
	$(INSTALL_BIN) ./files/init.d/symrouter $(1)/etc/init.d/symrouter
endef

define Package/freeioe/postinst
	#!/bin/sh
	if [ -f /etc/uci-defaults/tinc_freeioe_tunnel ]; then
		sh /etc/uci-defaults/tinc_freeioe_tunnel
		rm -f /etc/uci-defaults/tinc_freeioe_tunnel
	fi
endef

define Package/freeioe/prerm
	#!/bin/sh

	/etc/init.d/symbridge stop
	/etc/init.d/symbridge disable

	/etc/init.d/symrouter stop
	/etc/init.d/symrouter disable

	uci del_list network.lan.ifname='symgridge'
	uci delete network.symrouter
	uci commit network

	exit 0
endef

$(eval $(call BuildPackage,tinc_freeioe_tunnel))
