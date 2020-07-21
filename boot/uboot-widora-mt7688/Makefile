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
PKG_MIRROR_HASH:=e40a7f624b1758b276f81c765ef1da568c595b8bd54568b9cceca7d170ebc612

PKG_RELEASE:=1

include $(INCLUDE_DIR)/u-boot.mk
include $(INCLUDE_DIR)/package.mk

define U-Boot/Default
  BUILD_TARGET:=ramips
  BUILD_SUBTARGET:=generic
  UBOOT_BOARD:=$(1)
  UBOOT_IMAGE:=uboot-$(1).bin
endef

define U-Boot/tlink_c1
  NAME:=ThingsLink C1
  BUILD_DEVICES:=kooiot_tlink_c1
endef

UBOOT_CONFIGURE_VARS += USE_PRIVATE_LIBGCC=yes
UBOOT_MAKE_FLAGS = USE_PRIVATE_LIBGCC=yes

define Build/InstallDev
	$(INSTALL_DIR) $(STAGING_DIR_IMAGE)
	$(CP) $(PKG_BUILD_DIR)/$(UBOOT_IMAGE) $(STAGING_DIR_IMAGE)/$(UBOOT_IMAGE)
endef

define Package/u-boot/install
endef

UBOOT_TARGETS := \
	tlink_c1

$(eval $(call BuildPackage/U-Boot))
