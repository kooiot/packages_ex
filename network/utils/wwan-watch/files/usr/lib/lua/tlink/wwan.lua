#!/usr/bin/lua

local util = require 'luci.util'
local uci = require 'uci'

uci.set_savedir('/var/state')

local network_ifstatus_cache = nil
local function _network_flush_cache()
	network_ifstatus_cache = nil
end
local function _network_ifstatus()
	if not network_ifstatus_cache then
		local status, err = util.ubus('network.interface', 'dump')
		if not status then
			return nil, err
		end
		if not status.interface then
			return nil, "Interface object not found"
		end
		network_ifstatus_cache = status.interface
	end
	return network_ifstatus_cache
end
local function network_ifstatus(iface)
	local status = _network_ifstatus()
	for _, v in ipairs(status) do
		if v.interface == iface then
			return v
		end
	end
	return nil, "Interface not found"
end

local function find_real_network(device)
	local status = _network_ifstatus()
	for _, v in ipairs(status) do
		if v.device == device and v.l3_device == device then
			return v
		end
	end
	return nil, "Real interface not found"
end

local function get_wwan_iface()
	local net = nil
	uci.foreach('3ginfo', '3ginfo', function(info)
		if net then
			return -- if already found one skip others
		end
		if not info.network then
			return
		end
		net = info.network
	end)
	return net
end

local function get_wwan_status()
	local net = get_wwan_iface()
	if not net then
		return nil, 'Network not found'
	end
	_network_flush_cache()
	local status, err = network_ifstatus(net)
	if not status then
		return nil, err
	end
	local iface = status.interface
	local ifl3dev = status.l3_device
	local ifproto = status.proto
	if ifl3dev == string.format("%s-%s", ifproto or '', iface or '') then
		return status
	end
	return find_real_network(ifl3dev)
end

return {
	get_wwan_iface = get_wwan_iface,
	get_wwan_status = get_wwan_status,
}
