#
# Copyright (C) 2026 KooIoT.com
#

include $(TOPDIR)/rules.mk

PKG_NAME:=memtester
PKG_VERSION:=4.7.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://pyropus.ca/software/memtester/old-versions/
PKG_HASH:=e427de663f7bd22d1ebee8af12506a852c010bd4fcbca1e0e6b02972d298b5bb

include $(INCLUDE_DIR)/package.mk

define Package/memtester
  SECTION:=kooiot
  CATEGORY:=KooIoT
  SUBMENU:=Utilities
  TITLE:=Userspace utility for testing the memory subsystem for faults
  URL:=http://pyropus.ca/software/memtester/
endef

define Package/memtester/description
  A userspace utility for testing the memory subsystem for faults.
endef

define Build/Configure
	#$(SED) 's/cc -O2/$(TARGET_CC) $(TARGET_CFLAGS)/g' $(PKG_BUILD_DIR)/conf-cc
	#$(SED) "s/cc/$(TARGET_CC)/g" $(PKG_BUILD_DIR)/conf-ld
	$(SED) 's|^cc -O2|$(TARGET_CC) $(TARGET_CFLAGS)|' $(PKG_BUILD_DIR)/conf-cc
	echo '$(TARGET_CC)' > $(PKG_BUILD_DIR)/conf-ld
endef

define Package/memtester/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/memtester $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,memtester))
