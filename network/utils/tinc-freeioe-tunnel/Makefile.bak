#
# Copyright (C) 2019 Dirk Chang
#
#

include $(TOPDIR)/rules.mk

PKG_NAME:=tinc_freeioe_tunnel
PKG_VERSION:=20190816
PKG_RELEASE:=1
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
	$(CP) ./files/* $(1)
endef

define Package/freeioe/postinst
	#!/bin/sh
	uci add_list network.lan.ifname='symbridge'
	uci set network.symrouter.prop='static'
	uci set network.symrouter.ifname='symrouter'
	uci set network.symrouter.ipaddr='10.222.0.1'
	uci set network.symrouter.netmask='255.255.255.0'

	uci commit network

	uci add firewall zone
	uci set firewall.@zone[-1].name='tosymrouter'
	uci set firewall.@zone[-1].network='symrouter'
	uci set firewall.@zone[-1].input='ACCEPT'
	uci set firewall.@zone[-1].output='ACCEPT'
	uci set firewall.@zone[-1].forward='ACCEPT'

	uci add firewall rule
	uci set firewall.@rule[-1].name='tosymrouter'
	uci set firewall.@rule[-1].src='lan'
	uci set firewall.@rule[-1].proto='all'
	uci set firewall.@rule[-1].dest='tosymrouter'
	uci set firewall.@rule[-1].target='ACCEPT'

	uci add firewall forwarding
	uci set firewall.@forwarding[-1].src='tosymrouter'
	uci set firewall.@forwarding[-1].dest='lan'

	uci add firewall forwarding
	uci set firewall.@forwarding[-1].src='lan'
	uci set firewall.@forwarding[-1].dest='tosymrouter'

	uci commit firewall
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
