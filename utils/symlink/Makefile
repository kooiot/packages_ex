#
# Copyright (C) 2018 KooIoT.com
#
# This is free software, licensed under MIT
# See /LICENSE for more information.
# 

include $(TOPDIR)/rules.mk

PKG_NAME:=symlink
PKG_VERSION:=20180322
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://localhost/download/$(PKG_NAME)
PKG_MAINTAINER:=Dirk Chang <dirk@kooiot.com>
PKG_MD5SUM:=c0cbc1334f238432e958ea1d00b2d47d

include $(INCLUDE_DIR)/package.mk

define Package/symlink
  SUBMENU:=SymLink
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=SymLink
  URL:=http://www.symid.com
  DEPENDS:=+libstdcpp +luci +libopenssl +libcurl
endef

define Package/symlink/description
	SymLink application based on IOT Q1020
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)/src
	tar -C $(PKG_BUILD_DIR)/src -xzvf "$(DL_DIR)/$(PKG_SOURCE)"
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/symlink/install
	$(INSTALL_DIR) $(1)/
	$(CP) -rf $(PKG_BUILD_DIR)/src/* $(1)/
endef

$(eval $(call BuildPackage,symlink))
