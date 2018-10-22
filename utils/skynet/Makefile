#
# Copyright (C) 2018 KooIoT.com
#
# This is free software, licensed under MIT
# See /LICENSE for more information.
# 

include $(TOPDIR)/rules.mk

PKG_NAME:=skynet
PKG_VERSION:=1804
PKG_RELEASE:=1

PKG_ARCH=$(ARCH_PACKAGES)
PKG_SOURCE:=$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://localhost/download/openwrt/$(PKG_ARCH)_$(PKG_NAME)
PKG_MAINTAINER:=Dirk Chang <dirk@kooiot.com>

ifeq ($(PKG_ARCH),arm_cortex-a9_neon)
PKG_MD5SUM:=b45799cd17a940804c2c2f282fd8f241
endif
ifeq ($(PKG_ARCH),x86_64)
PKG_MD5SUM=89cd625dfaef395deb6bbb257ee38d54
endif
ifeq ($(PKG_ARCH),aarch64_cortex-a53)
PKG_MD5SUM=46302653c75130232b3634d6d121faa8
endif
ifeq ($(PKG_ARCH),mips_24kc)
PKG_MD5SUM=de9d2022b1262d97e3ac91246090000c
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
	Skynet is light online game server platform. This is adjusted for FreeIOE Platform.
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

	$(INSTALL_DIR) $(1)/usr/ioe/ipt
	$(CP) $(DL_DIR)/$(PKG_SOURCE) $(1)/usr/ioe/ipt/skynet.tar.gz
endef

$(eval $(call BuildPackage,skynet))
