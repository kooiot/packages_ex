#
# Copyright (C) 2018 KooIoT.com
#
# This is free software, licensed under MIT
# See /LICENSE for more information.
# 

include $(TOPDIR)/rules.mk

PKG_NAME:=libfwlib32
PKG_VERSION:=20181205
PKG_RELEASE:=1

PKG_ARCH=$(ARCH_PACKAGES)
PKG_SOURCE:=$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://localhost/download/focas_armhf_rootfs/
PKG_MAINTAINER:=Dirk Chang <dirk@kooiot.com>

PKG_MD5SUM:=34777c4ef5b558576eedd43c6fa3d7cb

include $(INCLUDE_DIR)/package.mk

define Package/libfwlib32
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Funac focas library in armhf rootfs
  URL:=https://github.com/srdgame
  DEPENDS:=+coreutils-chroot
endef

define Package/libfwlib32/description
	Funac focas library built with ubuntu 12.02 armhf. It cannot run directly in openwrt arm box, so we have to use chroot with prebuilt bin/so stuff.
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)/src
	tar -C $(PKG_BUILD_DIR)/src -xzvf "$(DL_DIR)/$(PKG_SOURCE)"
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/libfwlib32/install
	$(INSTALL_DIR) $(1)/usr/focas_armhf_rootfs
	$(CP) $(PKG_BUILD_DIR)/src/* $(1)/usr/focas_armhf_rootfs
endef

$(eval $(call BuildPackage,libfwlib32))
