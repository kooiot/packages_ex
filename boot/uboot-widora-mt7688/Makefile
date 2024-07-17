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
PKG_MIRROR_HASH:=skip

PKG_RELEASE:=1

include $(INCLUDE_DIR)/u-boot.mk
include $(INCLUDE_DIR)/package.mk

define U-Boot/Default
  BUILD_TARGET:=ramips
  BUILD_SUBTARGET:=mt76x8
  UBOOT_BOARD:=$(1)
  UBOOT_IMAGE:=uboot-$(1).bin
endef

define U-Boot/kooiot_tlink_c1
  NAME:=ThingsLink C1
  BUILD_DEVICES:=kooiot_tlink-c1
endef

define U-Boot/kooiot_tlink_c1_16m
  NAME:=ThingsLink C1 (16M)
  BUILD_DEVICES:=kooiot_tlink-c1-16m
endef

define U-Boot/kooiot_tlink_c1_32m
  NAME:=ThingsLink C1 (32M)
  BUILD_DEVICES:=kooiot_tlink-c1-32m
endef

define U-Boot/kooiot_tlink_c2
  NAME:=ThingsLink C1
  BUILD_DEVICES:=kooiot_tlink-c2
endef

define U-Boot/kooiot_tlink_c2_16m
  NAME:=ThingsLink C2 (16M)
  BUILD_DEVICES:=kooiot_tlink-c2-16m
endef

define U-Boot/kooiot_tlink_c2_v2
  NAME:=ThingsLink C2 V2 (32M)
  BUILD_DEVICES:=kooiot_tlink-c2-v2
endef

define U-Boot/kooiot_tlink_c2_32m
  NAME:=ThingsLink C2 (32M)
  BUILD_DEVICES:=kooiot_tlink-c2-32m
endef

define U-Boot/kooiot_tlink_c3
  NAME:=ThingsLink C3
  BUILD_DEVICES:=kooiot_tlink-c3
endef

define U-Boot/kooiot_tlink_c3_16m
  NAME:=ThingsLink C3 (16M)
  BUILD_DEVICES:=kooiot_tlink-c3-16m
endef

define U-Boot/kooiot_tlink_c3_32m
  NAME:=ThingsLink C3 (32M)
  BUILD_DEVICES:=kooiot_tlink-c3-32m
endef

define U-Boot/kooiot_tlink_c4_16m
  NAME:=ThingsLink C4 (16M)
  BUILD_DEVICES:=kooiot_tlink-c4-16m
endef

define U-Boot/kooiot_tlink_c4_32m
  NAME:=ThingsLink C4 (32M)
  BUILD_DEVICES:=kooiot_tlink-c4-32m
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
	kooiot_tlink_c1 \
	kooiot_tlink_c1_16m \
	kooiot_tlink_c1_32m \
	kooiot_tlink_c2 \
	kooiot_tlink_c2_16m \
	kooiot_tlink_c2_32m \
	kooiot_tlink_c2_v2 \
	kooiot_tlink_c3 \
	kooiot_tlink_c3_16m \
	kooiot_tlink_c3_32m \
	kooiot_tlink_c4_16m \
	kooiot_tlink_c4_32m \
	widora_neo_32m

$(eval $(call BuildPackage/U-Boot))
