'use strict';

angular.module('azordens')
  .controller('MainCtrl', function($scope, $window, swalService) {
    $('select').selectpicker();

    $scope.delete = function(id, route){
      swalService.delete(id, route);
    }

  });
