(function() {
  "use strict";

  angular.module("app").controller("cardsCtrl", function($scope, $http){
    $scope.indexMessage = "welcome to punch";

    $scope.setup = function(card_id) {
      $http.get("/api/v1/cards/" + card_id).then(function(response){
        $scope.card = response.data;
        $scope.transactions = response.data.transactions;
      });
    };

  });
}());