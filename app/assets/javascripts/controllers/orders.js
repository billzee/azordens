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
        filter: {id: '', customer_id: '', status: '', created_at: '', visible: visible},
        sorting: {created_at: 'desc'},
        promise: function(){return $http.get('/orders.json', {params: {date: date}});},
        successCallback: function(data) {
          $scope.total = 0;

          for(var i = 0; i < data.length; i++){
            if(data[i].value && data[i].value !== 'null'){
              var c = parseInt(data[i].value.replace(',', '.'));
              $scope.total += c;
            }
          }
        },
        errorCallback: function(error, status) {
          console.log(error, 'Status: ' + String(status));
        }
      });
    };

    $scope.initializeTable();
  });
