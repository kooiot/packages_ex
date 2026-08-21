#
# Copyright (C) 2019 Dirk Chang
#
#

include $(TOPDIR)/rules.mk

PKG_NAME:=wwan-watch
PKG_VERSION:=4.0
PKG_RELEASE:=1
PKG_LICENSE:=MIT

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/version.mk

OWT_VER_NUM=$(subst -SNAPSHOT,,$(VERSION_NUMBER))
LUCI_LIB_BASE=luci-lua-runtime
ifeq ($(OWT_VER_NUM),19.07)
LUCI_LIB_BASE=luci-base
endif
ifeq ($(OWT_VER_NUM),21.02)
LUCI_LIB_BASE=luci-lua-base
endif
ifeq ($(OWT_VER_NUM),22.03)
LUCI_LIB_BASE=luci-lua-base
endif

define Package/wwan-watch
  SECTION:=kooiot
  CATEGORY:=KooIoT
  SUBMENU:=Network Utilities
  TITLE:=WWAN network Watcher
  DEPENDS:=+3ginfo-text +tlink-utility +$(LUCI_LIB_BASE) +luci-lib-jsonc +libuci-lua
  MAINTAINER:=Dirk Chang <dirk@kooiot.com>
endef

define Package/wwan-watch/description
  Utils to watching WWAN network. Update leds and restart WWAN if needs
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/wwan-watch/install
	$(CP) ./files/* $(1)
endef

$(eval $(call BuildPackage,wwan-watch))
