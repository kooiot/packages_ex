# 
# Copyright (C) 2019 KooIoT.com
#
# This is free software, licensed under MIT.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=process-monitor
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL=https://github.com/srdgame/process-monitor
PKG_SOURCE_DATE:=2017-12-27
PKG_SOURCE_VERSION:=8e6767b5b5c3466338ca8a298286254e870fc401

PKG_MAINTAINER:=Dirk Chang <dirk@kooiot.com>
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=

include $(INCLUDE_DIR)/package.mk

define Package/process-monitor
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Process Monitor
  URL:=http://kooiot.com
endef

define Package/process-monitor/description
	Process monitor for FreeIOE Project
endef


define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) PREFIX=/usr CC="$(TARGET_CC)"
endef

define Package/process-monitor/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/process-monitor $(1)/usr/bin
endef

$(eval $(call BuildPackage,process-monitor))
