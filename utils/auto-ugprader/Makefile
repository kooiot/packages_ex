#
# Copyright (C) 2020 Dirk Chang
#
#

include $(TOPDIR)/rules.mk

PKG_NAME:=auto-upgrader
PKG_VERSION:=0.1
PKG_RELEASE:=1
PKG_LICNESE:=MIT

include $(INCLUDE_DIR)/package.mk

define Package/auto-upgrader
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Auto upgrade system detected by condition
  MAINTAINER:=Dirk Chang <dirk@kooiot.com>
  URL:=http://kooiot.com
endef

define Package/auto-upgrader/description
  Auto upgrade system detected by condition
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/auto-upgrader/install
	$(CP) ./files/* $(1)
endef

$(eval $(call BuildPackage,auto-upgrader))
