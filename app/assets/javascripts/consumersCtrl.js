(function() {
  "use strict";

  angular.module("app", ['ui.materialize']).controller("consumersCtrl", function($scope, $http){

    $scope.setup = function(consumerId) {
      $http.get("/api/v1/consumers/" + consumerId).then(function(response){
        $scope.consumer = response.data;
        $scope.cards = response.data.cards;
        $scope.showCardList = true;
        $scope.showCardInfo = false;
        // $scope.transactions = response.data.transactions;
      });

      $scope.initMap();
    };

    $scope.initMap = function() {
        var uluru = {lat: -25.363, lng: 131.044};
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 4,
          center: uluru
        });
        var marker = new google.maps.Marker({
          position: uluru,
          map: map
        });
      };

    $scope.showCard = function(card) {
      $http.get("/api/v1/cards/" + card.id).then(function(response){
        $scope.card = response.data;
        $scope.transactions = response.data.transactions;
        $scope.merchant = response.data.merchant;
        $scope.showCardInfo = !$scope.showCardInfo;
      });

      $scope.initMap();
    };

    $scope.orderAttribute = "";

    

  });
}());

