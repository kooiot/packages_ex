#
# Copyright (C) 2021 KooIoT.com
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libcleri
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/kooiot/libcleri

# PKG_SOURCE_DATE:=2021-01-26
# PKG_SOURCE_VERSION:=3756dcf5802ade1e4720132d770169b686370493
# PKG_MIRROR_HASH:=f3b4de1b3b9a1131be851acebd967248c7c80d624f86f96e1cf98f6d57773f03
PKG_SOURCE_DATE:=2022-06-6
PKG_SOURCE_VERSION:=649904383cf8c00da634e19571c428d2d86ac2a4
PKG_MIRROR_HASH:=8a79d48a90aa3a5beca98a9bf898f0ae3b03576cea14c25606ca4c3d716a0d27

PKG_MAINTAINER:=Dirk Chang <dirk@kooiot.com>
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE.md

include $(INCLUDE_DIR)/package.mk

define Package/libcleri
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=C Left-Right Parser
  URL:=https://github.com/transceptor-technology/libcleri
  DEPENDS:=+libpcre2
endef

define Package/libcleri/description
  Language parser for the C/C++ programming language. Initially created for SiriDB.
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)/Release \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		$(MAKE_FLAGS) \
		ARCH="$(ARCH)" \
		CC="$(TARGET_CC)"
	mkdir -p $(PKG_INSTALL_DIR)/usr/include
	mkdir -p $(PKG_INSTALL_DIR)/usr/lib
	$(MAKE) -C $(PKG_BUILD_DIR)/Release \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		INSTALL_PATH="$(PKG_INSTALL_DIR)/usr" \
		$(MAKE_FLAGS) \
		ARCH="$(ARCH)" \
		install -i
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/cleri
	$(CP) $(PKG_INSTALL_DIR)/usr/include/cleri/* $(1)/usr/include/cleri/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/* $(1)/usr/lib/
endef

define Package/libcleri/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libcleri.so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libcleri))
