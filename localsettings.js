'use strict';

exports.setup = function(parsoidConfig) {
	parsoidConfig.setMwApi({ prefix: 'localhost', uri: 'http://localhost/w/api.php' });
	parsoidConfig.loadWMF = false;
	parsoidConfig.useSelser = true;
};
