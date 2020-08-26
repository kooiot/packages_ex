'use strict';
'require baseclass';
'require fs';
'require rpc';

return baseclass.extend({
	title: _('FreeIOE'),

	callFreeioeInfo = rpc.declare({
		object: 'freeioe',
		method: 'info'
	});

	callFreeioeCloud = rpc.declare({
		object: 'freeioe',
		method: 'cloud'
	});

	load: function() {
		return Promise.all([
			this.callFreeioeInfo(),
			this.callFreeioeCloud()
		]);
	},

	render: function(data) {
		var info   = data[0],
		    cloud  = data[1];

		var fields = [
			_('PSN'),              info.hw_id ? info.hw_id + ' / ' + info.id : null,
			_('Version'),          info.version ? info.version + ' ( ' + info.skynet_version + ' ) ' : null,
			_('Firmware Version'), info.firmware_version,
			_('Cloud Host'),       cloud.host,
			_('Cloud Status'),     cloud && cloud.mqtt ? cloud.mqtt.online === 1 ? 'ONLINE' : 'OFFLINE: ' + cloud.mqtt.msg : null,
		];

		var table = E('div', { 'class': 'table' });

		for (var i = 0; i < fields.length; i += 2) {
			table.appendChild(E('div', { 'class': 'tr' }, [
				E('div', { 'class': 'td left', 'width': '33%' }, [ fields[i] ]),
				E('div', { 'class': 'td left' }, [ (fields[i + 1] != null) ? fields[i + 1] : '?' ])
			]));
		}

		return table;
	}
});
