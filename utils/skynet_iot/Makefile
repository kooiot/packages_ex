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

PKG_SOURCE:=$(PKG_NAME)/$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://localhost/download
PKG_MAINTAINER:=Dirk Chang <dirk@kooiot.com>

include $(INCLUDE_DIR)/package.mk

define Package/skynet_iot
  SUBMENU:=KooIoT
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Skynet IOT
  URL:=https://github.com/srdgame/skynet_iot
  DEPENDS:=+lua +unzip +luci +skynet
endef

define Package/skynet_iot/description
	Skynet IOT is open souce platform for internet of things running on embedded machine
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/skynet_iot/install
	$(INSTALL_DIR) $(1)/skynet_iot
	$(CP) $(PKG_BUILD_DIR)/* $(1)/skynet_iot/
	$(LN) lede/init.d/skynet $(1)/etc/init.d/skynet
endef

$(eval $(call BuildPackage,skynet_iot))
