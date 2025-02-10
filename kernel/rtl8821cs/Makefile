#
# Copyright (C) 2024 Dirk Chang <dirk@kooiot.com>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=rtl8821cs
PKG_RELEASE:=1

PKG_MAINTAINER:=Dirk Chang <dirk@kooiot.com>
PKG_LICENSE:=GPLv2

PKG_BUILD_PARALLEL:=1

STAMP_CONFIGURED_DEPENDS := $(STAGING_DIR)/usr/include/mac80211-backport/backport/autoconf.h

include $(INCLUDE_DIR)/kernel.mk
include $(INCLUDE_DIR)/package.mk

define KernelPackage/rtl8821cs
  SUBMENU:=Wireless Drivers
  TITLE:=RTL8821CS wifi-drivers support
  DEPENDS:=@TARGET_sunxi +kmod-mac80211 +kmod-mmc \
	+@DRIVER_11AC_SUPPORT +@DRIVER_11N_SUPPORT
  FILES:=$(PKG_BUILD_DIR)/8821cs.ko
  AUTOLOAD:=$(call AutoProbe,8821cs)
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

NOSTDINC_FLAGS+=-DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT -DCONFIG_RTL8821C -DBUILD_OPENWRT
RTL_MAKEDEFS = CONFIG_RTL8821CS=m

ifeq ($(CONFIG_BIG_ENDIAN),y)
NOSTDINC_FLAGS += -DCONFIG_BIG_ENDIAN
else
NOSTDINC_FLAGS += -DCONFIG_LITTLE_ENDIAN
endif

define Build/Compile
	+$(KERNEL_MAKE) $(RTL_MAKEDEFS) $(PKG_JOBS) \
		M="$(PKG_BUILD_DIR)" \
		NOSTDINC_FLAGS="$(NOSTDINC_FLAGS)" \
		modules
endef

$(eval $(call KernelPackage,rtl8821cs))
