#
# Copyright (C) 2024 Dirk Chang <dirk@kooiot.com>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=aic8800
PKG_RELEASE:=1

PKG_MAINTAINER:=Dirk Chang <dirk@kooiot.com>
PKG_LICENSE:=GPLv2

PKG_BUILD_PARALLEL:=1

BUILD_OPENWRT_VER:=10000
ifeq ($(VERSION_NUMBER),SNAPSHOT)
BUILD_OPENWRT_VER_2=$(VERSION_NUMBER)
else
BUILD_OPENWRT_VER_2=$(subst -SNAPSHOT,,$(VERSION_NUMBER))
BUILD_OPENWRT_VER=$(subst .,,$(BUILD_OPENWRT_VER_2))
endif

include $(INCLUDE_DIR)/kernel.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/version.mk

define KernelPackage/aic8800-default
  SUBMENU:=Wireless Drivers
  TITLE:=AIC8800 wifi-drivers support
  DEPENDS:=+kmod-mac80211 +kmod-cfg80211 \
	+@DRIVER_11AC_SUPPORT +@DRIVER_11N_SUPPORT
endef

define KernelPackage/aic8800-usb
  $(KernelPackage/aic8800-default)
  TITLE:=AIC8800 USB wifi-drivers support
  DEPENDS+=+kmod-usb-core 
  KCONFIG:=CONFIG_AIC_LOADFW_SUPPORT=m \
  	CONFIG_AIC8800_WLAN_SUPPORT=m
  FILES:=$(PKG_BUILD_DIR)/USB/driver_fw/drivers/aic8800/aic_load_fw/aic_load_fw.ko \
	$(PKG_BUILD_DIR)/USB/driver_fw/drivers/aic8800/aic8800_fdrv/aic8800_fdrv.ko
  AUTOLOAD:=$(call AutoProbe,aic8800_fdrv)
endef

define Package/aic8800-usb-firmware
  SECTION:=firmware
  CATEGORY:=Firmware
  TITLE:=AIC8800-USB firmware files
endef

define KernelPackage/aic8800-sdio
  $(KernelPackage/aic8800-default)
  TITLE:=AIC8800 SDIO wifi-drivers support
  DEPENDS+=+kmod-mmc
  KCONFIG:=CONFIG_AIC8800_WLAN_SUPPORT=m \
  	CONFIG_AIC_WLAN_SUPPORT=m
  FILES:=$(PKG_BUILD_DIR)/SDIO/driver_fw/driver/aic8800/aic8800_fdrv/aic8800_fdrv.ko \
	$(PKG_BUILD_DIR)/SDIO/driver_fw/driver/aic8800/aic8800_btlpm/aic8800_btlpm.ko \
	$(PKG_BUILD_DIR)/SDIO/driver_fw/driver/aic8800/aic8800_bsp/aic8800_bsp.ko
  AUTOLOAD:=$(call AutoProbe,aic8800_fdrv)
endef

define Package/aic8800-sdio-firmware
  SECTION:=firmware
  CATEGORY:=Firmware
  TITLE:=AIC8800-SDIO firmware files
endef

NOSTDINC_FLAGS = \
	$(KERNEL_NOSTDINC_FLAGS) \
	-I$(PKG_BUILD_DIR) \
	-I$(STAGING_DIR)/usr/include/mac80211-backport/uapi \
	-I$(STAGING_DIR)/usr/include/mac80211-backport \
	-I$(STAGING_DIR)/usr/include/mac80211/uapi \
	-I$(STAGING_DIR)/usr/include/mac80211 \
	-include backport/autoconf.h \
	-include backport/backport.h

# AIC_MAKEDEFS = CONFIG_AIC8800_WLAN_SUPPORT=m \
#  	CONFIG_AIC_WLAN_SUPPORT=m \
#	CONFIG_AIC_INTF_SDIO=y

NOSTDINC_FLAGS += -DBUILD_OPENWRT=$(BUILD_OPENWRT_VER)

define Build/Compile
	echo $(1) $(2)
	$(Build/Compile/$(1))
endef

define Build/Compile/kmod-aic8800-usb
	+$(KERNEL_MAKE) $(AIC_MAKEDEFS) $(PKG_JOBS) \
		M="$(PKG_BUILD_DIR)/USB/driver_fw/drivers/aic8800" \
		NOSTDINC_FLAGS="$(NOSTDINC_FLAGS)" \
		modules
endef

define Build/Compile/kmod-aic8800-sdio
	+$(KERNEL_MAKE) $(AIC_MAKEDEFS) $(PKG_JOBS) \
		M="$(PKG_BUILD_DIR)/SDIO/driver_fw/driver/aic8800" \
		NOSTDINC_FLAGS="$(NOSTDINC_FLAGS)" \
		modules
endef

define Package/aic8800-usb-firmware/install
	$(INSTALL_DIR) $(1)/lib/firmware
	$(INSTALL_DIR) $(1)/lib/firmware/aic8800_fw/USB
	$(CP) $(PKG_BUILD_DIR)/USB/driver_fw/fw/* $(1)/lib/firmware/aic8800_fw/USB/
endef

define Package/aic8800-sdio-firmware/install
	$(INSTALL_DIR) $(1)/lib/firmware
	$(INSTALL_DIR) $(1)/lib/firmware/aic8800_fw/SDIO
	$(CP) $(PKG_BUILD_DIR)/SDIO/driver_fw/fw/* $(1)/lib/firmware/aic8800_fw/SDIO/
endef

$(eval $(call KernelPackage,aic8800-usb))
# $(eval $(call KernelPackage,aic8800-sdio))
$(eval $(call BuildPackage,aic8800-usb-firmware))
# $(eval $(call BuildPackage,aic8800-sdio-firmware))
