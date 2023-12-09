#
# Copyright (C) 2006-2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=openssl-v1
PKG_BASE:=1.1.1
PKG_BUGFIX:=w
PKG_VERSION:=$(PKG_BASE)$(PKG_BUGFIX)
PKG_RELEASE:=1
PKG_USE_MIPS16:=0

PKG_BUILD_PARALLEL:=1

PKG_SOURCE:=openssl-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:= \
	http://www.openssl.org/source/ \
	http://www.openssl.org/source/old/$(PKG_BASE)/ \
	http://ftp.fi.muni.cz/pub/openssl/source/ \
	http://ftp.fi.muni.cz/pub/openssl/source/old/$(PKG_BASE)/ \
	ftp://ftp.pca.dfn.de/pub/tools/net/openssl/source/ \
	ftp://ftp.pca.dfn.de/pub/tools/net/openssl/source/old/$(PKG_BASE)/

PKG_HASH:=cf3098950cb4d853ad95c0841f1f9c6d3dc102dccfcacd521d93925208b76ac8

PKG_LICENSE:=OpenSSL
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=Eneas U de Queiroz <cotequeiroz@gmail.com>
PKG_CPE_ID:=cpe:/a:openssl:openssl

include $(INCLUDE_DIR)/package.mk

ifneq ($(CONFIG_CCACHE),)
HOSTCC=$(HOSTCC_NOCACHE)
HOSTCXX=$(HOSTCXX_NOCACHE)
endif

define Package/openssl-v1/Default
  TITLE:=Open source SSL toolkit(V1.1.1)
  URL:=http://www.openssl.org/
  SECTION:=libs
  CATEGORY:=Libraries
endef

define Package/openssl-v1/Default/description
The OpenSSL Project is a collaborative effort to develop a robust,
commercial-grade, full-featured, and Open Source toolkit implementing the
Transport Layer Security (TLS) protocol as well as a full-strength
general-purpose cryptography library.
endef

define Package/libopenssl-v1
$(call Package/openssl-v1/Default)
  SUBMENU:=SSL
  TITLE+= (libraries)
  ABI_VERSION:=1.1
  MENU:=1
endef

define Package/libopenssl-v1/description
$(call Package/openssl-v1/Default/description)
This package contains the OpenSSL shared libraries, needed by other programs.
endef

OPENSSL_V1_OPTIONS:= shared

OPENSSL_V1_OPTIONS += no-blake2

OPENSSL_V1_OPTIONS += no-async

OPENSSL_V1_OPTIONS += no-ec2m

OPENSSL_V1_OPTIONS += no-aria

OPENSSL_V1_OPTIONS += no-camellia

OPENSSL_V1_OPTIONS += no-idea

OPENSSL_V1_OPTIONS += no-seed

OPENSSL_V1_OPTIONS += no-mdc2

OPENSSL_V1_OPTIONS += no-whirlpool

OPENSSL_V1_OPTIONS += no-rfc3779

OPENSSL_V1_OPTIONS += -DOPENSSL_V1_SMALL_FOOTPRINT

OPENSSL_V1_OPTIONS += disable-dynamic-engine
OPENSSL_V1_OPTIONS += no-afalgeng
OPENSSL_V1_OPTIONS += no-hw-padlock

OPENSSL_V1_OPTIONS += no-dtls

OPENSSL_V1_OPTIONS += no-comp

ifdef CONFIG_i386
    OPENSSL_V1_OPTIONS += no-sse2
endif

OPENSSL_V1_TARGET:=linux-$(call qstrip,$(CONFIG_ARCH))-openwrt

STAMP_CONFIGURED := $(STAMP_CONFIGURED)_$(shell echo $(OPENSSL_V1_OPTIONS) | $(MKHASH) md5)

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	tar -C $(PKG_BUILD_DIR) -xzf "$(DL_DIR)/$(PKG_SOURCE)" --strip-components 1

	$(Build/Patch)
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR); \
		./Configure $(OPENSSL_V1_TARGET) \
			--prefix=/usr \
			--libdir=lib \
			--openssldir=/etc/ssl \
			--cross-compile-prefix="$(TARGET_CROSS)" \
			$(TARGET_CFLAGS) \
			$(TARGET_CPPFLAGS) \
			$(TARGET_LDFLAGS) \
			$(OPENSSL_V1_OPTIONS) && \
		{ [ -f $(STAMP_CONFIGURED) ] || make clean; } \
	)
endef

TARGET_CFLAGS += $(FPIC) -ffunction-sections -fdata-sections
TARGET_LDFLAGS += -Wl,--gc-sections

define Build/Compile
	+$(MAKE) $(PKG_JOBS) -C $(PKG_BUILD_DIR) \
		CC="$(TARGET_CC)" \
		SOURCE_DATE_EPOCH=$(SOURCE_DATE_EPOCH) \
		OPENWRT_OPTIMIZATION_FLAGS="$(TARGET_CFLAGS)" \
		$(OPENSSL_V1_MAKEFLAGS) \
		all
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CC="$(TARGET_CC)" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		$(OPENSSL_V1_MAKEFLAGS) \
		install_sw install_ssldirs
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/local/openssl_v1/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/openssl $(1)/usr/local/openssl_v1/include/
	$(INSTALL_DIR) $(1)/usr/local/openssl_v1/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib{crypto,ssl}.{a,so*} $(1)/usr/local/openssl_v1/lib
endef

define Package/libopenssl-v1/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/lib/libcrypto.so.* $(1)/usr/lib/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/lib/libssl.so.* $(1)/usr//lib/
endef

$(eval $(call BuildPackage,libopenssl-v1))
