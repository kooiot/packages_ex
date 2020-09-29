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

var callInitAction = rpc.declare({
	object: 'luci',
	method: 'setInitAction',
	params: [ 'name', 'action' ],
	expect: { result: false }
});

var CBIFreeIOECtrl = form.DummyValue.extend({
	renderWidget: function(section_id, option_id, cfgvalue) {
		return E([], [
			E('span', { 'class': 'control-group' }, [
				E('button', {
					'class': 'cbi-button cbi-button-save',
					'click': ui.createHandlerFn(this, 'save')
				}, _('Save Settings')),
				E('span', {}, [
				'     ',
				]),
				E('button', {
					'class': 'cbi-button cbi-button-negative important',
					'click': ui.createHandlerFn(this, 'restart')
				}, _('Restart FreeIOE'))
			])
		]);
	},
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
		formData['action'] = {};

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

		o = s.option(form.Flag, 'USING_BETA', _('Beta Mode Enable'));
		o.rmempty = true
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

		s = m.section(form.NamedSection, 'action', _('Actions'));

		o = s.option(CBIFreeIOECtrl, '_options');
		var view_obj = this;
		o.save = ui.createHandlerFn(this, 'handleSaveCfg');
		o.restart = ui.createHandlerFn(this, 'handleRestart');

		return m.render();
	},

	handleAction: function(name, action) {
		return callInitAction(name, action).then(function(success) {
			if (success != true)
				throw _('Command failed');

			return true;
		}).catch(function(e) {
			ui.addNotification(null, E('p', _('Failed to execute "/etc/init.d/%s %s" action: %s').format(name, action, e)));
		});
	},

	handleRestart: function() {
		if (!confirm(_('Do you really want to restart FreeIOE?')))
			return;

		ui.showModal(_('Rebooting...'), [
			E('p', { 'class': 'spinning' }, _('FreeIOE will be restarted now!'))
		]);
		this.handleAction('skynet', 'restart');
		window.setTimeout(L.bind(function() {
			window.location.reload();
		}, this), 3000);
	},

	handleSaveCfg: function() {
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

	handleSave: null,
	handleSaveApply: null,
	handleReset: null
});
