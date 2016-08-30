angular.module('azordens', ['ui.router'])
.config(function($stateProvider, $urlRouterProvider) {
  $stateProvider

    .state('app', {
      url: '/app',
      templateUrl: 'templates/main.html',
      controller: 'mainCtrl'
    })
/*
    .state('app.home', {
      url: '/brands',
      templateUrl: 'templates/fornecedores.html',
      controller: 'supplierCtrl'
    })*/


  $urlRouterProvider.otherwise('/app');
});