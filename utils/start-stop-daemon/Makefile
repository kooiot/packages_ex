# 
# Copyright (C) 2015-2021 KooIoT.com
#
# This is free software, licensed under MIT.
# See /LICENSE for more information.
#
# This Makefile is a skeleton
#

include $(TOPDIR)/rules.mk

PKG_NAME:=start-stop-daemon
PKG_VERSION:=1.17.9
PKG_RELEASE:=1
PKG_MAINTAINER:=Dirk Chang <dirk@kooiot.com>
PKG_LICENSE:=GPL-2.0
PKG_LICENSE_FILES:=COPYING

PKG_SOURCE:=dpkg_$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=http://mirrors.aliyun.com/debian/pool/main/d/dpkg/
PKG_MD5SUM:=088e60aca2b2e14dcf4450a0d1cb2ef0

PKG_BUILD_DIR:=$(BUILD_DIR)/dpkg-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/start-stop-daemon
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Start-Stop-Daemon
  URL:=http://debian.org
endef

define Package/start-stop-daemon/description
  Full version start-stop-daemon from dpkg
endef


# add make variable overrides here
MAKE_FLAGS +=

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)/lib/compat	
	$(MAKE) -C $(PKG_BUILD_DIR)/utils \
		start-stop-daemon
endef

define Package/start-stop-daemon/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/utils/start-stop-daemon $(1)/usr/sbin
endef

$(eval $(call BuildPackage,start-stop-daemon))
