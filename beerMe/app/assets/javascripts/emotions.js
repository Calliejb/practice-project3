var emotionApp = angular.module('emotionApp', ['ngResource']).config(
    ['$httpProvider', function($httpProvider) {
    var authToken = angular.element("meta[name=\"csrf-token\"]").attr("content");
    var defaults = $httpProvider.defaults.headers;

    defaults.common["X-CSRF-TOKEN"] = authToken;
    defaults.patch = defaults.patch || {};
    defaults.patch['Content-Type'] = 'application/json';
    defaults.common['Accept'] = 'application/json';
}]);

emotionApp.factory('Emotion', ['$resource', function($resource) {
  return $resource('/emotions/:id',
     {id: '@id'},
     {update: { method: 'PATCH'}});
}]);

emotionApp.controller('EmotionCtrl', ['$scope', 'Emotion', function($scope, Yogurt) {
    $scope.emotions= [];

    Emotion.query(function(emotions) {
      $scope.emotions = emotions;
   });
}]);