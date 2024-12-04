#
# Copyright (C) 2012-2018 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=strongswangmalg
PKG_VERSION:=5.9.14
PKG_RELEASE:=2

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/srdgame/strongswan-gmalg-merge

PKG_SOURCE_DATE:=2024-11-22
PKG_SOURCE_VERSION:=c67825602226de84544de055e1574c4af8896007
PKG_MIRROR_HASH:=skip

PKG_LICENSE:=GPL-2.0-or-later
PKG_MAINTAINER:=Dirk Chang <dirk@kooiot.com>

PKG_MOD_AVAILABLE:= \
	addrblock \
	aes \
	af-alg \
	agent \
	attr \
	attr-sql \
	bliss \
	blowfish \
	ccm \
	chapoly \
	cmac \
	constraints \
	connmark \
	coupling \
	ctr \
	curl \
	curve25519 \
	des \
	dhcp \
	dnskey \
	drbg \
	duplicheck \
	eap-dynamic \
	eap-identity \
	eap-md5 \
	eap-mschapv2 \
	eap-radius \
	eap-tls \
	farp \
	fips-prf \
	forecast \
	gcm \
	gcrypt \
	gmalg \
	gmp \
	gmpdh \
	ha \
	hmac \
	kdf \
	kernel-libipsec \
	kernel-netlink \
	ldap \
	led \
	load-tester \
	md4 \
	md5 \
	mgf1 \
	mysql \
	newhope \
	ntru \
	openssl \
	pem \
	pgp \
	pkcs1 \
	pkcs7 \
	pkcs8 \
	pkcs11 \
	pkcs12 \
	pubkey \
	random \
	rc2 \
	resolve \
	revocation \
	sha1 \
	sha2 \
	sha3 \
	smp \
	socket-default \
	socket-dynamic \
	sql \
	sqlite \
	sshkey \
	stroke \
	test-vectors \
	unity \
	uci \
	updown \
	vici \
	whitelist \
	wolfssl \
	x509 \
	xauth-eap \
	xauth-generic \
	xcbc

PKG_CONFIG_DEPENDS:= \
	CONFIG_STRONGSWANGMALG_ROUTING_TABLE \
	CONFIG_STRONGSWANGMALG_ROUTING_TABLE_PRIO \
	$(patsubst %,CONFIG_PACKAGE_strongswangmalg-mod-%,$(PKG_MOD_AVAILABLE)) \

PKG_FIXUP:=autoreconf
PKG_INSTALL:=1
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk
# strongswangmalg-mod-mysql needs iconv
include $(INCLUDE_DIR)/nls.mk

define Package/strongswangmalg/Default
  SECTION:=kooiot
  CATEGORY:=KooIoT
  SUBMENU:=VPN
  TITLE:=StrongSwanGMAlg
  URL:=http://www.strongswan.org/
endef

define Package/strongswangmalg/description/Default
 StrongSwanGMAlg is an OpenSource IPsec implementation for the Linux operating system.
endef

define Package/strongswangmalg
$(call Package/strongswangmalg/Default)
  MENU:=1
  DEPENDS:= +libpthread +ip \
	+kmod-crypto-aead \
	+kmod-crypto-authenc \
	+kmod-crypto-cbc \
	+kmod-lib-zlib-inflate \
	+kmod-lib-zlib-deflate \
	+kmod-crypto-des \
	+kmod-crypto-echainiv \
	+kmod-crypto-hmac \
	+kmod-crypto-md5 \
	+kmod-crypto-sha1 \
	+kmod-ipsec +kmod-ipsec4 +IPV6:kmod-ipsec6
endef

define Package/strongswangmalg/config
  source "$(SOURCE)/Config.in"
endef

define Package/strongswangmalg/description
$(call Package/strongswangmalg/description/Default)
 This package contains shared libraries and scripts.
endef

