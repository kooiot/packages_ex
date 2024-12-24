include $(TOPDIR)/rules.mk

PKG_NAME:=symlink-projects
PKG_VERSION:=2023.06.12
PKG_RELEASE:=2

PKG_MAINTAINER:=Dirk Chang <dirk@kooiot.com>
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=

include $(INCLUDE_DIR)/package.mk

define Build/Configure
endef

define Build/Compile
endef

define Package/symlink-projects/install
	$(INSTALL_DIR) $(1)/mnt/sympad_pkg/
	$(CP) ./files/$(2)/* $(1)/mnt/sympad_pkg/
endef

define Package/symlink-projects/template
  define Package/symlink-projects-$(1)
    SECTION:=kooiot
    CATEGORY:=KooIoT
    SUBMENU:=SymLink Projects
    TITLE:=SymLink projects for ThingsLink $(1)
    DEPENDS:=@symlink-app +libstdcpp
  endef

  define Package/symlink-projects-$(1)/description
    Symlink default projects for ThingsLink $(1)
  endef

  define Package/symlink-projects-$(1)/install
    $(call Package/symlink-projects/install,$$(1),$(1))
  endef
endef

$(eval $(call Package/symlink-projects/template,symgrid-com))
$(eval $(call Package/symlink-projects/template,symid-fl-top))
$(eval $(call Package/symlink-projects/template,tlink-k2x))
$(eval $(call Package/symlink-projects/template,tlink-r4x))
$(eval $(call BuildPackage,symlink-projects-symgrid-com))
$(eval $(call BuildPackage,symlink-projects-symid-fl-top))
$(eval $(call BuildPackage,symlink-projects-tlink-k2x))
$(eval $(call BuildPackage,symlink-projects-tlink-r4x))
