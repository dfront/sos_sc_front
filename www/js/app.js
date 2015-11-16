angular.module('starter', ['ionic', 'starter.controllers', 'starter.services'])

    .run(function($ionicPlatform,$rootScope, $templateCache) {
	$ionicPlatform.ready(function() {
	    
	    if (window.cordova && window.cordova.plugins && window.cordova.plugins.Keyboard) {
		cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true);
		cordova.plugins.Keyboard.disableScroll(true);
	    }
	    if (window.StatusBar) {
		
		StatusBar.styleLightContent();
	    }
	    $rootScope.$on('$viewContentLoaded', function() {
		$templateCache.removeAll();
	    });
	    
	    $rootScope.$on('$viewContentLoaded', function() {
		$templateCache.removeAll();
	    });
	});
    })

    .config(function($stateProvider, $urlRouterProvider) {
	
	$stateProvider
	    .state('tab', {
		url: '/tab',
		abstract: true,
		templateUrl: 'templates/tabs.html'
	    })
	
	    .state('tab.shelters', {
		url: '/shelters',
		views: {
		    'tab-shelter': {
			templateUrl: 'templates/shelters.html',
			controller: 'ShelterCtrl'
		    }
		}
	    })
	    .state('tab.shelters-list', {
		cache: false,
		url: '/shelters/list/:countryShortName',
		views: {
		    'tab-shelter': {
			templateUrl: 'templates/shelter_list.html',
			controller: 'ShelterListCtrl'
		    }
		}
	    })
	    .state('tab.shelter-detail', {
		cache: false,
		url: '/shelter/:placeId',
		views: {
		    'tab-shelter': {
			templateUrl: 'templates/shelter_detail.html',
			controller: 'ShelterDetailCtrl'
		    }
		}
	    });
	
	$urlRouterProvider.otherwise('/tab/shelters');
	
    });
