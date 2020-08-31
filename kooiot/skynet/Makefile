#
# Copyright (C) 2018-2019 KooIoT.com
#
# This is free software, licensed under MIT
# See /LICENSE for more information.
# 

include $(TOPDIR)/rules.mk

PKG_NAME:=skynet
PKG_VERSION:=2078
PKG_RELEASE:=1

PKG_ARCH=$(ARCH_PACKAGES)
PKG_MAINTAINER:=Dirk Chang <dirk@kooiot.com>

include $(INCLUDE_DIR)/package.mk

PKG_SOURCE:=$(PKG_NAME)-$(PKG_ARCH)-$(PKG_VERSION).tar.gz
VERSION_NUMBER:=19.07

ifeq ($(PKG_ARCH),arm_cortex-a9_neon)
SKYNET_MD5SUM:=bd8d03b4f65cc9796fe82cdfcf6009b1
VERSION_NUMBER=17.01
endif
ifeq ($(PKG_ARCH),x86_64)
SKYNET_MD5SUM=75711c76b9f3785a54e76967e3ec50ea
VERSION_NUMBER=19.07
endif
ifeq ($(PKG_ARCH),aarch64_cortex-a53)
SKYNET_MD5SUM=bfee5c7dcc1b6a18309c23d0d931afeb
VERSION_NUMBER:=snapshot
endif
ifeq ($(PKG_ARCH),mipsel_24kc)
SKYNET_MD5SUM=c07d426052fe0ef956e700dda5494319
VERSION_NUMBER=snapshot
endif
ifeq ($(PKG_ARCH),mips_24kc)
SKYNET_MD5SUM=
VERSION_NUMBER=18.06
endif
ifeq ($(PKG_ARCH),arm_cortex-a7_neon-vfpv4)
SKYNET_MD5SUM=a6bd0f2b993d9b467e7661fb83eb7c9a
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
