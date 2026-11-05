#
# Copyright (C) 2020 Dirk Chang
#
#
include $(TOPDIR)/rules.mk

PKG_NAME:=uboot-upgrader
PKG_VERSION:=2026.11.05
PKG_RELEASE:=2
PKG_LICENSE:=MIT

include $(INCLUDE_DIR)/package.mk

define Build/Configure
endef

define Build/Compile
endef

define UBootUpgrader
# PKG_BUILD_DEPENDS:=u-boot-$(3)
define Package/uboot-upgrader-$(1)
  SECTION:=kooiot
  CATEGORY:=KooIoT
  SUBMENU:=Utilities
  TITLE:=Auto upgrade uboot for $(1)
  DEPENDS:=@TARGET_$(2)_DEVICE_$(1)
  MAINTAINER:=Dirk Chang <dirk@kooiot.com>
  URL:=http://kooiot.com
endef

define Package/uboot-upgrader-$(1)/description
	Auto upgrade uboot for $(1)
endef

define Package/uboot-upgrader-$(1)/install
	$(INSTALL_DIR) $$(1)/usr/share/uboot
	$(INSTALL_BIN) $(STAGING_DIR_IMAGE)/$(1)-u-boot-with-spl.bin $$(1)/usr/share/uboot/
	date -u -r $(STAGING_DIR_IMAGE)/$(1)-u-boot-with-spl.bin '+%Y-%m-%d %H:%M:%S UTC' > $$(1)/usr/share/uboot/version
endef

define Package/uboot-upgrader-$(1)/postinst
#!/bin/sh
[ -n "$${IPKG_INSTROOT}" ] && exit 0

[ -x /sbin/uboot_update ] && {
	printf 'y\n' |	uboot_update /usr/share/uboot/$(1)-u-boot-with-spl.bin
	exit 0
}
[ -x /sbin/update_uboot ] && {
	printf 'y\n' | update_uboot /usr/share/uboot/$(1)-u-boot-with-spl.bin
	exit 0
}

exit 1
endef

$$(eval $$(call BuildPackage,uboot-upgrader-$(1)))
endef

$(eval $(call UBootUpgrader,kooiot_tlink-k2x,sunxi_cortexa7,tlink_k2x))
$(eval $(call UBootUpgrader,kooiot_tlink-k4a,sunxi_cortexa7,tlink_k4a))
$(eval $(call UBootUpgrader,kooiot_tlink-k4g,sunxi_cortexa7,tlink_k4g))
