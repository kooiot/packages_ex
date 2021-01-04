#
# Copyright (C) 2018-2021 KooIoT.com
#
# This is free software, licensed under MIT
# See /LICENSE for more information.
# 

include $(TOPDIR)/rules.mk

PKG_NAME:=skynet
PKG_VERSION:=2149
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

ifeq ($(PKG_ARCH),arm_cortex-a9_neon)
ifeq ($(SKYNET_VER_NUM),17.01)
SKYNET_MD5SUM:=73097a4d31491c976f5be264b8583a63
endif
ifeq ($(SKYNET_VER_NUM),19.07)
SKYNET_MD5SUM:=e1c951b6e6ad77d16e96b1eca42d5d7f
endif
endif
ifeq ($(PKG_ARCH),x86_64)
ifeq ($(SKYNET_VER_NUM),19.07)
SKYNET_MD5SUM=b0a6645ab0f7877c3466af1e7a41c895
endif
endif
ifeq ($(PKG_ARCH),aarch64_cortex-a53)
ifeq ($(SKYNET_VER_NUM),snapshot)
SKYNET_MD5SUM=f3ae62b4f88036ba203b5f114e7eb396
endif
endif
ifeq ($(PKG_ARCH),mipsel_24kc)
ifeq ($(SKYNET_VER_NUM),snapshot)
SKYNET_MD5SUM=91cfce49df22ba61074be1f50a775e88
endif
endif
ifeq ($(PKG_ARCH),mips_24kc)
SKYNET_MD5SUM=
endif
ifeq ($(PKG_ARCH),arm_cortex-a7_neon-vfpv4)
ifeq ($(SKYNET_VER_NUM),19.07)
SKYNET_MD5SUM=fec075128cc524cdaa7290e45d564225
endif
ifeq ($(SKYNET_VER_NUM),snapshot)
SKYNET_MD5SUM=007dfc1e5bcd924e55e266d47c06d769
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