define Package/strongswangmalg-full
$(call Package/strongswangmalg/Default)
  TITLE+= (full)
  DEPENDS:= strongswangmalg \
	+strongswangmalg-charon \
	+strongswangmalg-charon-cmd \
	+strongswangmalg-ipsec \
	+strongswangmalg-libnttfft \
	+strongswangmalg-mod-addrblock \
	+strongswangmalg-mod-aes \
	+strongswangmalg-mod-af-alg \
	+strongswangmalg-mod-agent \
	+strongswangmalg-mod-attr \
	+strongswangmalg-mod-attr-sql \
	+strongswangmalg-mod-bliss \
	+strongswangmalg-mod-blowfish \
	+strongswangmalg-mod-ccm \
	+strongswangmalg-mod-chapoly \
	+strongswangmalg-mod-cmac \
	+strongswangmalg-mod-constraints \
	+strongswangmalg-mod-connmark \
	+strongswangmalg-mod-coupling \
	+strongswangmalg-mod-ctr \
	+strongswangmalg-mod-curl \
	+strongswangmalg-mod-curve25519 \
	+strongswangmalg-mod-des \
	+strongswangmalg-mod-dhcp \
	+strongswangmalg-mod-dnskey \
	+strongswangmalg-mod-drbg \
	+strongswangmalg-mod-duplicheck \
	+strongswangmalg-mod-eap-dynamic \
	+strongswangmalg-mod-eap-identity \
	+strongswangmalg-mod-eap-md5 \
	+strongswangmalg-mod-eap-mschapv2 \
	+strongswangmalg-mod-eap-radius \
	+strongswangmalg-mod-eap-tls \
	+strongswangmalg-mod-farp \
	+strongswangmalg-mod-fips-prf \
	+strongswangmalg-mod-forecast \
	+strongswangmalg-mod-gcm \
	+strongswangmalg-mod-gcrypt \
	+strongswangmalg-mod-gmp \
	+strongswangmalg-mod-ha \
	+strongswangmalg-mod-hmac \
	+strongswangmalg-mod-kdf \
	+strongswangmalg-mod-kernel-netlink \
	+strongswangmalg-mod-ldap \
	+strongswangmalg-mod-led \
	+strongswangmalg-mod-load-tester \
	+strongswangmalg-mod-md4 \
	+strongswangmalg-mod-md5 \
	+strongswangmalg-mod-mgf1 \
	+strongswangmalg-mod-mysql \
	+strongswangmalg-mod-newhope \
	+strongswangmalg-mod-ntru \
	+strongswangmalg-mod-openssl \
	+strongswangmalg-mod-pem \
	+strongswangmalg-mod-pgp \
	+strongswangmalg-mod-pkcs1 \
	+strongswangmalg-mod-pkcs7 \
	+strongswangmalg-mod-pkcs8 \
	+strongswangmalg-mod-pkcs11 \
	+strongswangmalg-mod-pkcs12 \
	+strongswangmalg-mod-pubkey \
	+strongswangmalg-mod-random \
	+strongswangmalg-mod-rc2 \
	+strongswangmalg-mod-resolve \
	+strongswangmalg-mod-revocation \
	+strongswangmalg-mod-sha1 \
	+strongswangmalg-mod-sha2 \
	+strongswangmalg-mod-sha3 \
	+strongswangmalg-mod-smp \
	+strongswangmalg-mod-socket-default \
	+strongswangmalg-mod-sql \
	+strongswangmalg-mod-sqlite \
	+strongswangmalg-mod-sshkey \
	+strongswangmalg-mod-stroke \
	+strongswangmalg-mod-test-vectors \
	+strongswangmalg-mod-uci \
	+strongswangmalg-mod-unity \
	+strongswangmalg-mod-updown \
	+strongswangmalg-mod-vici \
	+strongswangmalg-mod-whitelist \
	+strongswangmalg-mod-wolfssl \
	+strongswangmalg-mod-x509 \
	+strongswangmalg-mod-xauth-eap \
	+strongswangmalg-mod-xauth-generic \
	+strongswangmalg-mod-xcbc \
	+strongswangmalg-pki \
	+strongswangmalg-swanctl \
	@DEVEL
endef

define Package/strongswangmalg-full/description
$(call Package/strongswangmalg/description/Default)
 This meta-package contains dependencies for all of the strongswangmalg plugins
 except kernel-libipsec,
 socket-dynamic and which are omitted in favor of the kernel-netlink and
 socket-default plugins.
endef


