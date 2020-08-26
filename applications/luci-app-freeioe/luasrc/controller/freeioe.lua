-- stub lua controller for 19.07 backward compatibility

module("luci.controller.freeioe", package.seeall)

function index()
	entry({"admin", "freeioe"}, firstchild(), _("FreeIOE"), 60)
	entry({"admin", "freeioe", "overview"}, view("freeioe/overview"), _("Overview"), 10)
	entry({"admin", "freeioe", "settings"}, view("freeioe/settings"), _("Settings"), 20)
end
