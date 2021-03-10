#
# Copyright (C) 2018-2021 KooIoT.com
#
# This is free software, licensed under MIT
# See /LICENSE for more information.
# 

include $(TOPDIR)/rules.mk

PKG_NAME:=skynet
PKG_VERSION:=2196
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
SKYNET_MD5SUM:=5883329c3f531dc5ecf4f923dddbd1e1
endif
ifeq ($(SKYNET_VER_NUM),19.07)
SKYNET_MD5SUM:=bb8ad62d730a89aa9a5bb6c1ece36657
endif
endif
ifeq ($(PKG_ARCH),x86_64)
ifeq ($(SKYNET_VER_NUM),19.07)
SKYNET_MD5SUM=095b1a3624a160259cad9b54a51c1876
endif
endif
ifeq ($(PKG_ARCH),aarch64_cortex-a53)
ifeq ($(SKYNET_VER_NUM),snapshot)
SKYNET_MD5SUM=2f23b9fb82ea86561a57b9bb02131442
endif
endif
ifeq ($(PKG_ARCH),mipsel_24kc)
ifeq ($(SKYNET_VER_NUM),snapshot)
SKYNET_MD5SUM=52d49208bc6dff4cdb735d7711724589
endif
endif
ifeq ($(PKG_ARCH),mips_24kc)
SKYNET_MD5SUM=
endif
ifeq ($(PKG_ARCH),arm_cortex-a7_neon-vfpv4)
ifeq ($(SKYNET_VER_NUM),19.07)
SKYNET_MD5SUM=8c46ad3864b36bb1f4a58951c167a9bd
endif
ifeq ($(SKYNET_VER_NUM),snapshot)
SKYNET_MD5SUM=7038042f4dc485b3a7a0e73aa20bd89a
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
