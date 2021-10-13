#
# Copyright (C) 2021 Dirk Chang
#
#

include $(TOPDIR)/rules.mk

PKG_NAME:=sdlnrj-xfrm
PKG_VERSION:=0.1
PKG_RELEASE:=1
PKG_LICNESE:=MIT

include $(INCLUDE_DIR)/package.mk

define Package/sdlnrj-xfrm
  SECTION:=kooiot
  CATEGORY:=KooIoT
  TITLE:=ShanDong LuNeng Software necessery kernel options selection
  DEPENDS:=+@KERNEL_CRYPTO_CBC \
		   +@KERNEL_CRYPTO_HMAC \
		   +@KERNEL_CRYPTO_MD5 \
		   +@KERNEL_CRYPTO_SHA1 \
		   +@KERNEL_CRYPTO_SHA256 \
		   +@KERNEL_CRYPTO_SHA512 \
		   +@KERNEL_CRYPTO_DES \
		   +@KERNEL_CRYPTO_AES \
		   +@KERNEL_CRYPTO_NULL \
		   +@KERNEL_INET_AH \
		   +@KERNEL_INET_ESP \
		   +@KERNEL_INET_XFRM_TUNNEL \
		   +@KERNEL_XFRM \
		   +@KERNEL_XFRM_ALGO \
		   +@KERNEL_XFRM_USER \
		   +@KERNEL_XFRM_SUB_POLICY \
		   +@KERNEL_XFRM_MIGRATE \
		   +@KERNEL_XFRM_STATISTICS \
		   +@KERNEL_NET_KEY \
		   +@KERNEL_XFRM_MODE_TRANSPORT \
		   +@KERNEL_XFRM_MODE_TUNNEL \
		   +@KERNEL_XFRM_MODE_BEET \
		   +@KERNEL_NETFILTER \
		   +@KERNEL_TUN \
		   +xfrm
  MAINTAINER:=Dirk Chang <dirk@kooiot.com>
endef

define Package/sdlnrj-xfrm/description
  ShanDong LuNeng Software necessery kernel options selection
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/sdlnrj-xfrm/install
	$(CP) ./files/* $(1)
endef

$(eval $(call BuildPackage,sdlnrj-xfrm))
