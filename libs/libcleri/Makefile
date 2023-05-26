#
# Copyright (C) 2021 KooIoT.com
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libcleri
PKG_VERSION:=1.0.1
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/kooiot/libcleri

PKG_SOURCE_DATE:=2023-05-26
PKG_SOURCE_VERSION:=43f6dd3b7fac9c56abd1a031542b08be259497b7
PKG_MIRROR_HASH:=0d1578175facfc9fde571206d39040b57489af61f5192a12478fd00b0a58834c

#PKG_SOURCE_DATE:=2022-06-6
#PKG_SOURCE_VERSION:=649904383cf8c00da634e19571c428d2d86ac2a4
#PKG_MIRROR_HASH:=8a79d48a90aa3a5beca98a9bf898f0ae3b03576cea14c25606ca4c3d716a0d27

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
