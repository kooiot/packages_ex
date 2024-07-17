#
# Copyright (C) 2024 Dirk Chang <dirk@kooiot.com>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=rtl8733bs
PKG_RELEASE:=1

PKG_MAINTAINER:=Dirk Chang <dirk@kooiot.com>
PKG_LICENSE:=GPLv2

PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define KernelPackage/rtl8733bs
  SUBMENU:=Wireless Drivers
  TITLE:=RTL8733BS wifi-drivers support
  DEPENDS:=@TARGET_sunxi +kmod-mac80211 \
	+@DRIVER_11AC_SUPPORT +@DRIVER_11N_SUPPORT
  FILES:=$(PKG_BUILD_DIR)/8733bs.ko
  AUTOLOAD:=$(call AutoProbe,8733bs)
  PROVIDES:=kmod-rtl8733bs
endef

NOSTDINC_FLAGS = \
	$(KERNEL_NOSTDINC_FLAGS) \
	-I$(PKG_BUILD_DIR) \
	-I$(PKG_BUILD_DIR)/include \
	-I$(STAGING_DIR)/usr/include/mac80211-backport/uapi \
	-I$(STAGING_DIR)/usr/include/mac80211-backport \
	-I$(STAGING_DIR)/usr/include/mac80211/uapi \
	-I$(STAGING_DIR)/usr/include/mac80211 \
	-include backport/autoconf.h \
	-include backport/backport.h

NOSTDINC_FLAGS+=-DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT -DCONFIG_RTL8733B
RTL_MAKEDEFS = CONFIG_RTL8733BS=m

define Build/Compile
	+$(KERNEL_MAKE) $(RTL_MAKEDEFS) $(PKG_JOBS) \
		M="$(PKG_BUILD_DIR)" \
		NOSTDINC_FLAGS="$(NOSTDINC_FLAGS)" \
		modules
endef

$(eval $(call KernelPackage,rtl8733bs))
