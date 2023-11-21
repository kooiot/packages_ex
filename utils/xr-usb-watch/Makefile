#
# Copyright (C) 2020 Dirk Chang
#
#

include $(TOPDIR)/rules.mk

PKG_NAME:=xr-usb-watch
PKG_VERSION:=1.0
PKG_RELEASE:=1
PKG_LICNESE:=MIT

include $(INCLUDE_DIR)/package.mk

define Package/xr-usb-watch
  SECTION:=kooiot
  CATEGORY:=KooIoT
  SUBMENU:=Utilities
  TITLE:=Watch XR USB To Serial chip status
  DEPENDS:=+tlink-utility
  MAINTAINER:=Dirk Chang <dirk@kooiot.com>
endef

define Package/xr-usb-watch/description
  Utils to reset XR USB hub to make sure USB2Serial chips works
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/xr-usb-watch/install
	$(CP) ./files/* $(1)
endef

$(eval $(call BuildPackage,xr-usb-watch))
