'use strict';

angular.module('azordens')
  .controller('CustomersCtrl', function($scope, $http, swalService, ngTableService) {
    $scope.showHidden = false;

    $scope.initializeTable = function(){
      var visible;
      if($scope.showHidden){
        visible = '';
      } else{
        visible = true;
      }

      $scope.ngTableParams =
      ngTableService.newTable({
        filter: {first_name: '', email: '', phone: '', created_at: '', visible: visible},
        sorting: {created_at: 'desc'},
        promise: function(){return $http.get('/customers.json')},
        successCallback: function(data) {},
        errorCallback: function(error, status) {
          console.log(error, 'Status: ' + String(status));
        }
      });
    }

  });
