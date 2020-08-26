-- stub lua controller for 19.07 backward compatibility

module("luci.controller.freeioe", package.seeall)

function index()
	entry({"admin", "services", "freeioe"}, firstchild(), _("FreeIOE"), 1)
	entry({"admin", "services", "freeioe", "overview"}, view("freeioe/overview"), _("Overview"), 10)
	entry({"admin", "services", "freeioe", "settings"}, view("freeioe/settings"), _("Settings"), 20)
end
