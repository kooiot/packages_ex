#
# Copyright (C) 2018 KooIoT.com
#
# This is free software, licensed under MIT
# See /LICENSE for more information.
# 

include $(TOPDIR)/rules.mk

PKG_NAME:=skynet
PKG_VERSION:=1813
PKG_RELEASE:=1

PKG_ARCH=$(ARCH_PACKAGES)
PKG_SOURCE:=$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://localhost/download/openwrt/$(PKG_ARCH)_$(PKG_NAME)
PKG_MAINTAINER:=Dirk Chang <dirk@kooiot.com>

ifeq ($(PKG_ARCH),arm_cortex-a9_neon)
PKG_MD5SUM:=34777c4ef5b558576eedd43c6fa3d7cb
endif
ifeq ($(PKG_ARCH),x86_64)
PKG_MD5SUM=52905ca4b38a002d07f78b27baff6869
endif
ifeq ($(PKG_ARCH),aarch64_cortex-a53)
PKG_MD5SUM=b691588a2ad5edc974710f8948e32dba
endif
ifeq ($(PKG_ARCH),mips_24kc)
PKG_MD5SUM=19016ce3fed7452113324ba270774de2
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
