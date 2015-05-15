#
# Copyright (C) 2015 KooIoT.com
#
# This is free software, licensed under MIT
# See /LICENSE for more information.
# 

include $(TOPDIR)/rules.mk

PKG_NAME:=kooiot
PKG_VERSION:=1.4.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://localhost:8081/static/releases/sys
PKG_MAINTAINER:=srdgame <srdgame@gmail.com>

include $(INCLUDE_DIR)/package.mk

define Package/kooiot
  SUBMENU:=KooIoT
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=KooIoT
  URL:=https://github.com/srdgame/kooiot
  DEPENDS:=+lua +luac +liblua +luasocket \
	  +unzip +zip +lpeg +lua-cjson \
	  +lua-copas +lua-coxpcall +lua-lzlib \
	  +lua-md5 +lua-rings +lua-rs232 \
	  +lua-wsapi-xavante +luabitop +luaposix \
	  +luasql-sqlite3 +lzmq +lua-mobdebug\
	  +kmod-loop +start-stop-daemon
endef

define Package/kooiot/description
	KooIoT is open souce platform for internet of things running on tiny embedded machine
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/kooiot/install
	$(INSTALL_DIR) $(1)/kooiot
	$(INSTALL_DIR) $(1)/kooiot/apps
	$(CP) $(PKG_BUILD_DIR)/core.sfs $(1)/kooiot/
endef

$(eval $(call BuildPackage,kooiot))
