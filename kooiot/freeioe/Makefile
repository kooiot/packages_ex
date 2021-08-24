#
# Copyright (C) 2018-2021 KooIoT.com
#
# This is free software, licensed under MIT
# See /LICENSE for more information.
# 

include $(TOPDIR)/rules.mk

PKG_NAME:=freeioe
PKG_VERSION:=1480
PKG_RELEASE:=1

PKG_ARCH=$(ARCH_PACKAGES)
PKG_MAINTAINER:=Dirk Chang <dirk@kooiot.com>

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_MD5SUM:=9f5ddeb0bbd4391682c51c6e18c54596

include $(INCLUDE_DIR)/package.mk

FREEIOE_URL:=http://openwrt.kooiot.com/download/freeioe/

define Download/freeioe
	FILE:=$(PKG_SOURCE)
	URL:=$(FREEIOE_URL)
	URL_FILE:=$(PKG_VERSION).tar.gz
	HASH:=$(PKG_MD5SUM)
endef
$(eval $(call Download,freeioe))

define Package/freeioe
  SECTION:=kooiot
  CATEGORY:=KooIoT
  TITLE:=FreeIOE
  URL:=https://github.com/freeioe/freeioe
  DEPENDS:=+skynet +process-monitor
endef

define Package/freeioe/description
	FreeIOE is platform for internet of everythings running on embedded machine, built on top of Skynet.
endef

define Package/freeioe/config
source "$(SOURCE)/Config.in"
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)/src
	tar -C $(PKG_BUILD_DIR)/src -xzvf "$(DL_DIR)/$(PKG_SOURCE)"
	rm -rf $(PKG_BUILD_DIR)/src/linux

	mkdir -p $(PKG_BUILD_DIR)/src/__plat_files/$(PKG_ARCH)
	cp -R $(PKG_BUILD_DIR)/src/openwrt/init.d $(PKG_BUILD_DIR)/src/__plat_files/init.d
	rm -rf $(PKG_BUILD_DIR)/src/openwrt
	mv $(PKG_BUILD_DIR)/src/__plat_files $(PKG_BUILD_DIR)/src/openwrt
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/freeioe/install
	$(INSTALL_DIR) $(1)/usr/ioe/freeioe
	$(CP) $(PKG_BUILD_DIR)/src/* $(1)/usr/ioe/freeioe/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(LN) ../../usr/ioe/freeioe/openwrt/init.d/skynet $(1)/etc/init.d/skynet

	$(INSTALL_DIR) $(1)/usr/ioe/ipt
	$(CP) $(DL_DIR)/$(PKG_SOURCE) $(1)/usr/ioe/ipt/freeioe.tar.gz

	echo '[freeioe]' > $(PKG_BUILD_DIR)/freeioe.conf
	echo 'IOE_CLOUD_HOST='$(if $(CONFIG_FREEIOE_CLOUD_HOST_ADDR),$(CONFIG_FREEIOE_CLOUD_HOST_ADDR),"ioe.thingsroot.com") >> $(PKG_BUILD_DIR)/freeioe.conf
	echo 'IOE_PKG_URL='$(if $(CONFIG_FREEIOE_CLOUD_PKG_URL),$(CONFIG_FREEIOE_CLOUD_PKG_URL),"ioe.thingsroot.com") >> $(PKG_BUILD_DIR)/freeioe.conf
	echo 'IOE_PKG_VERSION='$(if $(CONFIG_FREEIOE_CLOUD_PKG_VER),$(CONFIG_FREEIOE_CLOUD_PKG_VER),"1") >> $(PKG_BUILD_DIR)/freeioe.conf

	$(if $(CONFIG_FREEIOE_CLOUD_HOST),$(CP) $(PKG_BUILD_DIR)/freeioe.conf $(1)/etc/)

ifeq ($(PKG_ARCH),x86_64)
	$(INSTALL_DIR) $(1)/etc/profile.d
	$(CP) ./files/echo_sn.sh $(1)/etc/profile.d/echo_sn.sh
endif
endef

define Package/freeioe/preinst
#!/bin/sh
[ -n "$${IPKG_INSTROOT}" ] && exit 0	# if run within buildroot exit

# stop service if PKG_UPGRADE
[ "$${PKG_UPGRADE}" = "1" ] && /etc/init.d/skynet stop >/dev/null 2>&1

exit 0	# suppress errors from stop command
endef

define Package/freeioe/postinst
#!/bin/sh
[ -n "$${IPKG_INSTROOT}" ] && exit 0	# if run within buildroot exit

# Start service
/etc/init.d/skynet enable && /etc/init.d/skynet start >/dev/null 2>&1

exit 0
endef

define Package/freeioe/prerm
#!/bin/sh
[ -n "$${IPKG_INSTROOT}" ] && exit 0	# if run within buildroot exit

/etc/init.d/skynet stop
/etc/init.d/skynet disable

exit 0
endef

$(eval $(call BuildPackage,freeioe))
