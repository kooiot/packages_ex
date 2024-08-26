#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# This feed is an adaptation of https://github.com/ulli-kroll/rtw88-usb/issues/6

include $(TOPDIR)/rules.mk

PKG_NAME:=rtw88-usb
PKG_RELEASE:=2

PKG_LICENSE:=GPLv2
PKG_LICENSE_FILES:=

PKG_SOURCE_URL:=https://github.com/lwfinger/rtw88
PKG_SOURCE_PROTO:=git
#PKG_SOURCE_DATE:=2020-10-17
#PKG_SOURCE_VERSION:=f9f4ee862b3e1f9e6a543d503a084rffg56
PKG_SOURCE_VERSION:=HEAD
PKG_MIRROR_HASH:=skip

# PKG_MAINTAINER:=
PKG_BUILD_PARALLEL:=1

STAMP_CONFIGURED_DEPENDS := $(STAGING_DIR)/usr/include/mac80211-backport/backport/autoconf.h

include $(INCLUDE_DIR)/kernel.mk
include $(INCLUDE_DIR)/package.mk

RTW_AUTOLOAD := rtw_8821cu \
		rtw_8822bu \
		rtw_8822cu \
		rtw_8812au \
		rtw_8821au \
		rtw_8723du

define KernelPackage/rtw88-usb
  SUBMENU:=Wireless Drivers
  TITLE:= Realtek RTL8822CU AP Mode
  DEPENDS:=+kmod-cfg80211 +kmod-mac80211 +kmod-usb-core +@DRIVER_11N_SUPPORT +@DRIVER_11AC_SUPPORT +@PCI_SUPPORT
  FILES:=\
	$(PKG_BUILD_DIR)/rtw_usb.ko \
	$(PKG_BUILD_DIR)/rtw_core.ko \
	$(PKG_BUILD_DIR)/rtw_8822cu.ko \
	$(PKG_BUILD_DIR)/rtw_8822c.ko \
	$(PKG_BUILD_DIR)/rtw_8822b.ko \
	$(PKG_BUILD_DIR)/rtw_8822bu.ko \
	$(PKG_BUILD_DIR)/rtw_8821c.ko \
	$(PKG_BUILD_DIR)/rtw_8821cu.ko \
	$(PKG_BUILD_DIR)/rtw_8821a.ko \
	$(PKG_BUILD_DIR)/rtw_8821au.ko \
	$(PKG_BUILD_DIR)/rtw_8812au.ko \
	$(PKG_BUILD_DIR)/rtw_8723d.ko \
	$(PKG_BUILD_DIR)/rtw_8723x.ko \
	$(PKG_BUILD_DIR)/rtw_8723du.ko
  AUTOLOAD:=$(call AutoLoad,50,$(RTW_AUTOLOAD))
endef

NOSTDINC_FLAGS = \
	-I$(PKG_BUILD_DIR) \
	-I$(PKG_BUILD_DIR)/include \
	-I$(STAGING_DIR)/usr/include/mac80211-backport \
	-I$(STAGING_DIR)/usr/include/mac80211-backport/uapi \
	-I$(STAGING_DIR)/usr/include/mac80211 \
	-I$(STAGING_DIR)/usr/include/mac80211/uapi \
	-include backport/autoconf.h \
	-include backport/backport.h

EXTRA_CFLAGS:= \
	-DRTW_SINGLE_WIPHY \
	-DRTW_USE_CFG80211_STA_EVENT \
	-DCONFIG_IOCTL_CFG80211 \
	-DCONFIG_CONCURRENT_MODE \
	-DBUILD_OPENWRT

EXTRA_KCONFIG:= \
	CONFIG_RTW88-USB=m \
	USER_MODULE_NAME=rtw88-usb

MAKE_OPTS:= \
	$(KERNEL_MAKE_FLAGS) \
	M="$(PKG_BUILD_DIR)" \
	NOSTDINC_FLAGS="$(NOSTDINC_FLAGS)" \
	USER_EXTRA_CFLAGS="$(EXTRA_CFLAGS)" \
	$(EXTRA_KCONFIG)

define Build/Compile
	$(Build/Compile/$(1))
endef

define Build/Compile/rtw88-usb-firmware
	true
endef

define Build/Compile/kmod-rtw88-usb
	+$(MAKE) $(PKG_JOBS) -C "$(LINUX_DIR)" \
		$(MAKE_OPTS) \
		modules
endef

define Package/rtw88-usb-firmware
  SECTION:=firmware
  CATEGORY:=Firmware
  TITLE:=RTL88-USB firmware files
  DEPENDS:=+kmod-rtw88-usb
endef

define Package/rtw88-usb-firmware/install
	$(INSTALL_DIR) $(1)/lib/firmware
	$(INSTALL_DIR) $(1)/lib/firmware/rtw88
	$(CP) $(PKG_BUILD_DIR)/firmware/* $(1)/lib/firmware/rtw88
endef

$(eval $(call KernelPackage,rtw88-usb))
$(eval $(call BuildPackage,rtw88-usb-firmware))
