'use strict';
'require uci';

return L.view.extend({
	render: function() {
		return E('iframe', {
			src: window.location.protocol + '//' + window.location.hostname + ':8808',
			style: 'width: 100%; min-height: 500px; border: none; border-radius: 3px; resize: vertical;'
		});
	},
	handleSaveApply: null,
	handleSave: null,
	handleReset: null
});