define Package/strongswangmalg-default
$(call Package/strongswangmalg/Default)
  TITLE+= (default)
  DEPENDS:= strongswangmalg \
	+strongswangmalg-charon \
	+strongswangmalg-mod-aes \
	+strongswangmalg-mod-attr \
	+strongswangmalg-mod-connmark \
	+strongswangmalg-mod-constraints \
	+strongswangmalg-mod-des \
	+strongswangmalg-mod-dnskey \
	+strongswangmalg-mod-fips-prf \
	+strongswangmalg-mod-gmp \
	+strongswangmalg-mod-hmac \
	@(PACKAGE_strongswangmalg-mod-kdf||PACKAGE_strongswangmalg-mod-openssl||PACKAGE_strongswangmalg-mod-wolfssl) \
	+strongswangmalg-mod-kernel-netlink \
	+strongswangmalg-mod-md5 \
	+strongswangmalg-mod-mgf1 \
	+strongswangmalg-mod-pem \
	+strongswangmalg-mod-pgp \
	+strongswangmalg-mod-pkcs1 \
	+strongswangmalg-mod-pubkey \
	+strongswangmalg-mod-random \
	+strongswangmalg-mod-rc2 \
	+strongswangmalg-mod-resolve \
	+strongswangmalg-mod-revocation \
	+strongswangmalg-mod-sha1 \
	+strongswangmalg-mod-sha2 \
	+strongswangmalg-mod-socket-default \
	+strongswangmalg-mod-sshkey \
	+strongswangmalg-mod-updown \
	+strongswangmalg-mod-x509 \
	+strongswangmalg-mod-xauth-generic \
	+strongswangmalg-mod-xcbc \
	+strongswangmalg-swanctl
endef

define Package/strongswangmalg-default/description
$(call Package/strongswangmalg/description/Default)
 This meta-package contains only dependencies to match upstream defaults.
endef


define Package/strongswangmalg-isakmp
$(call Package/strongswangmalg/Default)
  TITLE+= (isakmp)
  DEPENDS:= strongswangmalg \
	+strongswangmalg-charon \
	+strongswangmalg-ipsec \
	+strongswangmalg-mod-aes \
	+strongswangmalg-mod-des \
	+strongswangmalg-mod-gmpdh \
	+strongswangmalg-mod-hmac \
	@(PACKAGE_strongswangmalg-mod-kdf||PACKAGE_strongswangmalg-mod-openssl||PACKAGE_strongswangmalg-mod-wolfssl) \
	+strongswangmalg-mod-kernel-netlink \
	+strongswangmalg-mod-md5 \
	+strongswangmalg-mod-mgf1 \
	+strongswangmalg-mod-pubkey \
	+strongswangmalg-mod-random \
	+strongswangmalg-mod-sha1 \
	+strongswangmalg-mod-socket-default \
	+strongswangmalg-mod-stroke \
	+strongswangmalg-mod-uci \
	+strongswangmalg-mod-updown
endef

define Package/strongswangmalg-isakmp/description
$(call Package/strongswangmalg/description/Default)
 This meta-package contains only dependencies to establish  ISAKMP /
 IKE PSK connections, dropping other capabilities in favor of small size
 Can fit most routers even with 4Mb flash (after removing IPv6 support).
endef


define Package/strongswangmalg-minimal
$(call Package/strongswangmalg/Default)
  TITLE+= (minimal)
  DEPENDS:= strongswangmalg \
	+strongswangmalg-charon \
	+strongswangmalg-mod-aes \
	+strongswangmalg-mod-gmp \
	+strongswangmalg-mod-hmac \
	@(PACKAGE_strongswangmalg-mod-kdf||PACKAGE_strongswangmalg-mod-openssl||PACKAGE_strongswangmalg-mod-wolfssl) \
	+strongswangmalg-mod-kernel-netlink \
	+strongswangmalg-mod-mgf1 \
	+strongswangmalg-mod-pubkey \
	+strongswangmalg-mod-random \
	+strongswangmalg-mod-sha1 \
	+strongswangmalg-mod-socket-default \
	+strongswangmalg-mod-stroke \
	+strongswangmalg-mod-updown \
	+strongswangmalg-mod-x509 \
	+strongswangmalg-mod-xcbc
endef

define Package/strongswangmalg-minimal/description
$(call Package/strongswangmalg/description/Default)
 This meta-package contains only dependencies for a minimal IKEv2 setup.
endef

define Package/strongswangmalg-charon
$(call Package/strongswangmalg/Default)
  TITLE+= IKEv1/IKEv2 keying daemon
  DEPENDS:= strongswangmalg
