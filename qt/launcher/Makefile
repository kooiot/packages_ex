include $(TOPDIR)/rules.mk

PKG_NAME:=qt_launcher
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL=https://github.com/srdgame/qt_launcher.git
PKG_SOURCE_DATE:=2020-11-27
PKG_SOURCE_VERSION:=c219feb6bfa89874ba922865d8d6c3ae3bb612ea
PKG_HASH:=f0918b817b15ce4095ab313f13ebfe187342addc7dd628d9dcb80076fc833276
PKG_MAINTAINER:=Dirk Chang <dirk@kooiot.com>
PKG_LICENSE:=GPL-2.0-or-later

include $(INCLUDE_DIR)/package.mk
include $(STAGING_DIR)/host/mk/qmake.mk

define Package/qt_launcher
  SECTION:=xorg
  CATEGORY:=Xorg
  TITLE:=QT Launcher
  URL:=https://github.com/srdgame/qt_launcher/
  DEPENDS:=+qt5base-core +qt5base-gui +qt5base-widgets +qt5base-xml \
	  +qt5base-network \
	  +qt5base-plugin-input-libinput \
	  +qt5base-plugin-input-evdevtouch \
	  +qt5base-plugin-input-evdevkeyboard \
	  +qt5base-plugin-input-evdevmouse \
	  +qt5base-plugin-imageformats-ico \
	  +qt5base-plugin-imageformats-jpeg \
	  +qt5base-plugin-platforms-minimal \
	  +qt5base-plugin-platforms-linuxfb \
	  +qt5base-plugin-platforms-offscreen \
	  +qt5base-plugin-platforms-vnc
endef

define Build/Configure
	cd $(PKG_BUILD_DIR) && qmake -o Makefile Launcher.pro
endef

define Package/qt_launcher/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/* $(1)/usr/bin/
endef

$(eval $(call BuildPackage,qt_launcher))
