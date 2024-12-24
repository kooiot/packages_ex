#
# Copyright (C) 2020-2021 KooIoT.com
#
#

include $(TOPDIR)/rules.mk

PKG_NAME:=jw-package-1
PKG_VERSION:=2022.04.24
PKG_RELEASE:=1
PKG_LICNESE:=MIT

include $(INCLUDE_DIR)/package.mk

define Package/jw-package-1
  SECTION:=kooiot
  CATEGORY:=KooIoT
  SUBMENU:=Customer
  TITLE:=JianWei Package 01
  MAINTAINER:=Dirk Chang <dirk@kooiot.com>
endef

define Package/jw-package-1/description
  JianWei Package 01
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/jw-package-1/install
	$(CP) ./files/* $(1)
endef

$(eval $(call BuildPackage,jw-package-1))
