'use strict';

angular.module('azordens')
  .controller('BrandsCtrl', function($scope, $http, swalService, ngTableService) {
    console.log('brands');

      $scope.ngTableParams =

      ngTableService.newTable({
        // sorting: {'accounts.created_at': 'desc'},
        page: 1,
        count: 2,
        filter: {name},
        promise: function(){return $http.get('/brands.json')},
        successCallback: function(data) {
          console.log(data);
        },
        errorCallback: function(error, status) {
          console.log(error, 'Status: ' + String(status));
        }
      });

    $scope.delete = function(id, route){
      swalService.delete(id, route);
    }

  });
