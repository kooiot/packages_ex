include $(TOPDIR)/rules.mk

PKG_NAME:=rpi_monitoring
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL=https://github.com/krasuki/rpi-monitoring.git
PKG_SOURCE_DATE:=2020-11-27
PKG_SOURCE_VERSION:=00b1502169776e72de807897cee32dab351d352c
PKG_HASH:=f0918b817b15ce4095ab313f13ebfe187342addc7dd628d9dcb80076fc833276
PKG_MAINTAINER:=Dirk Chang <dirk@kooiot.com>
PKG_LICENSE:=GPL-2.0-or-later

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
-include $(STAGING_DIR)/host/mk/qmake.mk

define Package/rpi_monitoring
  SECTION:=xorg
  CATEGORY:=Xorg
  TITLE:=QT Launcher
  URL:=https://github.com/srdgame/rpi_monitoring/
  DEPENDS:=+qt5base-core +qt5base-gui +qt5base-widgets +qt5base-xml \
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

define Package/rpi_monitoring/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/* $(1)/usr/bin/
endef

$(eval $(call BuildPackage,rpi_monitoring))
