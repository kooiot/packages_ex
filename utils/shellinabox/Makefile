# 
# Copyright (C) 2015-2021 KooIoT.com
#
# This is free software, licensed under MIT.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=shellinabox
PKG_RELEASE:=1
PKG_MAINTAINER:=Dirk Chang <dirk@kooiot.com>
PKG_LICENSE:=GPL-2.0
PKG_LICENSE_FILES:=COPYING

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL=https://github.com/freeioe/shellinabox
PKG_SOURCE_DATE:=2019-07-07
PKG_SOURCE_VERSION:=7ea72226de399ac7f11cb6cb5670ace59b5ed491
PKG_MIRROR_HASH:=b983423ee159cc8dde827d7b45630485f414a30f0fccb5a51b574f27114c4173

PKG_FIXUP:=autoreconf

include $(INCLUDE_DIR)/package.mk

define Package/shellinabox
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Shell In A Box
  URL:=https://github.com/freeioe/shellinabox/
  DEPENDS:=+zlib +libopenssl
endef

define Package/shellinabox/description
	Shell in A Box
endef

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
