include $(TOPDIR)/rules.mk

PKG_NAME:=robot
# PKG_RELEASE:=$(AUTORELEASE)
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL=https://github.com/kooiot/robot
PKG_SOURCE_DATE:=2022-05-12
PKG_SOURCE_VERSION:=3965da39dd0999ae45ccd63f69af8dabe0c26818
PKG_MIRROR_HASH:=ae104a5530d1442b6d7c881cf8304f9cd381d75e9ab2422085c2701d0551dcc0

PKG_MAINTAINER:=Dirk Chang <dirk@kooiot.com>
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=

PKG_BUILD_DEPENDS:=golang/host
PKG_BUILD_PARALLEL:=1
PKG_USE_MIPS16:=0

GO_PKG:=github.com/kooiot/robot
GO_PKG_BUILD_PKG:=github.com/kooiot/robot/cmd/...

include $(INCLUDE_DIR)/package.mk
include ../../golang.mk

define Package/robot/install
	$(call GoPackage/Package/Install/Bin,$(PKG_INSTALL_DIR))

	$(INSTALL_DIR) $(1)/usr/bin/
	# $(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/$(2) $(1)/usr/bin/
	$(INSTALL_BIN) $(GO_PKG_BUILD_BIN_DIR)/$(2) $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc/robot/$(2)/
	$(CP) $(PKG_BUILD_DIR)/conf/$(2)/* $(1)/etc/robot/$(2)/
	$(INSTALL_DIR) $(1)/etc/init.d/
	$(INSTALL_BIN) ./files/$(2).init $(1)/etc/init.d/$(2)
endef

define Package/robot/template
  define Package/$(1)
    SECTION:=kooiot
    CATEGORY:=KooIoT
    SUBMENU:=Utilities
    TITLE:=$(1) - robot for executing tasks $(2)
    URL:=https://github.com/kooiot/robot
    DEPENDS:=$(GO_ARCH_DEPENDS)
  endef

  define Package/$(1)/description
    For executing tasks in target device
  endef

  define Package/$(1)/conffiles
	/etc/config/$(1)
  endef

  define Package/$(1)/install
    $(call Package/robot/install,$$(1),$(1))
  endef
endef

$(eval $(call Package/robot/template,robot-client,client))
$(eval $(call Package/robot/template,robot-pong,pong))
$(eval $(call Package/robot/template,robot-server,server))
$(eval $(call BuildPackage,robot-client))
$(eval $(call BuildPackage,robot-pong))
$(eval $(call BuildPackage,robot-server))
