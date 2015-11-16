angular.module('starter.controllers', [])


.controller('ShelterCtrl', function($scope,$http) {
    $scope.addresses = [];
    $scope.page_title="Estados em emergência"
    $scope.page_description="selecione o Estado"
    var address; 

    $http
	.get('http://danielcorbe.pythonanywhere.com/shelters',{ cache: false })
	.then(
	    function(resp) {
		var status, res =  resp.data;
		var response;
		for (var i in res){		   
		    response = res[i];		    
		    $scope.addresses.push(response);
		}	    
	    }, 
	    function(err) {
		
	    }
	);	

    
})

.controller('ShelterListCtrl', function($scope,$http,$ionicLoading, $stateParams) {    
    $scope.addresses = [];
    $scope.page_title="Listagem de abrigos"
    $scope.page_description="selecione o Estado"

    var address; 

    $http
	.get('http://danielcorbe.pythonanywhere.com/sheltersList/'+$stateParams.countryShortName,{ cache: false })
	.then(
	    function(resp) {
		var status, res =  resp.data;
		var response;
		for (var i in res){
		    address = {"place_id":0,"address":"","location":{"lat":0,lng:0}}
		    response = res[i];		   	 
		    address.address  = response.formatted_address;
		    address.location = response.geometry.location; 
		    address.place_id = response.place_id; 
		    address.shelter=response.abrigo;
		    $scope.addresses.push(address);
		}	    
	    }, 
	    function(err) {
		
	    }
	);	
}
)

.controller('ShelterDetailCtrl', function($scope,$window, $http,$ionicLoading, $stateParams) {
 
    $scope.addresses = [];
    $scope.map;
    var address = {"place_id":0,"address":"","location":{"lat":0,lng:0}}
    $http.get('http://danielcorbe.pythonanywhere.com/shelterDetail/'+$stateParams.placeId+"/")
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


});
