#
# Copyright (C) 2021 KooIoT.com
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=siridb-server
PKG_RELEASE:=2

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/kooiot/siridb-server
PKG_SOURCE_DATE:=2021-01-26
PKG_SOURCE_VERSION:=bfa8439e0c87279fc844385031a2ec7695c0c106
# PKG_MIRROR_HASH:=0cd74320be0270a07931e42d2f14f87a8b3fb664ecb5db58b0e838886211ab1f

PKG_MAINTAINER:=Dirk Chang <dirk@kooiot.com>
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE.md

include $(INCLUDE_DIR)/package.mk

define Package/siridb-server
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Database
  TITLE:=SiriDB Server
  URL:=https://github.com/SiriDB/siridb-server
  DEPENDS:=+libcleri +libpcre2 +libuv +yajl +libuuid
endef

define Package/siridb-server/description
  Language parser for the C/C++ programming language. Initially created for SiriDB.
endef

define Build/Compile
	$(MAKE) -C "$(PKG_BUILD_DIR)/Release" $(MAKE_FLAGS)  CFLAGS="$(TARGET_CPPFLAGS) "  LDFLAGS="$(TARGET_LDFLAGS)"
endef

define Build/Install
	$(INSTALL_DIR) $(1)/etc/siridb
  	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_BUILD_DIR)/siridb.conf $(1)/etc/siridb/siridb.conf
	$(CP) $(PKG_BUILD_DIR)/$(MAKE_PATH)/siridb-server $(1)/usr/bin/siridb-server
endef

define Package/siridb-server/install
	$(INSTALL_DIR) $(1)/etc/siridb
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/etc/siridb/siridb.conf $(1)/etc/siridb/siridb.conf
	$(CP) ./files/siridb-server.init $(1)/etc/init.d/siridb-server
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/siridb-server $(1)/usr/bin/siridb-server
	$(INSTALL_DIR) $(1)/var/lib/siridb
endef

$(eval $(call BuildPackage,siridb-server))
