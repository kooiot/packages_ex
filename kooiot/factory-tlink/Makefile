#
# Copyright (C) 2018-2021 KooIoT.com
#
# This is free software, licensed under MIT
# See /LICENSE for more information.
# 

include $(TOPDIR)/rules.mk

PKG_NAME:=factory-tlink
PKG_VERSION:=20190808
PKG_RELEASE:=2

include $(INCLUDE_DIR)/package.mk

define Package/factory-tlink
  SECTION:=kooiot
  CATEGORY:=KooIoT
  TITLE:=Factory TLink Devices
  URL:=http://freeioe.org
  DEPENDS:=+freeioe
endef

define Package/factory-tlink/description
	Factory make scripts used by TLink devices
endef

define Build/Compile
endef

define Package/factory-tlink/install
	$(CP) ./files/* $(1)
endef

$(eval $(call BuildPackage,factory-tlink))
