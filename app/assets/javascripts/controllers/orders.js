'use strict';

angular.module('azordens')
  .controller('OrdersCtrl', function($scope, $http, swalService, ngTableService) {

    $scope.filterOptions =
    [
      {id: '', title: 'Todos'},
      {id: 'Aberta', title: 'Aberta'},
      {id: 'Em progresso', title: 'Em progresso'},
      {id: 'Concluída', title: 'Concluída'},
      {id: 'Entregue', title: 'Entregue'},
      {id: 'Fechada', title: 'Fechada'},
      {id: 'Cancelada', title: 'Cancelada'},
    ];

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
        filter: {id: '', customer_id: '', status: '', created_at: '', visible: visible},
        sorting: {created_at: 'desc'},
        promise: function(){return $http.get('/orders.json')},
        successCallback: function(data) {},
        errorCallback: function(error, status) {
          console.log(error, 'Status: ' + String(status));
        }
      });
    };

    $scope.initializeTable();
  });
