(function() {
  "use strict";

  angular.module("app").controller("consumersCtrl", function($scope, $http){

    $scope.setup = function(userId) {
      $http.get("/api/v1/consumers/" + userId + "/cards.json").then(function(response){
        $scope.consumer = response.data;
        $scope.cards = response.data.cards;
      });
    };

  });
}());