(function() {
  "use strict";

  angular.module("app", ['ui.materialize']).controller("consumersCtrl", function($scope, $http){

    $scope.setup = function(consumerId) {
      $http.get("/api/v1/consumers/" + consumerId).then(function(response){
        $scope.consumer = response.data;
        $scope.cards = response.data.cards;
        $scope.showCardInfo = true;
        
        $scope.rewardProgressPercentObj = [];
        for(var i = 0; i < $scope.cards.length; i++) {
          $scope.rewardProgressPercentObj.push({"width" : ($scope.cards[i].reward_progress * 100).toString() + "%"});
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
      var uluru = {lat: 37.791899, lng: -122.421497};

      var mapLarge = new google.maps.Map(document.getElementById('mapLarge'), {
        zoom: 15,
        center: uluru
      });

      var infowindow = new google.maps.InfoWindow();
      var service = new google.maps.places.PlacesService(mapLarge);

        service.getDetails({
          placeId: 'ChIJj-FdH-uAhYARIp6mvqK3HNM'
        }, function(place, status) {
          if (status === google.maps.places.PlacesServiceStatus.OK) {
            var marker = new google.maps.Marker({
              map: mapLarge,
              position: place.geometry.location
            });
            google.maps.event.addListener(marker, 'click', function() {
              infowindow.setContent('<div><strong>' + place.name + '</strong><br>' +
                'Place ID: ' + place.place_id + '<br>' +
                place.formatted_address + '</div>');
              infowindow.open(mapLarge, this);
            });
          }
        });
      };

    $scope.showCard = function(card) {
      $http.get("/api/v1/cards/" + card.id).then(function(response){
        $scope.card = response.data;
        $scope.transactions = response.data.transactions;
        $scope.merchant = response.data.merchant;
        // $scope.rewardProgressPercentObj = [{
        //   "width" : (response.data.reward_progress * 100).toString() + "%"
        // }];
        // $scope.showCardInfo = !$scope.showCardInfo;
        // $scope.showCardInfo = true;
      });

      // $scope.initMap();
    };
    

  });
}());

