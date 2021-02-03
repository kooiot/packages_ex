#
# Copyright (C) 2018-2021 KooIoT.com
#
# This is free software, licensed under MIT
# See /LICENSE for more information.
# 

include $(TOPDIR)/rules.mk

PKG_NAME:=strip-ioe
PKG_VERSION:=20200723
PKG_RELEASE:=1
PKG_LICENSE:=MIT

PKG_ARCH=$(ARCH_PACKAGES)

include $(INCLUDE_DIR)/package.mk

define Package/strip-ioe
  SECTION:=kooiot
  CATEGORY:=KooIoT
  TITLE:=Strip IOE
  DEPENDS:=+skynet +freeioe
  MAINTAINER:=Dirk Chang <dirk@kooiot.com>
endef

define Package/strip-ioe/description
	Strip FreeIOE for devices which flash is limited 
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/strip-ioe/install
	$(CP) ./files/* $(1)
endef

define Package/strip-ioe/postinst
#!/bin/sh
if [ -n "$${IPKG_INSTROOT}" ] # if run within buildroot
then
	rm -rf "$${IPKG_INSTROOT}/usr/ioe/freeioe"
	rm -rf "$${IPKG_INSTROOT}/usr/ioe/skynet"
fi
endef

$(eval $(call BuildPackage,strip-ioe))
