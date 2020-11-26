include $(TOPDIR)/rules.mk

PKG_NAME:=qt_launcher
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL=https://github.com/srdgame/qt_launcher.git
PKG_SOURCE_DATE:=2020-11-26
PKG_SOURCE_VERSION:=1665d9e9212dcd118629a74fbe658841f81036f7
PKG_MAINTAINER:=Dirk Chang <dirk@kooiot.com>
PKG_LICENSE:=GPL-2.0-or-later

include $(INCLUDE_DIR)/package.mk

define Package/qt_launcher
  SECTION:=xorg
  CATEGORY:=Xorg
  TITLE:=QT Launcher
  URL:=https://github.com/srdgame/qt_launcher/
  DEPENDS:=+qt5-core +qt5-widgets +qt5-xml
endef

define Package/Configure
	qmake -o Makefile Launcher.pro
endef

define Package/qt_launcher/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/launcher $(1)/usr/bin/
endef

$(eval $(call BuildPackage,qt_launcher))
