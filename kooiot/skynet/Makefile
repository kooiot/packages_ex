#
# Copyright (C) 2018-2019 KooIoT.com
#
# This is free software, licensed under MIT
# See /LICENSE for more information.
# 

include $(TOPDIR)/rules.mk

PKG_NAME:=skynet
PKG_VERSION:=2065
PKG_RELEASE:=1

PKG_ARCH=$(ARCH_PACKAGES)
PKG_MAINTAINER:=Dirk Chang <dirk@kooiot.com>

include $(INCLUDE_DIR)/package.mk

PKG_SOURCE:=$(PKG_NAME)-$(PKG_ARCH)-$(PKG_VERSION).tar.gz
VERSION_NUMBER:=19.07

ifeq ($(PKG_ARCH),arm_cortex-a9_neon)
SKYNET_MD5SUM:=9462ad51f597cfffccf62d01bc581a0c
VERSION_NUMBER=17.01
endif
ifeq ($(PKG_ARCH),x86_64)
SKYNET_MD5SUM=ff3242db3a79c864edb7a858be054fc8
VERSION_NUMBER=19.07
endif
ifeq ($(PKG_ARCH),aarch64_cortex-a53)
SKYNET_MD5SUM=c2b5022e01e5f36ac45f929bf5828d07
VERSION_NUMBER:=snapshot
endif
ifeq ($(PKG_ARCH),mipsel_24kc)
SKYNET_MD5SUM=c364f87c15ce1409ade3bb0a6f836c20
VERSION_NUMBER=snapshot
endif
ifeq ($(PKG_ARCH),mips_24kc)
SKYNET_MD5SUM=058d531d612625159f9aad8a7ec0e611
VERSION_NUMBER=18.06
endif
ifeq ($(PKG_ARCH),arm_cortex-a7_neon-vfpv4)
SKYNET_MD5SUM=b8801ef59407a5262c477f2afeb35a25
VERSION_NUMBER=19.07
endif

SKYNET_URL:=http://localhost/download/bin/openwrt/$(VERSION_NUMBER)

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
  DEPENDS:=+lua +zip +unzip +luci +libopenssl +libcurl +zlib +libstdcpp
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
