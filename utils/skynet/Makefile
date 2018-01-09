#
# Copyright (C) 2018 KooIoT.com
#
# This is free software, licensed under MIT
# See /LICENSE for more information.
# 

include $(TOPDIR)/rules.mk

PKG_NAME:=skynet
PKG_VERSION:=1666
PKG_RELEASE:=1

PKG_SOURCE:=$(CONFIG_TARGET_ARCH_PACKAGES)_$(PKG_NAME)/$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://localhost/download/lede
PKG_MAINTAINER:=Dirk Chang <dirk@kooiot.com>

include $(INCLUDE_DIR)/package.mk

define Package/skynet
  SUBMENU:=KooIoT
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Skynet
  URL:=https://github.com/srdgame/skynet
  DEPENDS:=+lua +unzip +luci
endef

define Package/skynet/description
	Skynet IOT is open souce platform for internet of things running on embedded machine
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/skynet/install
	$(INSTALL_DIR) $(1)/skynet
	$(CP) $(PKG_BUILD_DIR)/* $(1)/skynet/
endef

$(eval $(call BuildPackage,skynet))
