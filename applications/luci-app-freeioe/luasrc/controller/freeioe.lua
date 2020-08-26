-- Copyright 2020 Dirk Chang <dirk@kooiot.com>
-- Licensed to the public under the Apache License 2.0.

module("luci.controller.freeioe", package.seeall)

function index()
	entry({"admin", "freeioe"}, firstchild(), _("FreeIOE"), 50)
	entry({"admin", "freeioe", "settings"}, view("freeioe/overview"), _("Overview"), 10)
	entry({"admin", "freeioe", "settings"}, view("freeioe/settings"), _("Settings"), 20)
end
