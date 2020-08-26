-- Copyright 2020 Dirk Chang <dirk@kooiot.com>
-- Licensed to the public under the Apache License 2.0.

module("luci.controller.freeioe", package.seeall)

function index()
	if not nixio.fs.access("/usr/ioe/skynet/cfg.json") then
		return
	end

	--entry({"admin", "freeioe"}, template("freeioe/jump"), _("FreeIOE"))
	local e = entry({"admin", "freeioe"}, firstchild(), _("FreeIOE"), 50)
	e.dependent = false
	e.acl_depends = { "luci-freeioe-app" }

	entry({"admin", "freeioe", "settings"}, template("freeioe/jump"), _("Settings"), 1).leaf = true

	--[[
	local s = entry({"admin", "freeioe", "settings"}, view("freeioe/settings"), _("Settings"), 1)
	s.leaf = true
	s.acl_depends = { "luci-freeioe-app" }
	]]--
end
