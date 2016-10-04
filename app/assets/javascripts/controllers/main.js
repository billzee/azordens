'use strict';

angular.module('azordens')
  .controller('MainCtrl', function($scope, swalService) {

    $scope.delete = function(id, route){
      swalService.delete(id, route);
    }
  });
