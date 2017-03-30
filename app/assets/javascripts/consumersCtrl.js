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

          // last ditch google maps attempt
          
        }


      });

// setup bobs donuts first
      $http.get("/api/v1/cards/1").then(function(response){
        $scope.card = response.data;
        $scope.transactions = response.data.transactions;
        $scope.merchant = response.data.merchant;
        $scope.merchantLogo = response.data.image;
      });


        $scope.firstMap = function(index) {
          if (index == 1) {
            return true;
          }
        };
    };

    $scope.initSmallMap = function(card) {
      $http.get("/api/v1/cards/" + card.id).then(function(response){
        $scope.mapCard = response.data;
        $scope.google_place_id = response.data.google_place_id;
        $scope.smallMapLat = response.data.lat;
        $scope.smallMapLng = response.data.lng;
      });
        var uluru = {lat: Number($scope.smallMapLat), lng: Number($scope.smallMapLng)};
        var mapSmall = new google.maps.Map(document.getElementById('mapSmall'), {
          zoom: 15,
          center: uluru
        });
        
        var infowindow = new google.maps.InfoWindow();
        var service = new google.maps.places.PlacesService(mapSmall);

          service.getDetails({
            placeId: $scope.google_place_id
          }, function(place, status) {
            if (status === google.maps.places.PlacesServiceStatus.OK) {
              var marker = new google.maps.Marker({
                map: mapSmall,
                position: place.geometry.location
              });
              google.maps.event.addListener(marker, 'click', function() {
                infowindow.setContent('<div><strong>' + place.name + '</strong><br>' +
                  'Place ID: ' + place.place_id + '<br>' +
                  place.formatted_address + '</div>');
                infowindow.open(mapSmall, this);
              });
            }
          });
      };

    $scope.initLargeMap = function(card) {
      $http.get("/api/v1/cards/" + card.id).then(function(response){
        $scope.google_place_id = response.data.google_place_id;
        $scope.largeMapLat = response.data.lat;
        $scope.largeMapLng = response.data.lng;
        console.log($scope.largeMapLat);
      });
      // console.log(google_place_id);
      var uluru = {lat: Number($scope.largeMapLat), lng: Number($scope.largeMapLng)};

      var mapLarge = new google.maps.Map(document.getElementById('mapLarge'), {
        zoom: 15,
        center: uluru
      });

      var infowindow = new google.maps.InfoWindow();
      var service = new google.maps.places.PlacesService(mapLarge);

        service.getDetails({
          placeId: $scope.google_place_id
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
        $scope.merchantLogo = response.data.image;
      });
    };
    

  });
}());

