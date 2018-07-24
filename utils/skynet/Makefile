#
# Copyright (C) 2018 KooIoT.com
#
# This is free software, licensed under MIT
# See /LICENSE for more information.
# 

include $(TOPDIR)/rules.mk

PKG_NAME:=skynet
PKG_VERSION:=1748
PKG_RELEASE:=1

PKG_ARCH=$(ARCH_PACKAGES)
PKG_SOURCE:=$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://localhost/download/openwrt/$(PKG_ARCH)_$(PKG_NAME)
PKG_MAINTAINER:=Dirk Chang <dirk@kooiot.com>
PKG_MD5SUM:=068bc9ae6b2971a5554004d978bded1d

ifeq ($(ARCH),x86_64)
PKG_MD5SUM=afac5ab9d4352d0a18d073fe3e5bd1c1
endif

include $(INCLUDE_DIR)/package.mk

define Package/skynet
  SUBMENU:=KooIoT
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Skynet
  URL:=https://github.com/srdgame/skynet
  DEPENDS:=+lua +zip +unzip +luci +libopenssl +libcurl +zlib
endef

define Package/skynet/description
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

define Package/skynet/install
	$(INSTALL_DIR) $(1)/usr/ioe/skynet
	$(CP) $(PKG_BUILD_DIR)/src/* $(1)/usr/ioe/skynet/
endef

$(eval $(call BuildPackage,skynet))
