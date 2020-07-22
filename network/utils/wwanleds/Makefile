#
# Copyright (C) 2019 Dirk Chang
#
#

include $(TOPDIR)/rules.mk

PKG_NAME:=wwanleds
PKG_VERSION:=0.6
PKG_RELEASE:=1
PKG_LICENSE:=MIT

include $(INCLUDE_DIR)/package.mk

define Package/wwanleds
  SECTION:=net
  CATEGORY:=Network
  TITLE:=WWAN network LED indicator
  DEPENDS:=+3ginfo-text
  MAINTAINER:=Dirk Chang <dirk@kooiot.com>
endef

define Package/wwanleds/description
  Utils to update the signal-strength indicator LEDs
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/wwanleds/install
	$(CP) ./files/* $(1)
endef

$(eval $(call BuildPackage,wwanleds))
