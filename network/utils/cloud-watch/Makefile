#
# Copyright (C) 2020 Dirk Chang
#
#

include $(TOPDIR)/rules.mk

PKG_NAME:=cloud-watch
PKG_VERSION:=1.4
PKG_RELEASE:=1
PKG_LICNESE:=MIT

include $(INCLUDE_DIR)/package.mk

define Package/cloud-watch
  SECTION:=kooiot
  CATEGORY:=KooIoT
  SUBMENU:=Network Utilities
  TITLE:=WWAN restart by watching cloud connnection status
  DEPENDS:=+freeioe +tlink-utility
  MAINTAINER:=Dirk Chang <dirk@kooiot.com>
endef

define Package/cloud-watch/description
  Utils to restart wwan module by watch the cloud connection status exported by FreeIOE
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/cloud-watch/install
	$(CP) ./files/* $(1)
endef

$(eval $(call BuildPackage,cloud-watch))
