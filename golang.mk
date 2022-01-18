#
# Copyright (C) 2022 Dirk Chang <dirk@kooiot.com>
#
# This is free software, licensed under the MIT
#

GOLANGMKFILE:=$(wildcard $(TOPDIR)/feeds/*/lang/golang/golang-package.mk)

# verify that there is only one single file returned
ifneq (1,$(words $(GOLANGMKFILE)))
ifeq (0,$(words $(GOLANGMKFILE)))
$(error did not find golang-package.mk in any feed)
else
$(error found multiple golang-package.mk files in the feeds)
endif
else
#$(info found golang-package.mk at $(GOLANGMKFILE))
endif

include $(GOLANGMKFILE)
