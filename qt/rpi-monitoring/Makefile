include $(TOPDIR)/rules.mk

PKG_NAME:=rpi-monitoring
PKG_RELEASE:=2

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL=https://github.com/srdgame/rpi-monitoring.git
PKG_SOURCE_DATE:=2020-11-30
PKG_SOURCE_VERSION:=4eab6dda5dd30131a2431243a4590d42bb19c76d
PKG_MAINTAINER:=Dirk Chang <dirk@kooiot.com>
PKG_LICENSE:=GPL-2.0-or-later

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
-include $(STAGING_DIR)/host/mk/qmake.mk

define Package/rpi-monitoring
  SECTION:=xorg
  CATEGORY:=Xorg
  TITLE:=QT Launcher
  URL:=https://github.com/srdgame/rpi-monitoring/
  DEPENDS:=+qt5base-core +qt5base-gui +qt5base-widgets \
	  +qt5base-xml +qt5base-printSupport \
	  +qt5base-plugin-input-libinput \
	  +qt5base-plugin-input-evdevtouch \
	  +qt5base-plugin-input-evdevkeyboard \
	  +qt5base-plugin-input-evdevmouse \
	  +qt5base-plugin-imageformats-ico \
	  +qt5base-plugin-imageformats-jpeg \
	  +qt5base-plugin-platforms-minimal \
	  +qt5base-plugin-platforms-linuxfb \
	  +qt5base-plugin-platforms-offscreen \
	  +qt5base-plugin-platforms-vnc \
	  +qt5graphicaleffects \
	  +qt5quick2-quick \
	  +qt5quick2-quick-widgets \
	  +qt5quick2-controls2 \
	  +qt5quick2-qml \
	  +qt5quick2-qml-module-qtquick-layouts \
	  +qt5quick2-qml-module-qtquick-window2
endef

define Package/rpi-monitoring/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/rpi-monitoring $(1)/usr/bin/
endef

$(eval $(call BuildPackage,rpi-monitoring))
