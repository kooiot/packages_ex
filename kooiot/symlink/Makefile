#
# Copyright (C) 2018 KooIoT.com
#
# This is free software, licensed under MIT
# See /LICENSE for more information.
# 

include $(TOPDIR)/rules.mk

PKG_NAME:=symlink
PKG_VERSION:=20190831
PKG_RELEASE:=1

PKG_ARCH=$(ARCH_PACKAGES)
PKG_MAINTAINER:=Dirk Chang <dirk@kooiot.com>

include $(INCLUDE_DIR)/package.mk

PKG_SOURCE:=$(PKG_NAME)-$(PKG_ARCH)-$(PKG_VERSION).tar.gz
VERSION_NUMBER:=19.07

ifeq ($(PKG_ARCH),arm_cortex-a9_neon)
SYMLINK_MD5SUM:=3720ee5e9f1b5bfd70cf0467148bb90a
VERSION_NUMBER=17.01
endif
ifeq ($(PKG_ARCH),arm_cortex-a7_neon-vfpv4)
SYMLINK_MD5SUM=3720ee5e9f1b5bfd70cf0467148bb90a
VERSION_NUMBER=19.07
endif

RSTRIP:=:
STRIP:=:

SYMLINK_URL:=http://localhost/download/bin/openwrt/$(VERSION_NUMBER)

define Download/symlink
	FILE:=$(PKG_SOURCE)
	URL:=$(SYMLINK_URL)/$(PKG_ARCH)/$(PKG_NAME)/
	URL_FILE:=$(PKG_VERSION).zip
	HASH:=$(SYMLINK_MD5SUM)
endef
$(eval $(call Download,symlink))

define Package/symlink
  SECTION:=kooiot
  CATEGORY:=KooIoT
  TITLE:=SymLink
  URL:=http://www.symid.com
  DEPENDS:=+libstdcpp +luci +libopenssl +libcurl +zip +unzip +zlib
endef

define Package/symlink/description
	SymLink application is an IOT gateway solution
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)/src
	unzip -d $(PKG_BUILD_DIR)/src $(DL_DIR)/$(PKG_SOURCE)
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/symlink/install
	$(INSTALL_DIR) $(1)/mnt/sympad
	$(CP) -rf $(PKG_BUILD_DIR)/src/sympad/* $(1)/mnt/sympad
	chmod a+x $(1)/mnt/sympad/LDog.ex
	chmod a+x $(1)/mnt/sympad/SXDaemon.exa
	chmod a+x $(1)/mnt/sympad/SLKernal.exa

	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/symlink.init $(1)/etc/init.d/symlink
endef

define Package/symlink/postinst
	#!/bin/sh
	[ -n "$${IPKG_INSTROOT}" ] && exit 0	# if run within buildroot exit

	# Start service
	/etc/init.d/symlink enable && /etc/init.d/symlink start >/dev/null 2>&1

	exit 0
endef

define Package/symlink/prerm
	#!/bin/sh
	[ -n "$${IPKG_INSTROOT}" ] && exit 0	# if run within buildroot exit

	/etc/init.d/symlink stop
	/etc/init.d/symlink disable

	exit 0
endef

$(eval $(call BuildPackage,symlink))
