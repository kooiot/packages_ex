#
# Copyright (C) 2017-2020 Dirk Chang <dirk@kooiot.com>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libiconv-full-full
PKG_VERSION:=1.16
PKG_RELEASE:=2

PKG_SOURCE:=libiconv-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@GNU/libiconv
PKG_HASH:=e6a1b1b589654277ee790cce3734f07876ac4ccfaecbee8afa0b649cf529cc04
PKG_BUILD_DIR:=$(BUILD_DIR)/libiconv-$(PKG_VERSION)

PKG_MAINTAINER:=Jo-Philipp Wich <jo@mein.io>
PKG_LICENSE:=LGPL-2.1-or-later
PKG_LICENSE_FILES:=COPYING.LIB

PKG_FIXUP:=patch-libtool
PKG_INSTALL:=1
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/libiconv-full-full/Default
  URL:=https://www.gnu.org/software/libiconv/
  TITLE:=Character set conversion
endef

define Package/libiconv-full-full
  $(call Package/libiconv-full-full/Default)
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE+= library
  ABI_VERSION:=2
endef

define Package/libcharset-full
  $(call Package/libiconv-full-full/Default)
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE+= library
  ABI_VERSION:=1
endef

define Package/iconv-full
  $(call Package/libiconv-full-full/Default)
  DEPENDS:=+libiconv-full-full +libcharset-full
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE+= utility
endef

CONFIGURE_ARGS += \
	--enable-shared \
	--enable-static \
	--disable-rpath \
	--enable-relocatable

TARGET_CFLAGS += -fPIC -DPIC

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/lib/libiconv-full-full/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/iconv.h $(1)/usr/lib/libiconv-full-full/include/

	$(INSTALL_DIR) $(1)/usr/lib/libiconv-full-full/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libcharset.{a,so*} $(1)/usr/lib/libiconv-full-full/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libiconv.{a,so*} $(1)/usr/lib/libiconv-full-full/lib/
endef

define Package/libcharset-full/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libcharset.so.* $(1)/usr/lib/
endef

define Package/libiconv-full-full/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libiconv.so.* $(1)/usr/lib/
endef

define Package/iconv-full/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/iconv $(1)/usr/bin/
endef

$(eval $(call BuildPackage,libcharset-full))
$(eval $(call BuildPackage,libiconv-full-full))
$(eval $(call BuildPackage,iconv-full))
