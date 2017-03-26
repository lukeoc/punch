(function() {
  "use strict";

  angular.module("app", ['ui.materialize']).controller("consumersCtrl", function($scope, $http){

    $scope.setup = function(consumerId) {
      $http.get("/api/v1/consumers/" + consumerId).then(function(response){
        $scope.consumer = response.data;
        $scope.cards = response.data.cards;
        $scope.showCardInfo = false;
        // $scope.transactions = response.data.transactions;
      });
    };

    $scope.initSmallMap = function() {
        var uluru = {lat: -25.363, lng: 131.044};
        var mapSmall = new google.maps.Map(document.getElementById('mapSmall'), {
          zoom: 6,
          center: uluru
        });

        var marker = new google.maps.Marker({
          position: uluru,
          map: mapSmall
        });
      };

    $scope.initLargeMap = function() {
      var uluru = {lat: -25.363, lng: 131.044};

      var mapLarge = new google.maps.Map(document.getElementById('mapLarge'), {
        zoom: 4,
        center: uluru
      });

      var marker = new google.maps.Marker({
        position: uluru,
        map: mapLarge
      });
    };

    $scope.showCard = function(card) {
      $http.get("/api/v1/cards/" + card.id).then(function(response){
        $scope.card = response.data;
        $scope.transactions = response.data.transactions;
        $scope.merchant = response.data.merchant;
        $scope.rewardProgressPercentObj = {
          "width" : (response.data.reward_progress * 100).toString() + "%"
        };
        // $scope.showCardInfo = !$scope.showCardInfo;
        $scope.showCardInfo = true;
      });

      // $scope.initMap();
    };

    $scope.orderAttribute = "";

    

  });
}());

