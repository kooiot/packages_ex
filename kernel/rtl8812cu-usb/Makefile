#
# Copyright (C) 2021 ImmortalWrt
# <https://immortalwrt.org>
#
# This is free software, licensed under the GNU General Public License v3.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=rtl8812cu
PKG_RELEASE:=1

PKG_SOURCE_URL:=https://github.com/srdgame/rtl8812cu-20200609.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2022-09-16
PKG_SOURCE_VERSION:=master
PKG_MIRROR_HASH:=skip

PKG_LICENSE:=GPL-2.0
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINTER:=CN_SZTL <cnsztl@immortalwrt.org>

PKG_BUILD_PARALLEL:=1

STAMP_CONFIGURED_DEPENDS := $(STAGING_DIR)/usr/include/mac80211-backport/backport/autoconf.h

include $(INCLUDE_DIR)/kernel.mk
include $(INCLUDE_DIR)/package.mk

define KernelPackage/rtl8812cu
  SUBMENU:=Wireless Drivers
  TITLE:=Realtek RTL8812CU/RTL8822CU USB WiFi support
  DEPENDS:=+kmod-cfg80211 +kmod-usb-core +@DRIVER_11N_SUPPORT +@DRIVER_11AC_SUPPORT @!LINUX_3_18 @!LINUX_4_9
  FILES:=$(PKG_BUILD_DIR)/rtl8812cu.ko
  AUTOLOAD:=$(call AutoProbe,rtl8812cu)
  PROVIDES:=kmod-rtl8812cu
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

NOSTDINC_FLAGS+=-DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT \
				-D_LINUX_BYTEORDER_SWAB_H -DBUILD_OPENWRT -DRTW_SINGLE_WIPHY

define Build/Compile
	+$(MAKE) $(PKG_JOBS) -C "$(LINUX_DIR)" \
		$(KERNEL_MAKE_FLAGS) \
		SUBDIRS="$(PKG_BUILD_DIR)" \
		NOSTDINC_FLAGS="$(NOSTDINC_FLAGS)" \
		modules
endef

$(eval $(call KernelPackage,rtl8812cu))
