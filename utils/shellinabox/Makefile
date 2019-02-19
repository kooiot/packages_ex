# 
# Copyright (C) 2015 KooIoT.com
#
# This is free software, licensed under MIT.
# See /LICENSE for more information.
#
# This Makefile is a skeleton
#

include $(TOPDIR)/rules.mk

PKG_NAME:=shellinabox
PKG_VERSION:=2.20
PKG_RELEASE:=2
PKG_MAINTAINER:=Dirk Chang <dirk@kooiot.com>
PKG_LICENSE:=GPL-2.0
PKG_LICENSE_FILES:=COPYING

PKG_SOURCE:=shellinabox-$(PKG_VERSION).tar.gz

SIB_SOURCE_URL:=https://github.com/shellinabox/shellinabox/archive/
SIB_MD5SUM:=5abe705d4e3092b667a187e10eb01ce7

PKG_FIXUP:=autoreconf

include $(INCLUDE_DIR)/package.mk

define Package/shellinabox
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Shell In A Box
  URL:=https://github.com/shellinabox/shellinabox/
  DEPENDS:=+zlib
endef

define Package/shellinabox/description
	Shell in A Box
endef

define Download/shellinabox
	FILE:=$(PKG_SOURCE)
	URL:=$(SIB_SOURCE_URL)
	URL_FILE:=v$(PKG_VERSION).tar.gz
	HASH:=$(SIB_MD5SUM)
endef
$(eval $(call Download,shellinabox))

#define Package/shellinabox/config
#  source "$(SOURCE)/Config.in"
#endef

CONFIGURE_ARGS += \
	--disable-utmp

define Package/shellinabox/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/shellinaboxd $(1)/usr/bin
	$(INSTALL_DIR) $(1)/etc/init.d
	$(CP) ./files/shellinabox.init $(1)/etc/init.d/shellinabox
	$(INSTALL_DIR) $(1)/etc/shellinabox
	$(CP) $(PKG_BUILD_DIR)/shellinabox/black-on-white.css $(1)/etc/shellinabox
	$(CP) $(PKG_BUILD_DIR)/shellinabox/white-on-black.css $(1)/etc/shellinabox
endef

$(eval $(call BuildPackage,shellinabox))
