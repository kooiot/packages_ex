#
# Copyright (C) 2018-2021 KooIoT.com
#
# This is free software, licensed under MIT
# See /LICENSE for more information.
# 

include $(TOPDIR)/rules.mk

PKG_NAME:=sdlnrj-xfrm-client
PKG_VERSION:=20231103165507
PKG_RELEASE:=7

PKG_ARCH=$(ARCH_PACKAGES)
PKG_MAINTAINER:=Dirk Chang <dirk@kooiot.com>

include $(INCLUDE_DIR)/package.mk

PKG_SOURCE:=$(PKG_NAME)-$(PKG_ARCH)-$(PKG_VERSION).tgz
VERSION_NUMBER:=21.02

ifeq ($(PKG_ARCH),arm_cortex-a7_neon-vfpv4)
CLIENT_MD5SUM=681f1ee47c8cba41ac57ddcc7664c0fe
VERSION_NUMBER=21.02
endif
ifeq ($(PKG_ARCH),aarch64_generic)
endif

RSTRIP:=:
STRIP:=:

CLIENT_URL:=http://openwrt.kooiot.com/download/bin/openwrt/$(VERSION_NUMBER)

define Download/sdlnrj-xfrm-client
	FILE:=$(PKG_SOURCE)
	URL:=$(CLIENT_URL)/$(PKG_ARCH)/$(PKG_NAME)/
	URL_FILE:=linuxclient$(PKG_VERSION).tgz
	HASH:=$(CLIENT_MD5SUM)
endef
$(eval $(call Download,sdlnrj-xfrm-client))

define Package/sdlnrj-xfrm-client
  SECTION:=kooiot
  CATEGORY:=KooIoT
  TITLE:=SDLN-XFRM-CLIENT
  URL:=http://www.kooiot.com
  DEPENDS:=+libstdcpp +luci +libopenssl \
		+libcurl +zlib 
endef

define Package/sdlnrj-xfrm-client/description
	ShanDong LuNeng Xfrm Client
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)/src
	tar -xzvf $(DL_DIR)/$(PKG_SOURCE) -C $(PKG_BUILD_DIR)/src
endef

define Build/Configure
endef

define Build/Compile
endef


define Package/sdlnrj-xfrm-client/install
	$(INSTALL_DIR) $(1)/
	$(CP) -rf $(PKG_BUILD_DIR)/src/* $(1)/

	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/sdlnrj-xfrm-client.init $(1)/etc/init.d/sdlnrj-xfrm-client

	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./files/sdlnrj-xfrm-client.uci_defaults $(1)/etc/uci-defaults/99_sdlnrj-xfrm-client
endef

define Package/sdlnrj-xfrm-client/postinst
	#!/bin/sh
	[ -n "$${IPKG_INSTROOT}" ] && exit 0	# if run within buildroot exit

	# Start service
	/etc/init.d/sdlnrj-xfrm-client enable && /etc/init.d/sdlnrj-xfrm-client start >/dev/null 2>&1

	exit 0
endef

define Package/sdlnrj-xfrm-client/prerm
	#!/bin/sh
	[ -n "$${IPKG_INSTROOT}" ] && exit 0	# if run within buildroot exit

	/etc/init.d/sdlnrj-xfrm-client stop
	/etc/init.d/sdlnrj-xfrm-client disable

	exit 0
endef

$(eval $(call BuildPackage,sdlnrj-xfrm-client))
