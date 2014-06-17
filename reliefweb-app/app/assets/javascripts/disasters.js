var disasterApp = angular.module('disasterApp', ['ngResource']).config(
    ['$httpProvider', function($httpProvider) {
    var authToken = angular.element("meta[name=\"csrf-token\"]").attr("content");
    var defaults = $httpProvider.defaults.headers;

    defaults.common["X-CSRF-TOKEN"] = authToken;
    defaults.patch = defaults.patch || {};
    defaults.patch['Content-Type'] = 'application/json';
    defaults.common['Accept'] = 'application/json';
}]);

disasterApp.factory('Disaster', ['$resource', function($resource) {
  return $resource('http://api.rwlabs.org/v1/disasters/:id',
     {id: '@id'},
     {index: { method: 'GET', isArray: true},
      update: { method: 'PATCH'},
      save: {method: 'POST'}});
}]);

disasterApp.controller('DisasterCtrl', ['$scope', 'Disaster', function($scope, Yogurt) {
	
	$scope.disasters = [];
  

	DisasterFactory.query(function(disasters) {
		$scope.disasters = disasters;
	});
}]);