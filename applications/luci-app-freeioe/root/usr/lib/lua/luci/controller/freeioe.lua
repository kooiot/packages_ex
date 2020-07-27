-- Copyright 2016-2017 Dan Luedtke <mail@danrl.com>
-- Licensed to the public under the Apache License 2.0.

module("luci.controller.freeioe", package.seeall)

function index()
	entry({"admin", "freeioe"}, template("freeioe/jump"), _("FreeIOE"))
end
