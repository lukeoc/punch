(function() {
  "use strict";

  angular.module("app", ['ui.materialize']).controller("consumersCtrl", function($scope, $http){

    $scope.setup = function(consumerId) {
      $http.get("/api/v1/consumers/" + consumerId).then(function(response){
        $scope.consumer = response.data;
        $scope.cards = response.data.cards;
        $scope.showCardInfo = false;
        
        $scope.rewardProgressPercentObj = [];
        for(var i = 0; i < $scope.cards.length; i++) {
          $scope.rewardProgressPercentObj.push({"width" : ($scope.cards[i].reward_progress * 100).toString() + "%"});
        }

        $scope.cardMaps = [];
        for(var j = 0; j < $scope.cards.length; j++) {
          $scope.cardMaps.push();
        }

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
      var uluru = {lat: -33.8666, lng: 151.1958};

      var mapLarge = new google.maps.Map(document.getElementById('mapLarge'), {
        zoom: 15,
        center: uluru
      });

      // Search for Google's office in Australia.
        var request = {
          location: mapLarge.getCenter(),
          radius: '500',
          query: 'Google Sydney'
        };

        var service = new google.maps.places.PlacesService(mapLarge);
          service.textSearch(request, callback);
          console.log(callback)
    };

        // Checks that the PlacesServiceStatus is OK, and adds a marker
        // using the place ID and location from the PlacesService.
        function callback(results, status) {
          if (status == google.maps.places.PlacesServiceStatus.OK) {
            var marker = new google.maps.Marker({
              map: mapLarge,
              place: {
                placeId: results[0].place_id,
                location: results[0].geometry.location
              }
            });
          }
        }

    $scope.showCard = function(card) {
      $http.get("/api/v1/cards/" + card.id).then(function(response){
        $scope.card = response.data;
        $scope.transactions = response.data.transactions;
        $scope.merchant = response.data.merchant;
        // $scope.rewardProgressPercentObj = [{
        //   "width" : (response.data.reward_progress * 100).toString() + "%"
        // }];
        // $scope.showCardInfo = !$scope.showCardInfo;
        $scope.showCardInfo = true;
      });

      // $scope.initMap();
    };

    $scope.orderAttribute = "";

    

  });
}());

