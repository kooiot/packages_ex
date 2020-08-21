#
# Copyright (C) 2020 Dirk Chang
#
#

include $(TOPDIR)/rules.mk

PKG_NAME:=bmr200_freeioe
PKG_VERSION:=0.2
PKG_RELEASE:=1
PKG_LICNESE:=MIT

include $(INCLUDE_DIR)/package.mk

define Package/bmr200_freeioe
  SECTION:=kooiot
  CATEGORY:=KooIoT
  TITLE:=BMR200 FreeIOE Installer
  DEPENDS:=+freeioe
  MAINTAINER:=Dirk Chang <dirk@kooiot.com>
endef

define Package/bmr200_freeioe/description
  Be ready for running FreeIOE
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/bmr200_freeioe/install
	$(CP) ./files/* $(1)
endef

$(eval $(call BuildPackage,bmr200_freeioe))
