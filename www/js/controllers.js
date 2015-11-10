angular.module('starter.controllers', [])


.controller('DashCtrl', function($scope,$http) {
    
})

.controller('ChatsCtrl', function($scope,$http) {    
    $scope.addresses = [];
    var address; 

    $http
	.get('http://sosserver.us/get',{ cache: false })
	.then(
	    function(resp) {
		var status, res =  resp.data;
		var response;
		for (var i in res){
		    address = {"place_id":0,"address":"","location":{"lat":0,lng:0}}
		    response = res[i]	
		    abrigo= response.abrigo;	 
		    address.address  = response.formatted_address;
		    address.location = response.geometry.location; 
		    address.place_id = response.place_id; 
		    address.abrigo=abrigo
		    $scope.addresses.push(address);
		}	    
	    }, 
	    function(err) {
		
	    }
	);	
}
)

.controller('ChatDetailCtrl', function($scope,$window, $http,$ionicLoading, $stateParams) {
 
    $scope.addresses = [];
    $scope.map;
    var address = {"place_id":0,"address":"","location":{"lat":0,lng:0}}
    $http.get('http://sosserver.us/getlocation/'+$stateParams.placeId+"/")
	.then(function(resp) {
	    
	var status, res =  resp.data;
	response=res[0]
	address.address = response.formatted_address;
	address.location = response.geometry.location; 
	address.place_id = response.place_id; 
        address.abrigo=response.abrigo
	$scope.addresses.push(address);

	var myLatlng = new google.maps.LatLng(address.location.lat,address.location.lng);
	
        var mapOptions = {
            center: myLatlng,
            zoom: 16,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };
	
	$scope.map = new google.maps.Map(document.getElementById("map"),mapOptions);

	var marker = new google.maps.Marker({
            position: myLatlng,
            map: $scope.map,
            title: address.address
	});


    }, function(err) {
	console.error('ERR', err);

    })

    //angular.module('ionicApp', [])
 


  
//}tv
        
        
	$scope.map = map;

  
   // }


    $scope.findShelter = function(){
	console.log("center map")
	if(!$scope.map){
	    return;
	}

	$scope.map.setCenter(new google.maps.LatLng(address.location.lat,address.location.lng));

    }


    $scope.findme = function(){
	if(!$scope.map){
	    return;
	}
	$scope.loading = $ionicLoading.show({
            content: 'Carregado...',
            showBackdrop: false
        });

        navigator.geolocation.getCurrentPosition(function(pos) {
            $scope.map.setCenter(new google.maps.LatLng(pos.coords.latitude, pos.coords.longitude));
            $scope.loading.hide();
        }, function(error) {
            alert('Unable to get location: ' + error.message);
	    $ionicLoading.hide();
        });
      };
    

 
    //google.maps.event.addDomListener($window, 'load', initialize);


})
.controller('AccountCtrl', function($scope) {
	$scope.settings = {
	    enableFriends: true
  };
});
