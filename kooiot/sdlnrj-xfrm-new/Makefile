#
# Copyright (C) 2021-2023 Dirk Chang
#
#

include $(TOPDIR)/rules.mk

PKG_NAME:=sdlnrj-xfrm
PKG_VERSION:=0.2
PKG_RELEASE:=2
PKG_LICNESE:=MIT

include $(INCLUDE_DIR)/package.mk

define Package/sdlnrj-xfrm
  SECTION:=kooiot
  CATEGORY:=KooIoT
  TITLE:=ShanDong LuNeng Software necessery kernel options selection
  DEPENDS:=+kmod-ipsec \
		   +kmod-crypto-sha256 \
		   +kmod-crypto-sha512 \
		   +kmod-tun \
		   +@KERNEL_XFRM_SUB_POLICY \
		   +@KERNEL_XFRM_MIGRATE \
		   +@KERNEL_XFRM_STATISTICS \
		   +@KERNEL_INET_XFRM_MODE_TRANSPORT \
		   +@KERNEL_INET_XFRM_MODE_TUNNEL \
		   +@KERNEL_INET_XFRM_MODE_BEET \
		   +xfrm \
		   +ip-full
  MAINTAINER:=Dirk Chang <dirk@kooiot.com>
endef

define Package/sdlnrj-xfrm/description
  ShanDong LuNeng Software necessery kernel options selection
endef

define Build/Compile
endef

define Package/sdlnrj-xfrm/install
	$(CP) ./files/* $(1)
endef

$(eval $(call BuildPackage,sdlnrj-xfrm))
