(function() {
  "use strict";

  angular.module("app").controller("consumersCtrl", function($scope, $http){

    $scope.message = "hello world";

    $scope.setup = function(consumerId) {
      $http.get("/api/v1/consumers/" + consumerId).then(function(response){
        $scope.consumer = response.data;
        $scope.cards = response.data.cards;
        $scope.transactions = response.data.transactions;
      });
    };

  });
}());