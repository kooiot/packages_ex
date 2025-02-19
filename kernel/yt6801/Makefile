include $(TOPDIR)/rules.mk

PKG_NAME:=yt6801
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/srdgame/yt6801.git
PKG_SOURCE_DATE:=2024-10-26
PKG_SOURCE_VERSION:=main
PKG_MIRROR_HASH:=skip

PKG_BUILD_PARALLEL:=1
PKG_LICENSE:=GPLv2
PKG_MAINTAINER:=Dirk Chang <dirk@kooiot.com>

include $(INCLUDE_DIR)/kernel.mk
include $(INCLUDE_DIR)/package.mk

define KernelPackage/yt6801
  SUBMENU:=Network Devices
  TITLE:=Motorcomm YT6801 PCI Gigabit Ethernet driver
  DEPENDS:=@PCI_SUPPORT +kmod-libphy
  FILES:=$(PKG_BUILD_DIR)/src/yt6801.ko
  AUTOLOAD:=$(call AutoProbe,yt6801)
  PROVIDES:=kmod-yt6801
endef

define Build/Compile
	+$(KERNEL_MAKE) $(PKG_JOBS) \
		M="$(PKG_BUILD_DIR)/src" \
		modules
endef

$(eval $(call KernelPackage,yt6801))
