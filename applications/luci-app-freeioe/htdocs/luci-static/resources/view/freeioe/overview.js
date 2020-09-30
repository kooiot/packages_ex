'use strict';
'require fs';
'require ui';
'require uci';
'require rpc';
'require view';
'require form';

var callFreeioeInfo = rpc.declare({
	object: 'freeioe',
	method: 'info'
});

var callFreeioeCloud = rpc.declare({
	object: 'freeioe',
	method: 'cloud'
});



return view.extend({
	load: function() {
		return Promise.all([
			L.resolveDefault(callFreeioeInfo(), {}),
			L.resolveDefault(callFreeioeCloud(), {})
		]);
	},

	render: function(data) {
		var info   = data[0],
		    cloud  = data[1];

		var fields = [
			_('PSN'),				info.hw_id ? info.hw_id + ' / ' + info.id : null,
			_('Version'),			info.version ? info.version + ' ( ' + info.skynet_version + ' ) ' : null,
			_('Firmware Version'),	info.firmware_version,
			_('Beta Mode Enable'),	info.firmware_version,
			_('Cloud Host'),		cloud.host,
			_('Cloud Host'),		cloud.port ? cloud.port : null,
			_('Cloud Status'),		cloud && cloud.mqtt ? cloud.mqtt.online === 1 ? 'ONLINE' : 'OFFLINE: ' + cloud.mqtt.msg : null,
			_('Data Upload Enable'),cloud ? cloud.data_upload : null,
			_('Event Upload Level'),cloud ? cloud.event_upload : null,
			_('Data Cache'),		cloud ? cloud.data_cache : null,
			_('Secret'),			cloud ? cloud.secret : null,
		];

		var body = E([
			E('h2', _('FreeIOE')),
			E('p', {}, _('<a href="http://freeioe.org">FreeIOE</a> is an opensource IOT Computing-Edge Platform.'))
		]);

		var table = E('div', { 'class': 'table' });

		for (var i = 0; i < fields.length; i += 2) {
			table.appendChild(E('div', { 'class': 'tr' }, [
				E('div', { 'class': 'td left', 'width': '33%' }, [ fields[i] ]),
				E('div', { 'class': 'td left' }, [ (fields[i + 1] != null) ? fields[i + 1] : '?' ])
			]));
		}

		body.appendChild(table);

		return body;
	},

	handleSaveApply: null,
	handleSave: null,
	handleReset: null
});
