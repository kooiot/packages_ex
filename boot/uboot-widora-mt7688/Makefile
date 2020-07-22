#
# Copyright (C) 2020 Dirk Chang<dirk@kooiot.com>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_SOURCE_URL:=https://github.com/widora/u-boot-mt7688
PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=8ec3fb8ef889b10582efe0a3cb124f198c01544e
PKG_SOURCE_DATE:=2019-07-08
PKG_MIRROR_HASH:=5fbcb1be6ecb0e1d04fab90249718db9682b8e68e7e8fdf542119967313bc2e0

PKG_RELEASE:=1

include $(INCLUDE_DIR)/u-boot.mk
include $(INCLUDE_DIR)/package.mk

define U-Boot/Default
  BUILD_TARGET:=ramips
  BUILD_SUBTARGET:=mt76x8
  UBOOT_BOARD:=$(1)
  UBOOT_IMAGE:=uboot-$(1).bin
endef

define U-Boot/tlink_c1
  NAME:=ThingsLink C1
  BUILD_DEVICES:=kooiot_tlink-c1
endef

define U-Boot/widora_neo_32m
  NAME:=Widora Neo 32M
  BUILD_DEVICES:=widora_neo-32m
endef

UBOOT_CONFIGURE_VARS += USE_PRIVATE_LIBGCC=yes
UBOOT_MAKE_FLAGS = USE_PRIVATE_LIBGCC=yes

define Build/Prepare
	$(Build/Prepare/Default)

	mkdir -p $(PKG_BUILD_DIR)/toolchain_opt
	$(TAR) -C $(PKG_BUILD_DIR)/toolchain_opt -xf $(PKG_BUILD_DIR)/buildroot-gcc342.tar.bz2
	chmod +x $(PKG_BUILD_DIR)/mkconfig
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(STAGING_DIR_IMAGE)
	$(CP) $(PKG_BUILD_DIR)/uboot.bin $(STAGING_DIR_IMAGE)/$(UBOOT_IMAGE)
endef

define Package/u-boot/install
endef

UBOOT_TARGETS := \
	tlink_c1 \
	widora_neo_32m

$(eval $(call BuildPackage/U-Boot))
