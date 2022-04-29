include $(TOPDIR)/rules.mk

PKG_NAME:=robot-web
PKG_VERSION:=0.1.0
PKG_RELEASE:=1

PKG_SOURCE:=v$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/kooiot/robot-web/releases/download/v$(PKG_VERSION)/v$(PKG_VERSION).tar.gz?
PKG_HASH:=721d474d28e94ed9ff577140cbbce17ef5c666be0e8ec4555f2909ef494f3044

PKG_MAINTAINER:=Dirk Chang <dirk@kooiot.com>
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=

define Package/robot-web
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=robot-web - for robot server web ui
  URL:=https://github.com/kooiot/robot-web
  DEPENDS:=+nginx
endef

define Package/robot-web/description
	For showing robot server status and client tasks in web
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)/src
	tar -C $(PKG_BUILD_DIR)/src -xzvf "$(DL_DIR)/$(PKG_SOURCE)"
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/robot-web/install
	$(INSTALL_DIR) $(1)/html/robot
	$(CP) $(PKG_BUILD_DIR)/src/* $(1)/html/robot/
endef

$(eval $(call BuildPackage,robot-web))
