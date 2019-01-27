#
# Copyright (C) 2018 KooIoT.com
#
# This is free software, licensed under MIT
# See /LICENSE for more information.
# 

include $(TOPDIR)/rules.mk

PKG_NAME:=freeioe
PKG_VERSION:=1079
PKG_RELEASE:=1

PKG_ARCH=$(ARCH_PACKAGES)
PKG_SOURCE:=$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://localhost/download/freeioe
PKG_MAINTAINER:=Dirk Chang <dirk@kooiot.com>
PKG_MD5SUM:=77f2dcc9a5e2259ee6a8b00c80636497

include $(INCLUDE_DIR)/package.mk

define Package/freeioe
  SUBMENU:=KooIoT
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=FreeIOE
  URL:=https://github.com/freeioe/freeioe
  DEPENDS:=+skynet +process-monitor
endef

define Package/freeioe/description
	FreeIOE is platform for internet of everythings running on embedded machine, built on top of Skynet.
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)/src
	tar -C $(PKG_BUILD_DIR)/src -xzvf "$(DL_DIR)/$(PKG_SOURCE)"
	rm -rf $(PKG_BUILD_DIR)/src/linux
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/freeioe/install
	$(INSTALL_DIR) $(1)/usr/ioe/freeioe
	$(CP) $(PKG_BUILD_DIR)/src/* $(1)/usr/ioe/freeioe/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(LN) ../../usr/ioe/freeioe/openwrt/init.d/skynet $(1)/etc/init.d/skynet

	$(INSTALL_DIR) $(1)/usr/ioe/ipt
	$(CP) $(DL_DIR)/$(PKG_SOURCE) $(1)/usr/ioe/ipt/freeioe.tar.gz

ifeq ($(ARCH),x86_64)
	$(INSTALL_DIR) $(1)/etc/profile.d
	$(CP) ./files/echo_sn.sh $(1)/etc/profile.d/echo_sn.sh
endif
endef

define Package/freeioe/preinst
	#!/bin/sh
	[ -n "$${IPKG_INSTROOT}" ] && exit 0	# if run within buildroot exit

	# stop service if PKG_UPGRADE
	[ "$${PKG_UPGRADE}" = "1" ] && /etc/init.d/skynet stop >/dev/null 2>&1
		
	exit 0	# suppress errors from stop command
endef

define Package/freeioe/postinst
	#!/bin/sh
	[ -n "$${IPKG_INSTROOT}" ] && exit 0	# if run within buildroot exit

	# Start service 
	/etc/init.d/skynet enable && /etc/init.d/skynet start >/dev/null 2>&1

	exit 0 
endef

define Package/freeioe/prerm
	#!/bin/sh
	[ -n "$${IPKG_INSTROOT}" ] && exit 0	# if run within buildroot exit

	/etc/init.d/skynet stop
	/etc/init.d/skynet disable

	exit 0
endef

$(eval $(call BuildPackage,freeioe))
