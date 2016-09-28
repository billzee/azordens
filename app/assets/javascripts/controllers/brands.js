'use strict';

angular.module('azordens')
  .controller('BrandsCtrl', function($scope) {
    console.log('controlelr');
    $scope.delete = function(brand){
      console.log(brand);
    }
  });
