#
# Copyright (C) 2022 KooIoT.com
#
# This is free software, licensed under MIT
# See /LICENSE for more information.
# 

include $(TOPDIR)/rules.mk

PKG_NAME:=tlink-utility
PKG_VERSION:=2022-04-02
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/tlink-utility
  SECTION:=kooiot
  CATEGORY:=KooIoT
  TITLE:=Factory TLink Devices
  URL:=http://kooiot.com
endef

define Package/tlink-utility/description
	ThingsLink utility tools
endef

define Build/Compile
endef

define Package/tlink-utility/install
	$(CP) ./files/* $(1)
endef

$(eval $(call BuildPackage,tlink-utility))
