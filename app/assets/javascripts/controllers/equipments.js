'use strict';

angular.module('azordens')
  .controller('EquipmentsCtrl', function($scope, $http, swalService, ngTableService) {
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
        filter: {description: '', model: '', visible: visible},
        sorting: {created_at: 'desc'},
        promise: function(){return $http.get('/equipments.json')},
        successCallback: function(data) {},
        errorCallback: function(error, status) {
          console.log(error, 'Status: ' + String(status));
        }
      });
    }

  });
