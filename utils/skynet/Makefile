#
# Copyright (C) 2018 KooIoT.com
#
# This is free software, licensed under MIT
# See /LICENSE for more information.
# 

include $(TOPDIR)/rules.mk

PKG_NAME:=skynet
PKG_VERSION:=1827
PKG_RELEASE:=1

PKG_ARCH=$(ARCH_PACKAGES)
PKG_MAINTAINER:=Dirk Chang <dirk@kooiot.com>

include $(INCLUDE_DIR)/package.mk

SKYNET_URL:=http://localhost/download/openwrt/

ifeq ($(PKG_ARCH),arm_cortex-a9_neon)
SKYNET_MD5SUM:=1f67d61f290deb53cb977ae2c251254d
endif
ifeq ($(PKG_ARCH),x86_64)
SKYNET_MD5SUM=1a80516d5b002e2eaf819d363950b3ee
endif
ifeq ($(PKG_ARCH),aarch64_cortex-a53)
SKYNET_MD5SUM=54f34f24ced7fdcd493f548a40a2a6e0
endif
ifeq ($(PKG_ARCH),mips_24kc)
SKYNET_MD5SUM=1dcd5e3a1626202e75a0ac90633d1e31
endif

define Download/skynet
	FILE:=$(PKG_VERSION)-$(PKG_ARCH).tar.gz
	URL:=$(SKYNET_URL)
	URL_FILE:=$(PKG_ARCH)_$(PKG_NAME).tar.gz
	HASH:=$(SKYNET_MD5SUM)
endef

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
