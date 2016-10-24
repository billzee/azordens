'use strict';

angular.module('azordens')
  .controller('MainCtrl', function($scope, $window, $location, swalService) {
    $('select').selectpicker();

    $scope.print = function(){
      $window.print();
    }

    $scope.go = function(route, id){
      var path = route + '/' + id + '/edit';
      $window.location.href = path;
    };
  });
