#
# Copyright (C) 2018-2019 KooIoT.com
#
# This is free software, licensed under MIT
# See /LICENSE for more information.
# 

include $(TOPDIR)/rules.mk

PKG_NAME:=strip_ioe
PKG_VERSION:=20200722
PKG_RELEASE:=1
PKG_LICENSE:=MIT

PKG_ARCH=$(ARCH_PACKAGES)

include $(INCLUDE_DIR)/package.mk

define Package/strip_ioe
  SECTION:=kooiot
  CATEGORY:=KooIoT
  TITLE:=Strip IOE
  DEPENDS:=+skynet +freeioe
  MAINTAINER:=Dirk Chang <dirk@kooiot.com>
endef

define Package/strip_ioe/description
	Strip FreeIOE for devices which flash is limited 
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/strip_ioe/install
	$(CP) ./files/* $(1)

	$(RM) -rf $(1)/usr/ioe/freeioe/*
	$(RM) -rf $(1)/usr/ioe/skynet/*
endef

$(eval $(call BuildPackage,strip_ioe))
