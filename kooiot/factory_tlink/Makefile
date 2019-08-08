#
# Copyright (C) 2018 KooIoT.com
#
# This is free software, licensed under MIT
# See /LICENSE for more information.
# 

include $(TOPDIR)/rules.mk

PKG_NAME:=factory_tlink
PKG_VERSION:=20190808
PKG_RELEASE:=2

include $(INCLUDE_DIR)/package.mk

define Package/factory_tlink
  SECTION:=kooiot
  CATEGORY:=KooIoT
  TITLE:=Factory TLink Devices
  URL:=http://freeioe.org
  DEPENDS:=+freeioe
endef

define Package/factory_tlink/description
	Factory make scripts used by TLink devices
endef

define Build/Compile
endef

define Package/factory_tlink/install
	$(CP) ./files/* $(1)
endef

$(eval $(call BuildPackage,factory_tlink))