endef

define Package/strongswangmalg-charon/description
$(call Package/strongswangmalg/description/Default)
 This package contains charon, an IKEv2 keying daemon.
endef

define Package/strongswangmalg-charon-cmd
$(call Package/strongswangmalg/Default)
  TITLE+= charon-cmd utility
  DEPENDS:= strongswangmalg +strongswangmalg-charon
endef

define Package/strongswangmalg-charon-cmd/description
$(call Package/strongswangmalg/description/Default)
 This package contains the charon-cmd utility.
endef

define Package/strongswangmalg-ipsec
$(call Package/strongswangmalg/Default)
  TITLE+= utilities
  DEPENDS:= strongswangmalg
endef

define Package/strongswangmalg-ipsec/description
$(call Package/strongswangmalg/description/Default)
 This package contains the ipsec utility.
endef

define Package/strongswangmalg-libnttfft
$(call Package/strongswangmalg/Default)
  TITLE+= nttfft library
  DEPENDS:= strongswangmalg
endef

define Package/strongswangmalg-libnttfft/description
$(call Package/strongswangmalg/description/Default)
 This package contains the Number Theoretic Transforms library.
endef

define Package/strongswangmalg-pki
$(call Package/strongswangmalg/Default)
  TITLE+= PKI tool
  DEPENDS:= strongswangmalg strongswangmalg-libtls
endef

define Package/strongswangmalg-pki/description
$(call Package/strongswangmalg/description/Default)
 This package contains the pki tool.
endef

define Package/strongswangmalg-swanctl
$(call Package/strongswangmalg/Default)
  TITLE+= swanctl utility
  DEPENDS:= strongswangmalg +strongswangmalg-mod-vici
endef

define Package/strongswangmalg-swanctl/description
$(call Package/strongswangmalg/description/Default)
 This package contains the swanctl utility.
endef

define Package/strongswangmalg-gencerts
$(call Package/strongswangmalg/Default)
  TITLE+= X.509 certificate generation utility
  DEPENDS:= strongswangmalg +strongswangmalg-pki bash
endef

define Package/strongswangmalg-gencerts/description
$(call Package/strongswangmalg/description/Default)
 This package contains the X.509 certificate generation utility.
endef

define Package/strongswangmalg-libtls
$(call Package/strongswangmalg/Default)
  TITLE+= libtls
  DEPENDS:= strongswangmalg
endef

define Package/strongswangmalg-libtls/description
$(call Package/strongswangmalg/description/Default)
 This package contains libtls for strongSwan plugins eap-tls, eap-ttls,
 eap-peap, tnc-tnccs
endef

define BuildPlugin
  define Package/strongswangmalg-mod-$(1)
    $$(call Package/strongswangmalg/Default)
    TITLE:= StrongSwanGMAlg $(2) plugin
    DEPENDS:= strongswangmalg $(3)
  endef

  define Package/strongswangmalg-mod-$(1)/install
	$(INSTALL_DIR) $$(1)/etc/strongswan.d/charon
	if [ -f $(PKG_INSTALL_DIR)/etc/strongswan.d/charon/$(1).conf ]; then \
		$(INSTALL_DATA) $(PKG_INSTALL_DIR)/etc/strongswan.d/charon/$(1).conf $$(1)/etc/strongswan.d/charon/; fi
	$(INSTALL_DIR) $$(1)/usr/lib/ipsec/plugins
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/ipsec/plugins/libstrongswan-$(1).so \
		$$(1)/usr/lib/ipsec/plugins/
	$(call PluginGMALG/$(1)/install,$$(1))
  endef

  $$(eval $$(call BuildPackage,strongswangmalg-mod-$(1)))
endef

