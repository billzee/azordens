'use strict';

angular.module('azordens')
  .controller('OrdersCtrl', function($scope, $http, swalService, ngTableService) {

    $scope.ngTableParams =

    ngTableService.newTable({
      filter: {id: '', customer_id: '', status: '', created_at: ''},
      sorting: {created_at: 'desc'},
      promise: function(){return $http.get('/orders.json')},
      successCallback: function(data) {},
      errorCallback: function(error, status) {
        console.log(error, 'Status: ' + String(status));
      }
    });

    $scope.delete = function(id, route){
      swalService.delete(id, route);
    }

  });
