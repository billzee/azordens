'use strict';

angular.module('azordens')
  .controller('BrandsCtrl', function($scope, $http, swalService, ngTableService) {
    $scope.showHidden = false;
    $scope.date = {start: null, end: null};

    $scope.initializeTable = function(date){
      var visible;
      var date;

      if($scope.showHidden){
        visible = '';
      } else{
        visible = true;
      }

      if($scope.date && ($scope.date.start && $scope.date.end)){
        date = $scope.date;
      } else{
        date = null;
      }

      $scope.ngTableParams =
      ngTableService.newTable({
        filter: {name, visible: visible},
        sorting: {created_at: 'desc'},
        promise: function(){return $http.get('brands.json', {params: {date: date}});},
        successCallback: function(data) {},
        errorCallback: function(error, status) {
          console.log(error, 'Status: ' + String(status));
        }
      });
    };

    $scope.initializeTable();
  });
