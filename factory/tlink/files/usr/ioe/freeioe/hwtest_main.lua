local skynet = require "skynet"
local snax = require "skynet.snax"

local is_windows = package.config:sub(1,1) == '\\'

skynet.start(function()
	skynet.error("FreeIOE@Skynet HWTEST Starting")
	--skynet.newservice("exec_sal")
	if not is_windows and not os.getenv("IOE_RUN_AS_DAEMON") then
		local console = skynet.newservice("console")
	end
	local hwtest = skynet.newservice("hwtest")

	skynet.exit()
end)
