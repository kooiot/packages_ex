#
# Copyright (C) 2018 KooIoT.com
#
# This is free software, licensed under MIT
# See /LICENSE for more information.
# 

include $(TOPDIR)/rules.mk

PKG_NAME:=freeioe
PKG_VERSION:=886
PKG_RELEASE:=1

PKG_ARCH=$(ARCH_PACKAGES)
PKG_SOURCE:=$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://localhost/download/freeioe
PKG_MAINTAINER:=Dirk Chang <dirk@kooiot.com>
PKG_MD5SUM:=299adfd44627165d203e7a9035256f6e

include $(INCLUDE_DIR)/package.mk

define Package/freeioe
  SUBMENU:=KooIoT
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=FreeIOE
  URL:=https://github.com/freeioe/freeioe
  DEPENDS:=+skynet
endef

define Package/freeioe/description
	FreeIOE is platform for internet of everythings running on embedded machine, built on top of Skynet.
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)/src
	tar -C $(PKG_BUILD_DIR)/src -xzvf "$(DL_DIR)/$(PKG_SOURCE)"
	rm -rf $(PKG_BUILD_DIR)/src/linux

	mkdir -p $(PKG_BUILD_DIR)/src/__plat_files/$(PKG_ARCH)
	cp -R $(PKG_BUILD_DIR)/src/openwrt/$(PKG_ARCH)/* $(PKG_BUILD_DIR)/src/__plat_files/$(PKG_ARCH)/
	cp -R $(PKG_BUILD_DIR)/src/openwrt/init.d $(PKG_BUILD_DIR)/src/__plat_files/init.d
	rm -rf $(PKG_BUILD_DIR)/src/openwrt
	mv $(PKG_BUILD_DIR)/src/__plat_files $(PKG_BUILD_DIR)/src/openwrt
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/freeioe/install
	$(INSTALL_DIR) $(1)/usr/ioe/freeioe
	$(CP) $(PKG_BUILD_DIR)/src/* $(1)/usr/ioe/freeioe/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(LN) ../../usr/ioe/freeioe/openwrt/init.d/skynet $(1)/etc/init.d/skynet

	$(INSTALL_DIR) $(1)/usr/ioe/ipt
	$(CP) $(DL_DIR)/$(PKG_SOURCE) $(1)/usr/ioe/ipt/freeioe.tar.gz

ifeq ($(ARCH),x86_64)
	$(INSTALL_DIR) $(1)/etc/profile.d
	$(CP) ./files/echo_sn.sh $(1)/etc/profile.d/echo_sn.sh
endif
endef

$(eval $(call BuildPackage,freeioe))
