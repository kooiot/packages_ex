#
# Copyright (C) 2018-2021 KooIoT.com
#
# This is free software, licensed under MIT
# See /LICENSE for more information.
# 

include $(TOPDIR)/rules.mk

PKG_NAME:=skynet
PKG_VERSION:=2272
PKG_RELEASE:=1

PKG_ARCH=$(ARCH_PACKAGES)
PKG_MAINTAINER:=Dirk Chang <dirk@kooiot.com>

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/version.mk

SKYNET_VER_NUM:=snapshot
ifeq ($(VERSION_NUMBER),SNAPSHOT)
SKYNET_VER_NUM=snapshot
else
SKYNET_VER_NUM=$(subst -SNAPSHOT,,$(VERSION_NUMBER))
endif

# ifeq ($(VERSION_NUMBER),19.07.7)
### Fixed the version number for 19.07.7
# SKYNET_VER_NUM=19.07
# endif

ifeq ($(PKG_ARCH),arm_cortex-a9_neon)
ifeq ($(SKYNET_VER_NUM),17.01)
SKYNET_MD5SUM:=ad258a712ff4560d2fe1e2af79cfc510
endif
ifeq ($(SKYNET_VER_NUM),19.07)
SKYNET_MD5SUM:=6bedfc19a97c79022df23a129a6714de
endif
endif

ifeq ($(PKG_ARCH),x86_64)
ifeq ($(SKYNET_VER_NUM),19.07)
SKYNET_MD5SUM=b1aadece61f272c7246d487826074358
endif
endif

ifeq ($(PKG_ARCH),aarch64_cortex-a53)
ifeq ($(SKYNET_VER_NUM),snapshot)
SKYNET_MD5SUM=1d6c268add03676ff36a9ff8d27bc638
endif
endif

ifeq ($(PKG_ARCH),mipsel_24kc)
ifeq ($(SKYNET_VER_NUM),snapshot)
SKYNET_MD5SUM=5d9afad4f511edb0c053d0a0978d4495
endif
endif

ifeq ($(PKG_ARCH),arm_cortex-a7_neon-vfpv4)
ifeq ($(SKYNET_VER_NUM),19.07)
SKYNET_MD5SUM=a5b542ff0f6df5ef98bba40d368bd29d
endif
ifeq ($(SKYNET_VER_NUM),21.02)
SKYNET_MD5SUM=efb740e9c97d05656f2e44323ea7d754
endif
ifeq ($(SKYNET_VER_NUM),snapshot)
SKYNET_MD5SUM=efb740e9c97d05656f2e44323ea7d754
endif
endif

PKG_SOURCE:=$(PKG_NAME)-$(PKG_ARCH)-$(SKYNET_VER_NUM)-$(PKG_VERSION).tar.gz

SKYNET_URL:=http://openwrt.kooiot.com/download/bin/openwrt/$(SKYNET_VER_NUM)

define Download/skynet
	FILE:=$(PKG_SOURCE)
	URL:=$(SKYNET_URL)/$(PKG_ARCH)/$(PKG_NAME)/
	URL_FILE:=$(PKG_VERSION).tar.gz
	HASH:=$(SKYNET_MD5SUM)
endef
$(eval $(call Download,skynet))

define Package/skynet
  SECTION:=kooiot
  CATEGORY:=KooIoT
  TITLE:=Skynet
  URL:=https://github.com/srdgame/skynet
  DEPENDS:=+lua +zip +unzip +luci +libopenssl +@OPENSSL_WITH_SM234 +@OPENSSL_ENGINE_BUILTIN +libcurl +zlib +libstdcpp
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
