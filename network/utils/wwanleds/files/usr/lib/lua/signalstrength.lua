
local class = {}

function class:valid_data()
	local data = self._data
end

function class:level()
	--[[
	if self:isGsm() then
	return self:getLteLevel() or self:getTdScdmaLevel() or self:getGsmLevel()
	else
	local cdma_level = self:getCdmaLevel()
	local evdo_level = self:getEvdoLevel()

	if not evdo_level then
	return cdma_level
	end
	if not cdma_level then
	return evdo_level
	end

	return cdma_level < evdo_level and cdma_level or evdo_level
	end
	]]--

	local ss_type = string.lower(self._data['type'] or self._data['mode'])

	if ss_type == 'gsm' then
		return self:getGsmLevel()
	end
	if ss_type == 'lte' then
		return self:getLteLevel()
	end
	if ss_type == 'cdma' then
		return self:getCdmaLevel()
	end
	if ss_type == 'tdma' then
		return self:getTdScdmaLevel()
	end
	if ss_type == 'wcdma' then
		--return self:getWcdmaLevel()
		return self:getCdmaLevel()
	end
	if ss_type == 'hdr' then
		return self:getHdrLevel()
	end
end

--[[
function class:isGms()
local ss_type = self._data['type']

return ss_type == 'lte' or ss_type == 'gsm'
end
]]--

local RSRP_THRESH_TYPE_STRICT = 0
local RSRP_THRESH_STRICT = {-140, -115, -105, -95, -85, -44}
local RSRP_THRESH_LENIENT = {-140, -128, -118, -108, -98, -44}

local SIGNAL_STRENGTH_NONE_OR_UNKNOWN = 0
local SIGNAL_STRENGTH_POOR = 1
local SIGNAL_STRENGTH_MODERATE = 2
local SIGNAL_STRENGTH_GOOD = 3
local SIGNAL_STRENGTH_GREAT = 4
local NUM_SIGNAL_STRENGTH_BINS = 5
local SIGNAL_STRENGTH_NAMES = {
	"none", "poor", "moderate", "good", "great"
}

function class:__get_lte_rsrp_level(val, thresh_rsrp)
	if val > thresh_rsrp[6] then
		return nil
	end
	if val >= thresh_rsrp[5] then
		return SIGNAL_STRENGTH_GREAT
	end
	if val >= thresh_rsrp[4] then
		return SIGNAL_STRENGTH_GOOD
	end
	if val >= thresh_rsrp[3] then
		return SIGNAL_STRENGTH_MODERATE
	end
	if val >= thresh_rsrp[2] then
		return SIGNAL_STRENGTH_POOR
	end
	if val >= thresh_rsrp[1] then
		return SIGNAL_STRENGTH_NONE_OR_UNKNOWN
	end
	return SIGNAL_STRENGTH_NONE_OR_UNKNOWN
end

function class:__get_lte_snr_level(val)
	if val > 300 then
		return nil
	end
	if val >= 130 then
		return SIGNAL_STRENGTH_GREAT
	end
	if val >= 45 then
		return SIGNAL_STRENGTH_GOOD
	end
	if val >= 10 then
		return SIGNAL_STRENGTH_MODERATE
	end
	if val >= -30 then
		return SIGNAL_STRENGTH_POOR
	end
	if val >= -200 then
		return SIGNAL_STRENGTH_NONE_OR_UNKNOWN
	end
	return SIGNAL_STRENGTH_NONE_OR_UNKNOWN
end

function class:__get_lete_rclassi_level(val)
	if val > 63 then
		return SIGNAL_STRENGTH_NONE_OR_UNKNOWN
	end
	if val >= 12 then
		return SIGNAL_STRENGTH_GREAT
	end
	if val >= 8 then
		return SIGNAL_STRENGTH_GOOD
	end
	if val >= 5 then
		return SIGNAL_STRENGTH_MODERATE
	end
	if val >= 0 then
		return SIGNAL_STRENGTH_POOR
	end

	return SIGNAL_STRENGTH_NONE_OR_UNKNOWN
end

