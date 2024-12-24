include $(TOPDIR)/rules.mk

PKG_NAME:=freeioe-hosts
PKG_VERSION:=2023.06.15
PKG_RELEASE:=1

PKG_MAINTAINER:=Dirk Chang <dirk@kooiot.com>
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=

include $(INCLUDE_DIR)/package.mk

define Build/Configure
endef

define Build/Compile
endef

define Package/freeioe-hosts/install
	$(INSTALL_DIR) $(1)/etc
	$(CP) ./files/$(2).conf $(1)/etc/freeioe.conf
endef

define Package/freeioe-hosts/template
  define Package/freeioe-hosts-$(1)
    SECTION:=kooiot
    CATEGORY:=KooIoT
    SUBMENU:=FreeIOE Cloud Hosts
    TITLE:=$(1) Cloud for FreeIOE
    DEPENDS:=@freeioe
  endef

  define Package/freeioe-hosts-$(1)/description
    Symlink default projects for ThingsLink $(1)
  endef

  define Package/freeioe-hosts-$(1)/install
    $(call Package/freeioe-hosts/install,$$(1),$(1))
  endef
endef

$(eval $(call Package/freeioe-hosts/template,kooiot-cn))
$(eval $(call Package/freeioe-hosts/template,ydncloud-com))
$(eval $(call BuildPackage,freeioe-hosts-kooiot-cn))
$(eval $(call BuildPackage,freeioe-hosts-ydncloud-com))
