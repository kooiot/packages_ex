#
# Copyright (C) 2019 Dirk Chang
#
#

include $(TOPDIR)/rules.mk

PKG_NAME:=dj-a40i-e-configs
PKG_VERSION:=2021-09-05
PKG_RELEASE:=1
PKG_LICNESE:=MIT

include $(INCLUDE_DIR)/package.mk

define Package/dj-a40i-e-configs
  SECTION:=kooiot
  CATEGORY:=KooIoT
  TITLE:=DJ-A40i-E Configurations
  DEPENDS:=+freeioe
  MAINTAINER:=Dirk Chang <dirk@kooiot.com>
endef

define Package/dj-a40i-e-configs/description
  DJ A40i-E device configurations
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/dj-a40i-e-configs/install
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./uci_defaults/99_tlink-dj-a40i-e $(1)/etc/uci-defaults/99_tlink-dj-a40i-e
endef

define Package/dj-a40i-e-configs/postinst
	#!/bin/sh
	[ -n "$${IPKG_INSTROOT}" ] && exit 0	# if run within buildroot exit

	if [ -f /etc/uci-defaults/99_tlink-dj-a40i-e ]; then
		sh /etc/uci-defaults/99_tlink-dj-a40i-e
		rm -f /etc/uci-defaults/99_tlink-dj-a40i-e
	fi

	exit 0
endef

define Package/dj-a40i-e-configs/prerm
	#!/bin/sh
	[ -n "$${IPKG_INSTROOT}" ] && exit 0	# if run within buildroot exit

	exit 0
endef

$(eval $(call BuildPackage,dj-a40i-e-configs))
