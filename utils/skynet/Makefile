#
# Copyright (C) 2018 KooIoT.com
#
# This is free software, licensed under MIT
# See /LICENSE for more information.
# 

include $(TOPDIR)/rules.mk

PKG_NAME:=skynet
PKG_VERSION:=1892
PKG_RELEASE:=1

PKG_ARCH=$(ARCH_PACKAGES)
PKG_MAINTAINER:=Dirk Chang <dirk@kooiot.com>

include $(INCLUDE_DIR)/package.mk

SKYNET_URL:=http://localhost/download/openwrt/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_ARCH)-$(PKG_VERSION).tar.gz

ifeq ($(PKG_ARCH),arm_cortex-a9_neon)
SKYNET_MD5SUM:=d79316346b2483add52652f2330c82da
endif
ifeq ($(PKG_ARCH),x86_64)
SKYNET_MD5SUM=0c74c402a8de91f832e942cffa8ed825
endif
ifeq ($(PKG_ARCH),aarch64_cortex-a53)
SKYNET_MD5SUM=
endif
ifeq ($(PKG_ARCH),mips_24kc)
SKYNET_MD5SUM=d85ccd98891a068be6110b326fb9b7d2
endif
ifeq ($(PKG_ARCH),arm_cortex-a7_neon-vfpv4)
SKYNET_MD5SUM=d145545ab44972b9599a7f236612cb53
endif

define Download/skynet
	FILE:=$(PKG_SOURCE)
	URL:=$(SKYNET_URL)/$(PKG_ARCH)_$(PKG_NAME)/
	URL_FILE:=$(PKG_VERSION).tar.gz
	HASH:=$(SKYNET_MD5SUM)
endef
$(eval $(call Download,skynet))

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
