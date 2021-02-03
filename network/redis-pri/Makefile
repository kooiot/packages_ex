include $(TOPDIR)/rules.mk

PKG_NAME:=redis-pri
PKG_VERSION:=4.0.10
PKG_RELEASE:=1

# rm -rf ./bin/packages/*/redis* -rf
# rm -rf ./build_dir/*/redis*
# rm -rf ./dl/redis* -rf
# rm -rf ./feeds/redis*
# rm -rf ./staging_dir/packages/*/redis*
# ./scripts/feeds update redis
# ./scripts/feeds install -a -p redis

# might to remove the PKG_HASH
# ./scripts/feeds update redis
# make package/feeds/redis/redis/download V=s
# make package/feeds/redis/redis/check FIXUP=1 V=s
# cat package/feeds/redis/redis/Makefile | less

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
# for new hash comment and the hash must be lowercase
PKG_HASH:=1db67435a704f8d18aec9b9637b373c34aa233d65b6e174bdac4c1b161f38ca4
PKG_SOURCE_URL:=http://download.redis.io/releases/
PKG_MAINTAINER:=Patrik Laszlo <alabard@gmail.com>
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

MAKE_FLAGS+= \
	MALLOC="libc" \
	PREFIX="$(PKG_INSTALL_DIR)/usr"

define Package/redis-pri
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Advanced key-value cache and store
  DEPENDS:=+libpthread
  URL:=http://redis.io
endef

define Package/redis-pri/description
	Redis is an open source, BSD licensed, advanced key-value cache and store.
	It is often referred to as a data structure server since keys can contain
	strings, hashes, lists, sets, sorted sets, bitmaps and hyperloglogs.
endef

MAKE_VARS = \
        CFLAGS="$(TARGET_CFLAGS) $(EXTRA_CFLAGS) $(TARGET_CPPFLAGS) $(EXTRA_CPPFLAGS)" \
        CXXFLAGS="$(TARGET_CXXFLAGS) $(EXTRA_CXXFLAGS) $(TARGET_CPPFLAGS) $(EXTRA_CPPFLAGS)" \
        LDFLAGS="$(TARGET_LDFLAGS) $(EXTRA_LDFLAGS)"


MAKE_FLAGS = \
        $(TARGET_CONFIGURE_OPTS) \
        ARCH=""

define Package/redis-pri/conffiles
/etc/redis.conf
endef

define Build/Prepare
	$(call Build/Prepare/Default)
	$(call PatchDir,$(PKG_BUILD_DIR),./010-redis.patch)
endef

define Build/Compile
	$(MAKE) -C "$(PKG_BUILD_DIR)/deps/hiredis" static $(MAKE_FLAGS)  CFLAGS="$(TARGET_CPPFLAGS) "  LDFLAGS="$(TARGET_LDFLAGS)"
	$(MAKE) -C "$(PKG_BUILD_DIR)/deps/linenoise" $(MAKE_FLAGS)  CFLAGS="$(TARGET_CPPFLAGS) "  LDFLAGS="$(TARGET_LDFLAGS)"
	$(MAKE) -C "$(PKG_BUILD_DIR)/deps/lua" posix $(MAKE_FLAGS)  CFLAGS="$(TARGET_CPPFLAGS) "  LDFLAGS="$(TARGET_LDFLAGS)"  AR="${AR} ru"
#	$(MAKE) -C "$(PKG_BUILD_DIR)/deps/geohash-int"  $(MAKE_FLAGS)  CFLAGS="$(TARGET_CPPFLAGS) "  LDFLAGS="$(TARGET_LDFLAGS)"
	cd "$(PKG_BUILD_DIR)/deps/jemalloc"; $(CONFIGURE_VARS)  ./configure --host=x86_64 --with-lg-quantum=3 --with-jemalloc-prefix=je_ --enable-cc-silence
	cd "$(PKG_BUILD_DIR)/deps/jemalloc"; $(MAKE_VARS) $(MAKE) $(MAKE_FLAGS)  CFLAGS="$(TARGET_CPPFLAGS) "  LDFLAGS="$(TARGET_LDFLAGS)"   lib/libjemalloc.a
	$(MAKE) -C "$(PKG_BUILD_DIR)/src/" $(MAKE_FLAGS) CFLAGS="$(TARGET_CPPFLAGS)"  LDFLAGS="$(TARGET_LDFLAGS)"
endef

define Package/redis-pri/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/redis-cli $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/redis-server $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/redis-check-aof $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/redis-benchmark $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/redis.init $(1)/etc/init.d/redis
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/redis.conf $(1)/etc
endef

$(eval $(call BuildPackage,redis-pri))

