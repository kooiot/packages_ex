'use strict';
'require ui';
'require rpc';
'require dom';
'require view';
'require form';

var formData = {}

var	callFreeioeCfgGet = rpc.declare({
	object: 'freeioe',
	method: 'cfg_get',
	params: [ "cfg" ]
});

var	callFreeioeCfgSet = rpc.declare({
	object: 'freeioe',
	method: 'cfg_set',
	params: [ "cfg", "conf" ]
});

return view.extend({
	load: function() {
		return Promise.all([
			L.resolveDefault(callFreeioeCfgGet('cloud'), {}),
			L.resolveDefault(callFreeioeCfgGet('sys'), {})
		]);
	},

	render: function(data) {
		var m, s, o;

		formData['cloud'] = data[0];
		formData['sys'] = data[1];

		m = new form.JSONMap(formData, 
			_('Settings'),
			_('Change those settings may cause connection issue!'));

		s = m.section(form.NamedSection, 'cloud', _('Cloud Settings'));

		o = s.option(form.Value, 'HOST', _('Cloud Host'));
		o.datatype    = 'host';
		o.placeholder = 'ioe.thingsroot.com';

		o = s.option(form.Value, 'PORT', _('Cloud Port'));
		o.datatype    = 'port';
		o.placeholder = 1883;

		o = s.option(form.Value, 'KEEPALIVE', _('KeepAlive'));
		o.datatype    = 'range(0, 600)';
		o.placeholder = 60;
		o.readonly = true;

		o = s.option(form.Value, 'EVENT_UPLOAD', _('Event Upload Level'));
		o.datatype    = 'range(0, 100)';
		o.placeholder = 90;
		o.readonly = true;

		o = s.option(form.Flag, 'DATA_UPLOAD', _('Data Upload Enable'));
		o.rmempty = true
		o.readonly = true;

		s = m.section(form.NamedSection, 'sys', _('System Settings'));

		o = s.option(form.Value, 'PKG_HOST_URL', _('App Center Host'));
		o.datatype    = 'pkg_host';
		o.placeholder = 'ioe.thingsroot.com';

		o = s.option(form.Value, 'CNF_HOST_URL', _('Conf Center Host'));
		o.datatype    = 'cnf_host';
		o.placeholder = 'ioe.thingsroot.com';

		return m.render();
	},

	handleSave: function() {
		var map = document.querySelector('.cbi-map');

		return dom.callClassMethod(map, 'save').then(function() {
			console.log(formData);

			var cloud_data = {};
			cloud_data['HOST'] = formData['cloud']['HOST'];
			cloud_data['PORT'] = formData['cloud']['PORT'];

			var sys_data = {};
			sys_data['PKG_HOST_URL'] = formData['sys']['PKG_HOST_URL'];
			sys_data['CNF_HOST_URL'] = formData['sys']['CNF_HOST_URL'];

			return Promise.all([
				callFreeioeCfgSet('cloud', cloud_data),
				callFreeioeCfgSet('sys', sys_data)
			]).then(function(data) {
				var success = false;
				if (typeof(data[0]) == 'number' || typeof(data[1]) == 'number') {
					success = false;
				} else {
					success = true;
				}

				if (success)
					ui.addNotification(null, E('p', _('The FreeIOE settings has been successfully changed.')), 'info');
				else
					ui.addNotification(null, E('p', _('Failed to change the FreeIOE settings.')), 'danger');

				formData.cloud.HOST = data[0]['HOST'];
				formData.cloud.PORT = data[0]['PORT'];

				formData.sys.PKG_HOST_URL = data[1]['PKG_HOST_URL'];
				formData.sys.CNF_HOST_URL = data[1]['CNF_HOST_URL'];

				dom.callClassMethod(map, 'render');
			});
		});
	},

	handleSaveApply: null,
	handleReset: null
});
