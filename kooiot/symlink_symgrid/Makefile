#
# Copyright (C) 2019 Dirk Chang
#
#

include $(TOPDIR)/rules.mk

PKG_NAME:=symlink_symgrid
PKG_VERSION:=0.1
PKG_RELEASE:=1
PKG_LICNESE:=MIT

include $(INCLUDE_DIR)/package.mk

define Package/symlink_symgrid
  SECTION:=kooiot
  CATEGORY:=KooIoT
  TITLE:=SymLink project to symgrid.com
  DEPENDS:=+symlink
  MAINTAINER:=Dirk Chang <dirk@kooiot.com>
endef

define Package/symlink_symgrid/description
  SymLink default project file for symgrid.com
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/symlink_symgrid/install
	$(INSTALL_DIR) $(1)/mnt/sympad/project
	$(CP) ./files/* $(1)/mnt/sympad/project
endef

$(eval $(call BuildPackage,symlink_symgrid))
