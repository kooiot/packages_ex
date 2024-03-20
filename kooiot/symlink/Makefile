#
# Copyright (C) 2018-2021 KooIoT.com
#
# This is free software, licensed under MIT
# See /LICENSE for more information.
# 

include $(TOPDIR)/rules.mk

PKG_NAME:=symlink
PKG_VERSION:=20230612
PKG_RELEASE:=2

PKG_ARCH=$(ARCH_PACKAGES)
PKG_MAINTAINER:=Dirk Chang <dirk@kooiot.com>

include $(INCLUDE_DIR)/package.mk

PKG_SOURCE:=$(PKG_NAME)-$(PKG_ARCH)-$(PKG_VERSION).zip
VERSION_NUMBER:=19.07

ifeq ($(PKG_ARCH),arm_cortex-a9_neon)
SYMLINK_MD5SUM:=
VERSION_NUMBER=17.01
endif
ifeq ($(PKG_ARCH),arm_cortex-a7_neon-vfpv4)
SYMLINK_MD5SUM=beb2aff0e2ae012f69a47cdbf866aa2a
VERSION_NUMBER=19.07
endif
ifeq ($(PKG_ARCH),aarch64_generic)
SYMLINK_MD5SUM=5ceb0b848ffe94071a83eed80031090b
VERSION_NUMBER=22.03
endif

RSTRIP:=:
STRIP:=:

SYMLINK_URL:=http://openwrt.kooiot.com/download/bin/openwrt/$(VERSION_NUMBER)

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
  PROVIDES:=symlink-app
  DEPENDS:=+libstdcpp +luci +libopenssl \
		+@OPENSSL_WITH_NPN \
		+@OPENSSL_WITH_SM234 +@OPENSSL_ENGINE_BUILTIN \
		+libcurl +zip +unzip +zlib +symlink-psn \
		+tlink-utility
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
	$(INSTALL_DIR) $(1)/mnt/sympad_pkg
	$(CP) -rf $(PKG_BUILD_DIR)/src/sympad/* $(1)/mnt/sympad_pkg
	chmod a+x $(1)/mnt/sympad_pkg/LDog.ex
	chmod a+x $(1)/mnt/sympad_pkg/SXDaemon.exa
	chmod a+x $(1)/mnt/sympad_pkg/SLKernal.exa

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
