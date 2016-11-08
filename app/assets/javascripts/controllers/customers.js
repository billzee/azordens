'use strict';

angular.module('azordens')
  .controller('CustomersCtrl', function($scope, $http, swalService, ngTableService) {
    $scope.showHidden = false;
    $scope.date = {start: null, end: null};

    $scope.initializeTable = function(){
      var visible;
      var date;

      if($scope.showHidden){
        visible = '';
      } else{
        visible = true;
      }

      if($scope.date && ($scope.date.start && $scope.date.end)){
        date = $scope.date;
        date.end.setDate(date.end.getDate() + 1);
      } else{
        date = null;
      }

      $scope.ngTableParams =
      ngTableService.newTable({
        filter: {first_name: '', email: '', phone: '', created_at: '', visible: visible},
        sorting: {created_at: 'desc'},
        promise: function(){return $http.get('/customers.json', {params: {date: date}});},
        successCallback: function(data) {},
        errorCallback: function(error, status) {
          console.log(error, 'Status: ' + String(status));
        }
      });
    };

    $scope.initializeTable();
  });
