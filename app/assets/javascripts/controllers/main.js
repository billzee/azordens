'use strict';

angular.module('azordens')
  .controller('MainCtrl', function($scope, swalService) {

    $scope.delete = function(brand){
      swalService.delete(brand, 'brands');
    }
  });
