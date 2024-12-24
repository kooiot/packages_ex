#
# Copyright (C) 2021 Dirk Chang
#
#

include $(TOPDIR)/rules.mk

PKG_NAME:=br-lan-dhcp
PKG_VERSION:=2021.10.13
PKG_RELEASE:=1
PKG_LICNESE:=MIT

include $(INCLUDE_DIR)/package.mk

define Package/br-lan-dhcp
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Lan Bridge DHCP Eanble Configurations
  MAINTAINER:=Dirk Chang <dirk@kooiot.com>
endef

define Package/br-lan-dhcp/description
  Enable DHCP on lan bridage
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/br-lan-dhcp/install
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./uci_defaults/99_tlink-br-lan-dhcp $(1)/etc/uci-defaults/99_tlink-br-lan-dhcp
endef

define Package/br-lan-dhcp/postinst
	#!/bin/sh
	[ -n "$${IPKG_INSTROOT}" ] && exit 0	# if run within buildroot exit

	if [ -f /etc/uci-defaults/99_tlink-br-lan-dhcp ]; then
		sh /etc/uci-defaults/99_tlink-br-lan-dhcp
		rm -f /etc/uci-defaults/99_tlink-br-lan-dhcp
	fi

	exit 0
endef

define Package/br-lan-dhcp/prerm
	#!/bin/sh
	[ -n "$${IPKG_INSTROOT}" ] && exit 0	# if run within buildroot exit

	exit 0
endef

$(eval $(call BuildPackage,br-lan-dhcp))