function class:getLteLevel()
	local rclassi_icon_level = nil
	local rsrp_icon_level = -1

	local rsrp_thresh_type = nil -- configuration
	local thresh_rsrp = nil

	if not thresh_rsrp then
		if rsrp_thresh_type == RSRP_THRESH_TYPE_STRICT then
			thresh_rsrp = RSRP_THRESH_STRICT
		else
			thresh_rsrp = RSRP_THRESH_LENIENT
		end
	end
	-- Get configuration
	--[[
	if (nil) then
	thresh_rsrp = RSRP_THRESH_LENIENT
	end
	]]--

	local lte_rsrp = self._data.rsrp
	rsrp_icon_level = self:__get_lte_rsrp_level(lte_rsrp, thresh_rsrp)

	--- Configuration??
	--[[
	if rsrp_icon_level then
	return rsrp_icon_level
	end
	]]--

	local lte_rclassnr = self._data.snr
	local snr_icon_level = self:__get_lte_snr_level(lte_rclassnr)
	--print(snr_icon_level, rsrp_icon_level)

	if snr_icon_level and rsrp_icon_level then
		return rsrp_icon_level < snr_icon_level and rsrp_icon_level or snr_icon_level
	end

	if snr_icon_level or rsrp_icon_level then
		return snr_icon_level or rsrp_icon_level
	end

	local lte_rclassi = self._data.rclassi

	return self:__get_lte_rclassi(lte_rclassi)
end

function class:getTdScdmaLevel()
	local signal = self._data.signal
	if signal > -25 or signal == nil then
		return SIGNAL_STRENGTH_NONE_OR_UNKNOWN
	end
	if signal >= -49 then
		return SIGNAL_STRENGTH_GREAT
	end
	if signal >= -73 then
		return SIGNAL_STRENGTH_GOOD
	end
	if signal >= -97 then
		return SIGNAL_STRENGTH_MODERATE
	end
	if signal >= -110 then
		return SIGNAL_STRENGTH_POOR
	end
	return SIGNAL_STRENGTH_NONE_OR_UNKNOWN
end

function class:getGsmLevel()
	local signal = self._data.signal
	if signal <= 2 or signal >= 99 then
		return SIGNAL_STRENGTH_NONE_OR_UNKNOWN
	end
	if signal >= 12 then
		return SIGNAL_STRENGTH_GREAT
	end
	if signal >= 8 then
		return SIGNAL_STRENGTH_GOOD
	end
	if signal >= 5 then
		return SIGNAL_STRENGTH_MODERATE
	end
	return SIGNAL_STRENGTH_POOR
end

function class:__get_cdma_rclassi_level(val)
	if val >= -75 then
		return SIGNAL_STRENGTH_GREAT
	end
	if val >= -85 then
		return SIGNAL_STRENGTH_GOOD
	end
	if val >= -95 then
		return SIGNAL_STRENGTH_MODERATE
	end
	if val >= -100 then
		return SIGNAL_STRENGTH_POOR
	end
	return SIGNAL_STRENGTH_NONE_OR_UNKNOWN
end

function class:__get_cdma_ecio_level(val)
	if val >= -90 then
		return SIGNAL_STRENGTH_GREAT
	end
	if val >= -110 then
		return SIGNAL_STRENGTH_GOOD
	end
	if val >= -130 then
		return SIGNAL_STRENGTH_MODERATE
	end
	if val >= -150 then
		return SIGNAL_STRENGTH_POOR
	end
	return SIGNAL_STRENGTH_NONE_OR_UNKNOWN
end

function class:getCdmaLevel()
	local rclassi = self._data.rclassi
	local ecio = self._data.ecio

	local rclassi_level = self:__get_cdma_rclassi_level(rclassi)
	local ecio_level = self:__get_cdma_ecio_level(ecio)
	return rclassi_level < ecio_level and rclassi_level or ecio_level
end


function class:__get_evdo_rclassi_level(val)
end

function class:__get_evdo_ecio_level(val)
end

function class:getEvdoLevel()
	local rclassi = self._data.rclassi
	local ecio = self._data.ecio
	local io = self._data.io
end

return {
	new = function(data) 
		return setmetatable({_data = data}, {__index=class})
	end
}
