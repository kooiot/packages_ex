'use strict';
'require fs';
'require ui';
'require uci';
'require rpc';
'require view';
'require form';

var callFreeioeCloudOption = rpc.declare({
	object: 'freeioe',
	method: 'cloud'
});

return view.extend({
	load: function() {
		return Promise.all([
			L.resolveDefault(callFreeioeCloudOption(), {})
		]);
	},

	render: function(data) {
		var cloud   = data[0],
			m, s, o;

		m = new form.Map('freeioe',
			_('FreeIOE'),
			_('<a href="http://freeioe.org">FreeIOE</a> is an opensource IOT Computing-Edge Platform.'));

		s = m.section(form.TypedSection, 'freeioe', _('Settings'));
		s.anonymous = true;
		s.addremove = true;

		o = s.option(form.Value, 'host', _('Host'));
		o.datatype    = 'host';
		o.placeholder = 'ioe.thingsroot.com';
		o.cfgvalue = function(section_id) {
			return uci.get('freeioe', 'cloud', 'host');
		}
		o.write = function(section_id, value) {
			uci.set('freeioe', 'cloud', 'host', value);
		}

		o = s.option(form.Value, 'port', _('Port'));
		o.datatype    = 'port';
		o.placeholder = 22;

		o = s.option(form.Value, 'pkg_host', _('App Center'));
		o.datatype    = 'host';
		o.placeholder = 'ioe.thingsroot.com';

		o = s.option(form.Value, 'cnf_host', _('Conf Center'));
		o.datatype    = 'host';
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
