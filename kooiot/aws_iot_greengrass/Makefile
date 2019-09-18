#
# Copyright (C) 2019 Dirk Chang
#
#

include $(TOPDIR)/rules.mk

PKG_NAME:=aws_iot_greengrass
PKG_VERSION:=0.1
PKG_RELEASE:=1
PKG_LICNESE:=MIT

include $(INCLUDE_DIR)/package.mk

define Package/aws_iot_greengrass
  SECTION:=kooiot
  CATEGORY:=KooIoT
  TITLE:=AWS IOT GreenGrass necessery kernel options selection
  DEPENDS:=+@KERNEL_NAMESPACES +@KERNEL_UTS_NS +@KERNEL_IPC_NS +@KERNEL_PID_NS +@KERNEL_USER_NS +@KERNEL_SECCOMP +@KERNEL_POSIX_MQUEUE +@KERNEL_SECCOMP_FILTER @KERNEL_KEYS +@KERNEL_MEMCG +@KERNEL_CGROUP_DEVICE +@KERNEL_CGROUPS +@KERNEL_OVERLAY_FS +lxc +@LXC_KERNEL_OPTIONS +@KERNEL_LXC_MISC
  MAINTAINER:=Dirk Chang <dirk@kooiot.com>
endef

define Package/aws_iot_greengrass/description
  AWS IOT GreenGrass necessery kernel options selection
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/aws_iot_greengrass/install
	$(CP) ./files/* $(1)
endef

$(eval $(call BuildPackage,aws_iot_greengrass))
