'use strict';

angular.module('azordens')
  .controller('BrandsCtrl', function($scope, $http, swalService, ngTableService) {

      $scope.ngTableParams =

      ngTableService.newTable({
        filter: {name},
        promise: function(){return $http.get('/brands.json')},
        successCallback: function(data) {},
        errorCallback: function(error, status) {
          console.log(error, 'Status: ' + String(status));
        }
      });

    $scope.delete = function(id, route){
      swalService.delete(id, route);
    }

  });
