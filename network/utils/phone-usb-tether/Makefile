#
# Copyright (C) 2025 Dirk Chang
#
#

include $(TOPDIR)/rules.mk

PKG_NAME:=phone-usb-tether
PKG_VERSION:=0.3
PKG_RELEASE:=1
PKG_LICNESE:=MIT

include $(INCLUDE_DIR)/package.mk

define Package/phone-usb-tether
  SECTION:=kooiot
  CATEGORY:=KooIoT
  SUBMENU:=Network Utilities
  TITLE:=USB Network shares auto script
  DEPENDS:=+kmod-usb-net-rndis +kmod-usb-storage \
		   +kmod-usb-net-ipheth +usbmuxd +libimobiledevice +usbutils
  MAINTAINER:=Dirk Chang <dirk@kooiot.com>
endef

define Package/phone-usb-tether/description
  Generate config when share network from phone(ios, android) device
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/phone-usb-tether/install
	$(CP) ./files/* $(1)
endef

$(eval $(call BuildPackage,phone-usb-tether))
