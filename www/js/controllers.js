angular.module('starter.controllers', [])

.controller('DashCtrl', function($scope,$http) {
    
})

.controller('ChatsCtrl', function($scope,$http) {
    
    $scope.addresses = [];

    var address;

    $http.get('http://helpsystem.tk/static/json/abrigos_template.json').then(function(resp) {

	var status, res =  resp.data;
	var response;
	for (var i in res){
	    address = {"place_id":0,"address":"","location":{"lat":0,lng:0}}
	    
	    response = res[i]

	   
	address.address = response.formatted_address;
	address.location = response.geometry.location; 
	address.place_id = response.place_id; 

	$scope.addresses.push(address);
	}

    }, function(err) {
	console.error('ERR', err);
	
    })
})

.controller('ChatDetailCtrl', function($scope,$window, $http,$ionicLoading, $stateParams) {
 
    $scope.addresses = [];
    var address = {"place_id":0,"address":"","location":{"lat":0,lng:0}}
    $http.get('http://helpsystem.tk/getlocation/'+$stateParams.placeId+"/").then(function(resp) {

	var status, res =  resp.data;
	response=res[0]
	address.address = response.formatted_address;
	address.location = response.geometry.location; 
	address.place_id = response.place_id; 
	$scope.addresses.push(address);

	var myLatlng = new google.maps.LatLng(address.location.lat,address.location.lng);
	
        var mapOptions = {
            center: myLatlng,
            zoom: 16,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };
	
	var map = new google.maps.Map(document.getElementById("map"),mapOptions);

	var marker = new google.maps.Marker({
            position: myLatlng,
            map: map,
            title: address.address
	});


    }, function(err) {
	console.error('ERR', err);
	
    })

    //angular.module('ionicApp', [])
 


  
//}
        
        
	$scope.map = map;

  
   // }
 
    //google.maps.event.addDomListener($window, 'load', initialize);


})
.controller('AccountCtrl', function($scope) {
	$scope.settings = {
	    enableFriends: true
  };
});
