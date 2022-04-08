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
PKG_SOURCE_DATE:=2022-04-07
PKG_SOURCE_VERSION:=0572abd9b2a3f975c5cf1bf83a1e60773c0f76f2
PKG_MIRROR_HASH:=99ce1fac49237bc774060cfbef0c0bfe6b3b16485d7c5dea37fb43c4ac6e6126

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
