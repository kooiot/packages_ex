#
# Copyright (C) 2020-2021 KooIoT.com
#
#

include $(TOPDIR)/rules.mk

PKG_NAME:=symlink-psn
PKG_VERSION:=2024-11-07
PKG_RELEASE:=1
PKG_LICNESE:=MIT

include $(INCLUDE_DIR)/package.mk

define Package/symlink-psn
  SECTION:=kooiot
  CATEGORY:=KooIoT
  TITLE:=SymLink PSN formatter
  MAINTAINER:=Dirk Chang <dirk@kooiot.com>
endef

define Package/symlink-psn/description
  Read/Write the PSN in SymLink format
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/symlink-psn/install
	$(CP) ./files/* $(1)
endef

$(eval $(call BuildPackage,symlink-psn))