CONFIGURE_ARGS+= \
	--disable-scripts \
	--disable-static \
	--disable-fast \
	--enable-nonce \
	--enable-mgf1 \
	--enable-mediation \
	--with-systemdsystemunitdir=no \
	$(if $(CONFIG_PACKAGE_strongswangmalg-charon-cmd),--enable-cmd,--disable-cmd) \
	$(if $(CONFIG_PACKAGE_strongswangmalg-pki),--enable-pki,--disable-pki) \
	--with-random-device=/dev/random \
	--with-urandom-device=/dev/urandom \
	--with-routing-table="$(call qstrip,$(CONFIG_STRONGSWANGMALG_ROUTING_TABLE))" \
	--with-routing-table-prio="$(call qstrip,$(CONFIG_STRONGSWANGMALG_ROUTING_TABLE_PRIO))" \
	$(foreach m,$(PKG_MOD_AVAILABLE), \
	  $(if $(CONFIG_PACKAGE_strongswangmalg-mod-$(m)),--enable-$(m),--disable-$(m)) \
	) \
	ac_cv_search___atomic_load=no

define Package/strongswangmalg/conffiles
/etc/strongswan.conf
/etc/strongswan.d/
endef

define Package/strongswangmalg/install
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_CONF) $(PKG_INSTALL_DIR)/etc/strongswan.conf $(1)/etc/
	echo -e "\ninclude /var/ipsec/strongswan.conf" >> $(1)/etc/strongswan.conf
	$(INSTALL_DIR) $(1)/etc/strongswan.d/charon
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/etc/strongswan.d/charon/nonce.conf $(1)/etc/strongswan.d/charon/
	$(INSTALL_DIR) $(1)/usr/lib/ipsec/plugins
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/ipsec/libstrongswan.so.* $(1)/usr/lib/ipsec/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/ipsec/plugins/libstrongswan-nonce.so $(1)/usr/lib/ipsec/plugins/
endef

define Package/strongswangmalg-default/install
	true
endef

define Package/strongswangmalg-full/install
	true
endef

define Package/strongswangmalg-isakmp/install
	true
endef

define Package/strongswangmalg-minimal/install
	true
endef

define Package/strongswangmalg-charon/install
	$(INSTALL_DIR) $(1)/etc/strongswan.d
	$(CP) $(PKG_INSTALL_DIR)/etc/strongswan.d/charon.conf $(1)/etc/strongswan.d
	$(CP) $(PKG_INSTALL_DIR)/etc/strongswan.d/charon-logging.conf $(1)/etc/strongswan.d
	$(INSTALL_DIR) $(1)/usr/lib/ipsec
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/ipsec/charon $(1)/usr/lib/ipsec/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/ipsec/libcharon.so.* $(1)/usr/lib/ipsec/
endef

define Package/strongswangmalg-charon-cmd/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/charon-cmd $(1)/usr/sbin/
endef

define Package/strongswangmalg-ipsec/conffiles
/etc/ipsec.d/
/etc/ipsec.conf
/etc/ipsec.secrets
/etc/ipsec.user
endef

define Package/strongswangmalg-ipsec/install
	$(INSTALL_DIR) $(1)/etc/ $(1)/usr/sbin
	$(INSTALL_CONF) $(PKG_INSTALL_DIR)/etc/ipsec.conf $(1)/etc/
	echo -e "\ninclude /var/ipsec/ipsec.conf" >> $(1)/etc/ipsec.conf
	$(INSTALL_CONF) ./files/ipsec.secrets $(1)/etc/
	echo -e "\ninclude /var/ipsec/ipsec.secrets" >> $(1)/etc/ipsec.secrets
	$(INSTALL_CONF) ./files/ipsec.user $(1)/etc/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/ipsec.init $(1)/etc/init.d/ipsec
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/ipsec $(1)/usr/sbin/
endef

define Package/strongswangmalg-ipsec/postinst
#!/bin/sh

[ -z "$${IPKG_INSTROOT}" ] || exit 0

opkg list-changed-conffiles | grep -qx /etc/ipsec.conf || {
	rm -f /etc/ipsec.conf-opkg
}
endef

define Package/strongswangmalg-libnttfft/install
	$(INSTALL_DIR) $(1)/usr/lib/ipsec
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/ipsec/libnttfft.so.* $(1)/usr/lib/ipsec/
endef

define Package/strongswangmalg-pki/install
	$(INSTALL_DIR) $(1)/etc/strongswan.d
	$(CP) $(PKG_INSTALL_DIR)/etc/strongswan.d/pki.conf $(1)/etc/strongswan.d/
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/pki $(1)/usr/bin/
endef

define Package/strongswangmalg-swanctl/conffiles
/etc/config/ipsec
/etc/swanctl/
endef

