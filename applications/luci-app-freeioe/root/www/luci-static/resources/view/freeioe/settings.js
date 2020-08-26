'use strict';
'require view';
'require poll';
'require ui';
'require uci';
'require rpc';
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
			callFreeioeInfo(),
			callFreeioeCloud(),
			uci.load('luci'),
			uci.load('system')
		]);
	},

	render: function(rpc_replies) {
	}
});
