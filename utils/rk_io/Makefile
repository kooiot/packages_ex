#
# Copyright (C) 2012 Jo-Philipp Wich <jo@mein.io>
#
# This is free software, licensed under the Apache 2 license.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=rk_io
PKG_RELEASE:=1
PKG_LICENSE:=MIT

include $(INCLUDE_DIR)/package.mk


define Package/rk_io
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Rockchip io utility program
  MAINTAINER:=Dirk Chang<dirk@kooiot.com>
endef

define Package/rk_io/description
  Rockchip utility program io for reading/writing registers
endef


define Build/Configure
endef

define Build/Compile
	$(TARGET_CC) $(TARGET_CFLAGS) \
		-o $(PKG_BUILD_DIR)/rk_io $(PKG_BUILD_DIR)/rk_io.c
endef


define Package/rk_io/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/rk_io $(1)/usr/sbin/rk_io
endef

$(eval $(call BuildPackage,rk_io))
