#
# Copyright (C) 2018 KooIoT.com
#
# This is free software, licensed under MIT
# See /LICENSE for more information.
# 

include $(TOPDIR)/rules.mk

PKG_NAME:=skynet_iot
PKG_VERSION:=583
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://localhost/download/skynet_iot
PKG_MAINTAINER:=Dirk Chang <dirk@kooiot.com>
PKG_MD5SUM:=d891336b7697c35e5e3c76eb9faa3626

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
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/skynet_iot/install
	$(INSTALL_DIR) $(1)/skynet_iot
	$(CP) $(PKG_BUILD_DIR)/src/* $(1)/skynet_iot/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(LN) lede/init.d/skynet $(1)/etc/init.d/skynet
endef

$(eval $(call BuildPackage,skynet_iot))
