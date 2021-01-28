#
# Copyright (C) 2021 KooIoT.com
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=siridb-server
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/kooiot/siridb-server
PKG_SOURCE_DATE:=2021-01-28
PKG_SOURCE_VERSION:=9c0bca6bf2f9e0074808c0788137b88c69731f01
# PKG_MIRROR_HASH:=368727097e4025cdc72b63bb76be2842fec937cc805dc8ffe80ecc614f65a2f6

PKG_MAINTAINER:=Dirk Chang <dirk@kooiot.com>
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE.md

include $(INCLUDE_DIR)/package.mk

define Package/siridb-server
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Database
  TITLE:=SiriDB time series database
  URL:=https://github.com/SiriDB/siridb-server
  DEPENDS:=+libcleri +libpcre2 +libuv +yajl +libuuid
endef

define Package/siridb-server/description
  SiriDB is a highly-scalable, robust and super fast time series database.
endef

define Build/Compile
	$(MAKE) -C "$(PKG_BUILD_DIR)/Release" $(MAKE_FLAGS)  CFLAGS="$(TARGET_CPPFLAGS) "  LDFLAGS="$(TARGET_LDFLAGS)"
endef

define Build/Install
	$(INSTALL_DIR) $(PKG_INSTALL_DIR)/usr/bin
	$(CP) $(PKG_BUILD_DIR)/Release/siridb-server $(PKG_INSTALL_DIR)/usr/bin/siridb-server
endef

define Package/siridb-server/install
	$(INSTALL_DIR) $(1)/etc/siridb
	$(CP) ./files/siridb.conf $(1)/etc/siridb/siridb.conf

	$(INSTALL_DIR) $(1)/etc/init.d
	$(CP) ./files/siridb-server.init $(1)/etc/init.d/siridb-server

	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/siridb-server $(1)/usr/bin/siridb-server
endef

$(eval $(call BuildPackage,siridb-server))
