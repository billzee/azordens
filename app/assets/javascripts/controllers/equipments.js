'use strict';

angular.module('azordens')
  .controller('EquipmentsCtrl', function($scope, $http, swalService, ngTableService) {

      $scope.ngTableParams =

      ngTableService.newTable({
        filter: {description: '', model: ''},
        promise: function(){return $http.get('/equipments.json')},
        successCallback: function(data) {},
        errorCallback: function(error, status) {
          console.log(error, 'Status: ' + String(status));
        }
      });

    $scope.delete = function(id, route){
      swalService.delete(id, route);
    }

  });
