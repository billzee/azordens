'use strict';

angular.module('azordens')
  .controller('BrandsCtrl', function($scope, swalService) {

    $scope.delete = function(brand){
      swalService.delete(brand, 'brands');
    }
  });
