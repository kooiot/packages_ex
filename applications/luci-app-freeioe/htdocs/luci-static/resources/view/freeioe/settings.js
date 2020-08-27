'use strict';
'require fs';
'require ui';
'require uci';
'require rpc';
'require view';
'require form';

var callFreeioeCfgGet = rpc.declare({
	object: 'freeioe',
	method: 'cfg_get',
	params: [ "cfg" ]
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
		var json_data = {};
		json_data['freeioe'] = data[0];

		m = new form.JSONMap(json_data,
			_('FreeIOE'),
			_('<a href="http://freeioe.org">FreeIOE</a> is an opensource IOT Computing-Edge Platform.'));

		m.lookupOption = function(name, section_id, config_name) {
			console.log(name, section_id, config_name);
		}

		s = m.section(form.NamedSection, 'freeioe', _('Settings'));

		o = s.option(form.Value, 'host', _('Host'));
		o.datatype    = 'host';
		o.placeholder = 'ioe.thingsroot.com';

		o = s.option(form.Value, 'port', _('Port'));
		o.datatype    = 'port';
		o.placeholder = 22;

		o = s.option(form.Value, 'pkg_host', _('App Center'));
		o.datatype    = 'pkg_host';
		o.placeholder = 'ioe.thingsroot.com';

		o = s.option(form.Value, 'cnf_host', _('Conf Center'));
		o.datatype    = 'cnf_host';
		o.placeholder = 'ioe.thingsroot.com';

		return m.render();
	},

	handleSave: function() {
		var map = document.querySelector('.cbi-map');

		return dom.callClassMethod(map, 'save').then(function() {
			if (formData.password.pw1 == null || formData.password.pw1.length == 0)
				return;

			if (formData.password.pw1 != formData.password.pw2) {
				ui.addNotification(null, E('p', _('Given password confirmation did not match, password not changed!')), 'danger');
				return;
			}

			return callSetPassword("root", formData.password.pw1).then(function(success) {
				if (success)
					ui.addNotification(null, E('p', _('The system password has been successfully changed.')), 'info');
				else
					ui.addNotification(null, E('p', _('Failed to change the system password.')), 'danger');

				formData.password.pw1 = null;
				formData.password.pw2 = null;

				dom.callClassMethod(map, 'render');
			});
		});
	},

	handleSaveApply: null,
	handleReset: null
});
