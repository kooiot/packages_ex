#
# Copyright (C) 2018-2022 KooIoT.com
#
# This is free software, licensed under MIT
# See /LICENSE for more information.
# 

include $(TOPDIR)/rules.mk

PKG_NAME:=robot-web
PKG_VERSION:=0.2.0
PKG_RELEASE:=3

PKG_ARCH=$(ARCH_PACKAGES)
PKG_MAINTAINER:=Dirk Chang <dirk@kooiot.com>

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/version.mk

PKG_SOURCE:=v$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/kooiot/robot-web/releases/download/v$(PKG_VERSION)/robot-web-v$(PKG_VERSION).tar.gz?
PKG_HASH:=0108ec9524778540e7aa85d1f90e9fa11ba73abdda4b4f4c44d0981dfc0ce1b8

define Package/robot-web
  SECTION:=kooiot
  CATEGORY:=KooIoT
  SUBMENU:=Utilities
  TITLE:=robot-web - for robot server web ui
  URL:=https://github.com/kooiot/robot-web
  DEPENDS:=+robot-server
endef

define Package/robot-web/description
	For showing robot server status and client tasks in web
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)/src
	tar -C $(PKG_BUILD_DIR)/src -xzvf "$(DL_DIR)/$(PKG_SOURCE)"
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/robot-web/install
	$(INSTALL_DIR) $(1)/html/robot
	$(CP) $(PKG_BUILD_DIR)/src/* $(1)/html/robot/
endef

define Package/robot-web/postinst
#!/bin/sh
[ -n "$${IPKG_INSTROOT}" ] && exit 0	# if run within buildroot exit

# Link to /mnt/data/robot
mkdir -p /mnt/data/robot
ln -s /html/robot /mnt/data/robot/static >/dev/null 2>&1

exit 0
endef

$(eval $(call BuildPackage,robot-web))