define Package/strongswangmalg-swanctl/install
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_DIR) $(1)/etc/swanctl/{bliss,conf.d,ecdsa,pkcs{12,8},private,pubkey,rsa}
	$(INSTALL_DIR) $(1)/etc/swanctl/x509{,aa,ac,ca,crl,ocsp}
	$(CP) $(PKG_INSTALL_DIR)/etc/swanctl/swanctl.conf $(1)/etc/swanctl/
	echo "include /var/swanctl/swanctl.conf" >> $(1)/etc/swanctl/swanctl.conf
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/swanctl $(1)/usr/sbin/
	$(INSTALL_BIN) ./files/swanctl.init $(1)/etc/init.d/swanctl
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./files/ipsec.config $(1)/etc/config/ipsec
endef

define Package/strongswangmalg-gencerts/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) ./files/gencerts.sh $(1)/usr/bin/gencerts
endef

define Package/strongswangmalg-libtls/install
	$(INSTALL_DIR) $(1)/usr/lib/ipsec
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/ipsec/libtls.so.* $(1)/usr/lib/ipsec/
endef

define PluginGMALG/duplicheck/install
	$(INSTALL_DIR) $(1)/usr/lib/ipsec/plugins
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/ipsec/duplicheck $(1)/usr/lib/ipsec/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/ipsec/plugins/libstrongswan-duplicheck.so $(1)/usr/lib/ipsec/plugins/
endef

define PluginGMALG/eap-radius/install
	$(INSTALL_DIR) $(1)/usr/lib/ipsec/plugins
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/ipsec/libradius.so.* $(1)/usr/lib/ipsec/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/ipsec/plugins/libstrongswan-eap-radius.so $(1)/usr/lib/ipsec/plugins/
endef

define PluginGMALG/attr-sql/install
	$(INSTALL_DIR) $(1)/usr/lib/ipsec
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/ipsec/pool $(1)/usr/lib/ipsec/
endef

define PluginGMALG/stroke/install
	$(INSTALL_DIR) $(1)/etc/ipsec.d/{aacerts,acerts,cacerts,certs,crls,ocspcerts,private,reqs}

	$(INSTALL_DIR) $(1)/usr/lib/ipsec/plugins
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/ipsec/{starter,stroke} $(1)/usr/lib/ipsec/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/ipsec/plugins/libstrongswan-stroke.so $(1)/usr/lib/ipsec/plugins/
endef

define PluginGMALG/updown/install
	$(INSTALL_DIR) $(1)/usr/lib/ipsec/plugins
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/ipsec/_updown $(1)/usr/lib/ipsec/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/ipsec/plugins/libstrongswan-updown.so $(1)/usr/lib/ipsec/plugins/
	$(INSTALL_DIR) $(1)/etc/hotplug.d/ipsec
	$(CP) ./files/etc/hotplug.d/ipsec/01-user \
		$(1)/etc/hotplug.d/ipsec/01-user
endef

define PluginGMALG/vici/install
	$(INSTALL_DIR) $(1)/usr/lib/ipsec/plugins
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/ipsec/libvici.so.* $(1)/usr/lib/ipsec/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/ipsec/plugins/libstrongswan-vici.so $(1)/usr/lib/ipsec/plugins/
endef

define PluginGMALG/whitelist/install
	$(INSTALL_DIR) $(1)/usr/lib/ipsec/plugins
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/ipsec/whitelist $(1)/usr/lib/ipsec/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/ipsec/plugins/libstrongswan-whitelist.so $(1)/usr/lib/ipsec/plugins/
endef

define PluginGMALG/kernel-libipsec/install
	$(INSTALL_DIR) $(1)/usr/lib/ipsec
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/ipsec/libipsec.so.* $(1)/usr/lib/ipsec/
endef

