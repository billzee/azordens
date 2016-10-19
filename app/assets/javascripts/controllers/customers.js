'use strict';

angular.module('azordens')
  .controller('CustomersCtrl', function($scope, $http, swalService, ngTableService) {

    $scope.ngTableParams =

    ngTableService.newTable({
      filter: {first_name: '', email: '', phone: '', created_at: ''},
      sorting: {created_at: 'desc'},
      promise: function(){return $http.get('/customers.json')},
      successCallback: function(data) {},
      errorCallback: function(error, status) {
        console.log(error, 'Status: ' + String(status));
      }
    });

    $scope.delete = function(id, route){
      swalService.delete(id, route);
    }

  });