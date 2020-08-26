'use strict';
'require fs';
'require ui';
'require uci';
'require rpc';
'require form';

return view.extend({
	callFreeioeInfo = rpc.declare({
		object: 'freeioe',
		method: 'info',
		expect: { result: [] }
	});

	callFreeioeCloud = rpc.declare({
		object: 'freeioe',
		method: 'cloud',
		expect: { result: [] }
	});

	load: function() {
		return Promise.all([
			this.callFreeioeInfo(),
			this.callFreeioeCloud(),
		]);
	},

	render: function(data) {
	}
});
