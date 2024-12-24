# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2022 OpenWrt.org
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2024-08-04
PKG_SOURCE_URL=https://github.com/draftbottle/uboot-sophgo
PKG_SOURCE_VERSION:=59f64ab3055253b2cc752391c3c6f37fa1f84e10
PKG_MIRROR_HASH:=skip

PKG_RELEASE:=1

include $(INCLUDE_DIR)/u-boot.mk
include $(INCLUDE_DIR)/package.mk


define Build/Prepare
    $(call Build/Prepare/Default)
	$(warning print....................... Build/Prepare: ${UBOOT_SUB} $$(DEVICE_DTS)  $(STAGING_DIR_IMAGE) )
	cp files/$(UBOOT_SUB)/$(BUILD_DEVICE_CFG)_defconfig $(PKG_BUILD_DIR)/configs/$(BUILD_VARIANT)_defconfig
	cp files/$(UBOOT_SUB)/dts/*.dts $(PKG_BUILD_DIR)/arch/riscv/dts/
	cp files/$(UBOOT_SUB)/dts/*.dtsi $(PKG_BUILD_DIR)/arch/riscv/dts/
	cp files/$(UBOOT_SUB)/dts/cvi_board_memmap.h $(PKG_BUILD_DIR)/arch/riscv/dts/
	cp files/$(UBOOT_SUB)/cvitek.h $(PKG_BUILD_DIR)/include/cvitek/
	cp files/$(UBOOT_SUB)/cvi_board_init.c $(PKG_BUILD_DIR)/board/cvitek
endef


define U-Boot/Default
  BUILD_TARGET:=sophgo
  BUILD_DEVICE_CFG=$(1)
  UBOOT_IMAGE:=u-boot.bin
  DTS_DIR:=arch/riscv/dts
  UENV:=default
endef

# sophgo boards

define U-Boot/huashanpi
  NAME:=Sophgo huashan pi
  UBOOT_SUB:=cv181x
  UBOOT_DTS:=cv1812h_wevb_0007a_emmc.dtb
  BUILD_DEVICE_CFG:=cvitek_cv1812h_wevb_0007a_emmc
  UBOOT_MAKE_FLAGS := \
	CHIP=cv1812h \
	CVIBOARD=wevb_0007a_emmc \
	BOARD=cv181x \
	CHIP_SEGMENT=cv181x
endef

define U-Boot/milkv_duo
  NAME:=Sophgo milk-v duo
  UBOOT_SUB:=cv180x
  UBOOT_DTS:=cv1800b_milkv_duo_sd.dtb
  BUILD_DEVICE_CFG:=cvitek_cv1800b_milkv_duo_sd
  BUILD_DEVICES:=milkv_duo
  UBOOT_MAKE_FLAGS := \
	CHIP=cv1800b \
	CVIBOARD=milkv_duo_sd \
	BOARD=cv180x \
	CHIP_SEGMENT=cv180x
endef

define U-Boot/milkv_duo_256m
  NAME:=Sophgo milk-v duo256m
  UBOOT_SUB:=cv181x
  UBOOT_DTS:=cv1812cp_milkv_duo256m_sd.dtb
  BUILD_DEVICE_CFG:=cvitek_cv1812cp_milkv_duo256m_sd
  UBOOT_MAKE_FLAGS := \
	CHIP=cv1812cp \
	CVIBOARD=milkv_duo256m_sd \
	BOARD=cv181x \
	CHIP_SEGMENT=cv181x
endef

define U-Boot/milkv_duos
  NAME:=Sophgo milk-v duos
  UBOOT_SUB:=cv1813h
  UBOOT_DTS:=cv1813h_milkv_duos_sd.dtb
  BUILD_DEVICE_CFG:=cvitek_cv1813h_milkv_duos_sd
  UBOOT_MAKE_FLAGS := \
	CHIP=cv1813h \
	CVIBOARD=milkv_duos_sd \
	BOARD=cv181x \
	CHIP_SEGMENT=cv181x
endef


UBOOT_TARGETS := \
	huashanpi \
	milkv_duo \
	milkv_duo_256m \
	milkv_duos


define Build/InstallDev
	$(INSTALL_DIR) $(BIN_DIR)
	mkdir -p $(STAGING_DIR_IMAGE)

	python3 ./fiptool.py -v genfip $(STAGING_DIR_IMAGE)/$(BUILD_VARIANT)-fip.bin \
	--MONITOR_RUNADDR=0x80000000 \
	--CHIP_CONF=./firmware/${UBOOT_SUB}/chip_conf.bin \
	--NOR_INFO=FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF \
	--NAND_INFO=00000000 \
	--BL2=./firmware/${UBOOT_SUB}/bl2.bin \
	--BLCP_IMG_RUNADDR=0x05200200 \
	--BLCP_PARAM_LOADADDR=0 \
	--DDR_PARAM=./firmware/${UBOOT_SUB}/ddr_param.bin \
	--MONITOR=.//firmware/${UBOOT_SUB}/fw_dynamic.bin \
	--LOADER_2ND=$(PKG_BUILD_DIR)/u-boot.bin
endef

$(eval $(call BuildPackage/U-Boot))
