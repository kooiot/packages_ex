#
# Copyright (C) 2018 KooIoT.com
#
# This is free software, licensed under MIT
# See /LICENSE for more information.
# 

include $(TOPDIR)/rules.mk

PKG_NAME:=skynet_iot
PKG_VERSION:=697
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://localhost/download/skynet_iot
PKG_MAINTAINER:=Dirk Chang <dirk@kooiot.com>
PKG_MD5SUM:=44afb04bfdb1ea232070a6f8b2415047

include $(INCLUDE_DIR)/package.mk

define Package/skynet_iot
  SUBMENU:=KooIoT
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Skynet IOT
  URL:=https://github.com/srdgame/skynet_iot
  DEPENDS:=+skynet
endef

define Package/skynet_iot/description
	Skynet IOT is open souce platform for internet of things running on embedded machine
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)/src
	tar -C $(PKG_BUILD_DIR)/src -xzvf "$(DL_DIR)/$(PKG_SOURCE)"
	rm -rf $(PKG_BUILD_DIR)/src/linux
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/skynet_iot/install
	$(INSTALL_DIR) $(1)/usr/iot/skynet_iot
	$(CP) $(PKG_BUILD_DIR)/src/* $(1)/usr/iot/skynet_iot/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) $(1)/usr/iot/skynet_iot/openwrt/init.d/skynet $(1)/etc/init.d/skynet
	rm -f $(1)/etc/init.d/skynet
	$(LN) /usr/iot/skynet_iot/openwrt/init.d/skynet $(1)/etc/init.d/skynet

ifeq ($(ARCH),x86_64)
	$(INSTALL_DIR) $(1)/etc/profile.d
	$(INSTALL_BIN) ./files/echo_sn.sh $(1)/etc/profile.d/echo_sn.sh
endif
endef

$(eval $(call BuildPackage,skynet_iot))
