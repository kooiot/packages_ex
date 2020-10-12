#
# Copyright (C) 2019 KooIoT.com
#
# This is free software, licensed under MIT
# See /LICENSE for more information.
# 

include $(TOPDIR)/rules.mk

PKG_NAME:=focas_ubus
PKG_VERSION:=20181205
PKG_RELEASE:=2

PKG_ARCH=$(ARCH_PACKAGES)
PKG_MAINTAINER:=Dirk Chang <dirk@kooiot.com>

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/version.mk

DL_FILE_VER:=snapshot
ifeq ($(VERSION_NUMBER),SNAPSHOT)
DL_FILE_VER=snapshot
else
DL_FILE_VER=$(subst -SNAPSHOT,,$(VERSION_NUMBER))
endif

PKG_SOURCE:=$(PKG_NAME)-$(PKG_ARCH)-$(PKG_VERSION).tar.gz
FOCAS_MD5SUM:=3e1c3173dc0fdc824eb643f2c6b572d0

RSTRIP:=:
STRIP:=:
CheckDependencies:=:

DL_FILE_URL:=http://openwrt.kooiot.com/download/bin/openwrt/$(DL_FILE_VER)

define Download/focas_ubus
	FILE:=$(PKG_SOURCE)
	URL:=$(DL_FILE_URL)/$(PKG_ARCH)/$(PKG_NAME)/
	URL_FILE:=$(PKG_VERSION).tar.gz
	HASH:=$(FOCAS_MD5SUM)
endef
$(eval $(call Download,focas_ubus))

define Package/focas_ubus
  SECTION:=kooiot
  CATEGORY:=KooIoT
  TITLE:=Fanuc Focas
  URL:=http://www.kooiot.com
  DEPENDS:=+freeioe +@KERNEL_DEVTMPFS @(arm||x86_64)
endef

define Package/focas_ubus/description
	Fanuc Focas bridge service build on ubus
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)/src
	tar -C $(PKG_BUILD_DIR)/src -xzvf "$(DL_DIR)/$(PKG_SOURCE)"
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/focas_ubus/install
	$(INSTALL_DIR) $(1)/usr/focas_armhf_rootfs
	$(INSTALL_DIR) $(1)/usr/focas_armhf_rootfs/sysroot
	$(CP) -rf $(PKG_BUILD_DIR)/src/* $(1)/usr/focas_armhf_rootfs/sysroot

	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/focas_ubus.init $(1)/etc/init.d/focas_ubus
	$(INSTALL_BIN) ./files/focas_ubus $(1)/usr/focas_armhf_rootfs/sysroot/bin
	$(INSTALL_BIN) ./files/arch-chroot $(1)/usr/focas_armhf_rootfs/sysroot/bin
endef

define Package/focas_ubus/postinst
	#!/bin/sh
	[ -n "$${IPKG_INSTROOT}" ] && exit 0	# if run within buildroot exit

	# Start service
	/etc/init.d/focas_ubus enable && /etc/init.d/focas_ubus start >/dev/null 2>&1

	exit 0
endef

define Package/focas_ubus/prerm
	#!/bin/sh
	[ -n "$${IPKG_INSTROOT}" ] && exit 0	# if run within buildroot exit

	/etc/init.d/focas_ubus stop
	/etc/init.d/focas_ubus disable

	exit 0
endef

$(eval $(call BuildPackage,focas_ubus))