$(eval $(call BuildPackage,strongswangmalg))
$(eval $(call BuildPackage,strongswangmalg-default))
$(eval $(call BuildPackage,strongswangmalg-full))
$(eval $(call BuildPackage,strongswangmalg-minimal))
$(eval $(call BuildPackage,strongswangmalg-isakmp))
$(eval $(call BuildPackage,strongswangmalg-charon))
$(eval $(call BuildPackage,strongswangmalg-charon-cmd))
$(eval $(call BuildPackage,strongswangmalg-ipsec))
$(eval $(call BuildPackage,strongswangmalg-libnttfft))
$(eval $(call BuildPackage,strongswangmalg-pki))
$(eval $(call BuildPackage,strongswangmalg-swanctl))
$(eval $(call BuildPackage,strongswangmalg-gencerts))
$(eval $(call BuildPackage,strongswangmalg-libtls))
$(eval $(call BuildPlugin,addrblock,RFC 3779 address block constraint support,))
$(eval $(call BuildPlugin,aes,AES crypto,))
$(eval $(call BuildPlugin,af-alg,AF_ALG crypto interface to Linux Crypto API,+kmod-crypto-user))
$(eval $(call BuildPlugin,agent,SSH agent signing,))
$(eval $(call BuildPlugin,attr,file based config,))
$(eval $(call BuildPlugin,attr-sql,SQL based config,+strongswangmalg-charon))
$(eval $(call BuildPlugin,bliss,BLISS crypto,+strongswangmalg-libnttfft +strongswangmalg-mod-mgf1 +strongswangmalg-mod-hmac))
$(eval $(call BuildPlugin,blowfish,Blowfish crypto,))
$(eval $(call BuildPlugin,ccm,CCM AEAD wrapper crypto,))
$(eval $(call BuildPlugin,chapoly,ChaCha20-Poly1305 AEAD crypto,+kmod-crypto-chacha20poly1305))
$(eval $(call BuildPlugin,cmac,CMAC crypto,))
$(eval $(call BuildPlugin,connmark,netfilter connection marking,+libip4tc))
$(eval $(call BuildPlugin,constraints,advanced X509 constraint checking,))
$(eval $(call BuildPlugin,coupling,IKEv2 plugin to couple peer certificates permanently to authentication,))
$(eval $(call BuildPlugin,ctr,Counter Mode wrapper crypto,))
$(eval $(call BuildPlugin,curl,cURL fetcher plugin,+PACKAGE_strongswangmalg-mod-curl:libcurl))
$(eval $(call BuildPlugin,curve25519,Curve25519 Diffie-Hellman,))
$(eval $(call BuildPlugin,des,DES crypto,))
$(eval $(call BuildPlugin,dhcp,DHCP based attribute provider,))
$(eval $(call BuildPlugin,dnskey,DNS RR key decoding,))
$(eval $(call BuildPlugin,drbg,Deterministic random bit generator,,))
$(eval $(call BuildPlugin,duplicheck,advanced duplicate checking,))
$(eval $(call BuildPlugin,eap-dynamic,EAP dynamic selector,))
$(eval $(call BuildPlugin,eap-identity,EAP identity helper,))
$(eval $(call BuildPlugin,eap-md5,EAP MD5 (CHAP) EAP auth,))
$(eval $(call BuildPlugin,eap-mschapv2,EAP MS-CHAPv2 EAP auth,+strongswangmalg-mod-md4 +strongswangmalg-mod-des))
$(eval $(call BuildPlugin,eap-radius,EAP RADIUS auth,))
$(eval $(call BuildPlugin,eap-tls,EAP TLS auth,+strongswangmalg-libtls))
$(eval $(call BuildPlugin,farp,fake arp respsonses,))
$(eval $(call BuildPlugin,fips-prf,FIPS PRF crypto,+strongswangmalg-mod-sha1))
$(eval $(call BuildPlugin,forecast,forward multi/broadcast traffic,+libip4tc +kmod-ipt-conntrack-extra))
$(eval $(call BuildPlugin,gcm,GCM AEAD wrapper crypto,))
$(eval $(call BuildPlugin,gcrypt,libgcrypt,+PACKAGE_strongswangmalg-mod-gcrypt:libgcrypt))
$(eval $(call BuildPlugin,gmalg,GM Algrithm,+strongswangmalg-mod-kernel-libipsec))
$(eval $(call BuildPlugin,gmp,libgmp,+PACKAGE_strongswangmalg-mod-gmp:libgmp))
$(eval $(call BuildPlugin,gmpdh,DH-Groups; no libgmp dep,))
$(eval $(call BuildPlugin,ha,high availability cluster,))
$(eval $(call BuildPlugin,hmac,HMAC crypto,))
$(eval $(call BuildPlugin,kdf,KDF/PRF+,))
$(eval $(call BuildPlugin,kernel-libipsec,libipsec kernel interface,))
$(eval $(call BuildPlugin,kernel-netlink,netlink kernel interface,))
$(eval $(call BuildPlugin,ldap,LDAP,+PACKAGE_strongswangmalg-mod-ldap:libopenldap))
$(eval $(call BuildPlugin,led,LED blink on IKE activity,))
$(eval $(call BuildPlugin,load-tester,load testing,))
$(eval $(call BuildPlugin,md4,MD4 crypto,))
$(eval $(call BuildPlugin,md5,MD5 crypto,))
$(eval $(call BuildPlugin,mgf1,MGF1 crypto,))
$(eval $(call BuildPlugin,mysql,MySQL database interface,+strongswangmalg-mod-sql +PACKAGE_strongswangmalg-mod-mysql:libmysqlclient-r))
$(eval $(call BuildPlugin,newhope,New Hope crypto,+strongswangmalg-libnttfft +strongswangmalg-mod-chapoly +strongswangmalg-mod-sha3))
$(eval $(call BuildPlugin,ntru,NTRU crypto,+strongswangmalg-mod-mgf1))
$(eval $(call BuildPlugin,openssl,OpenSSL crypto,+PACKAGE_strongswangmalg-mod-openssl:libopenssl))
$(eval $(call BuildPlugin,pem,PEM decoding,))
$(eval $(call BuildPlugin,pgp,PGP key decoding,))
$(eval $(call BuildPlugin,pkcs1,PKCS1 key decoding,))
$(eval $(call BuildPlugin,pkcs7,PKCS7 key decoding,))
$(eval $(call BuildPlugin,pkcs8,PKCS8 key decoding,))
$(eval $(call BuildPlugin,pkcs11,PKCS11 key decoding,))
$(eval $(call BuildPlugin,pkcs12,PKCS12 key decoding,))
$(eval $(call BuildPlugin,pubkey,raw public key,))
$(eval $(call BuildPlugin,random,RNG,))
$(eval $(call BuildPlugin,rc2,RC2 crypto,))
$(eval $(call BuildPlugin,resolve,DNS resolver,))
$(eval $(call BuildPlugin,revocation,X509 CRL/OCSP revocation,))
$(eval $(call BuildPlugin,sha1,SHA1 crypto,))
$(eval $(call BuildPlugin,sha2,SHA2 crypto,))
$(eval $(call BuildPlugin,sha3,SHA3 and SHAKE crypto,))
$(eval $(call BuildPlugin,smp,SMP configuration and control interface,+PACKAGE_strongswangmalg-mod-smp:libxml2))
$(eval $(call BuildPlugin,socket-default,default socket implementation for charon,))
$(eval $(call BuildPlugin,socket-dynamic,dynamic socket implementation for charon,))
$(eval $(call BuildPlugin,sql,SQL database interface,))
$(eval $(call BuildPlugin,sqlite,SQLite database interface,+strongswangmalg-mod-sql +PACKAGE_strongswangmalg-mod-sqlite:libsqlite3))
$(eval $(call BuildPlugin,sshkey,SSH key decoding,))
$(eval $(call BuildPlugin,stroke,Stroke,+strongswangmalg-charon +strongswangmalg-ipsec))
$(eval $(call BuildPlugin,test-vectors,crypto test vectors,))
$(eval $(call BuildPlugin,uci,UCI config interface,+PACKAGE_strongswangmalg-mod-uci:libuci))
$(eval $(call BuildPlugin,unity,Cisco Unity extension,))
$(eval $(call BuildPlugin,updown,updown firewall,+iptables +IPV6:ip6tables +iptables-mod-ipsec +kmod-ipt-ipsec))
$(eval $(call BuildPlugin,vici,Versatile IKE Configuration Interface,))
$(eval $(call BuildPlugin,whitelist,peer identity whitelisting,))
$(eval $(call BuildPlugin,wolfssl,WolfSSL crypto,+PACKAGE_strongswangmalg-mod-wolfssl:libwolfssl))
$(eval $(call BuildPlugin,x509,x509 certificate,))
$(eval $(call BuildPlugin,xauth-eap,EAP XAuth backend,))
$(eval $(call BuildPlugin,xauth-generic,generic XAuth backend,))
$(eval $(call BuildPlugin,xcbc,xcbc crypto,))
