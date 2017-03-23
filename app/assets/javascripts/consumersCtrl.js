(function() {
  "use strict";

  angular.module("app").controller("consumersCtrl", function($scope, $http){

    $scope.setup = function(consumerId) {
      $http.get("/api/v1/consumers/" + consumerId).then(function(response){
        $scope.consumer = response.data;
        $scope.cards = response.data.cards;
        $scope.showCardList = true;
        $scope.showCardInfo = false;
        // $scope.transactions = response.data.transactions;
      });
    };

    $scope.showCard = function(card) {
      $http.get("/api/v1/cards/" + card.id).then(function(response){
        $scope.card = response.data;
        $scope.transactions = response.data.transactions;
        $scope.merchant = response.data.merchant;
        $scope.showCardInfo = !$scope.showCardInfo;
      });
    };

    $scope.functionName = function(progress) {
      // jquery to set a class on an element
      $('div').applyClass('purple');
    };

  });
}());

