#
# Copyright (C) 2020 Dirk Chang
#
#

include $(TOPDIR)/rules.mk

PKG_NAME:=kooiot_bmr200
PKG_VERSION:=0.1
PKG_RELEASE:=1
PKG_LICNESE:=MIT

include $(INCLUDE_DIR)/package.mk

define Package/kooiot_bmr200
  SECTION:=net
  CATEGORY:=Network
  TITLE:=BMR200 device support files
  DEPENDS:=+freeioe
  MAINTAINER:=Dirk Chang <dirk@kooiot.com>
endef

define Package/kooiot_bmr200/description
  Be ready for running FreeIOE
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/kooiot_bmr200/install
	$(CP) ./files/* $(1)
endef

$(eval $(call BuildPackage,kooiot_bmr200))
