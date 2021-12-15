#
# Copyright (C) 2020 Dirk Chang
#
#

include $(TOPDIR)/rules.mk

PKG_NAME:=auto-upgrader
PKG_VERSION:=0.3
PKG_RELEASE:=1
PKG_LICNESE:=MIT

include $(INCLUDE_DIR)/package.mk

define Package/auto-upgrader
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Auto upgrade system detected by condition
  MAINTAINER:=Dirk Chang <dirk@kooiot.com>
  URL:=http://kooiot.com
endef

define Package/auto-upgrader/description
  Auto upgrade system detected by condition
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/auto-upgrader/install
	$(CP) ./files/* $(1)
endef

define Package/auto-upgrader/preinst
#!/bin/sh
[ -n "$${IPKG_INSTROOT}" ] && exit 0	# if run within buildroot exit

# stop service if PKG_UPGRADE
[ "$${PKG_UPGRADE}" = "1" ] && /etc/init.d/auto_upgrader stop >/dev/null 2>&1

exit 0	# suppress errors from stop command
endef

define Package/auto-upgrader/postinst
#!/bin/sh
[ -n "$${IPKG_INSTROOT}" ] && exit 0	# if run within buildroot exit

# Start service
/etc/init.d/auto_upgrader enable && /etc/init.d/auto_upgrader start >/dev/null 2>&1

exit 0
endef

define Package/auto-upgrader/prerm
#!/bin/sh
[ -n "$${IPKG_INSTROOT}" ] && exit 0	# if run within buildroot exit

/etc/init.d/auto_upgrader stop
/etc/init.d/auto_upgrader disable

exit 0
endef

$(eval $(call BuildPackage,auto-upgrader))
