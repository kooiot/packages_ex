include $(TOPDIR)/rules.mk

PKG_NAME:=rpi_big_qt_face
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL=https://github.com/srdgame/RPi-BigQtFace.git
PKG_SOURCE_DATE:=2020-11-30
PKG_SOURCE_VERSION:=625b078084b0fdb34e97f723413bc30f69098a4c
PKG_MAINTAINER:=Dirk Chang <dirk@kooiot.com>
PKG_LICENSE:=GPL-2.0-or-later

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
-include $(STAGING_DIR)/host/mk/qmake.mk

define Package/rpi_big_qt_face
  SECTION:=xorg
  CATEGORY:=Xorg
  TITLE:=RPI Big QT Face
  URL:=https://github.com/srdgame/rpi_big_qt_face/
  DEPENDS:=+qt5base-core +qt5base-gui +qt5base-widgets \
	  +qt5base-xml +qt5base-sql +qt5base-network \
	  +qt5websockets \
	  +qt5base-plugin-input-libinput \
	  +qt5base-plugin-input-evdevtouch \
	  +qt5base-plugin-input-evdevkeyboard \
	  +qt5base-plugin-input-evdevmouse \
	  +qt5base-plugin-imageformats-ico \
	  +qt5base-plugin-imageformats-jpeg \
	  +qt5base-plugin-imageformats-png \
	  +qt5base-plugin-platforms-minimal \
	  +qt5base-plugin-platforms-linuxfb \
	  +qt5base-plugin-platforms-offscreen \
	  +qt5base-plugin-platforms-vnc \
	  +qt5base-plugin-sqldrivers-sqlite
endef

define Package/rpi_big_qt_face/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/BigFace $(1)/usr/bin/
endef

$(eval $(call BuildPackage,rpi_big_qt_face))
