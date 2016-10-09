'use strict';

angular.module('azordens')
.service('swalService', function($http, $window) {

  this.delete = function(id, route) {
    swal(
      {
        title: 'Tem certeza?',
        text: 'Não será possível recuperar o registro após a exclusão!',
        type: 'warning',
        confirmButtonColor: '#DD6B55',
        confirmButtonText: 'Sim, excluir',
        cancelButtonText: 'Cancelar',
        showCancelButton: true,
        closeOnConfirm: false
      },
      function(){
        $http.delete('/'+ route + '/'+ id +'.json')
        .success(function(){
          swal({title:'Excluído!', text: '', type: 'success'},
          function(){
            if(route === 'orders'){
              $window.location.href('/orders/');
            } else{
              $window.location.reload();
            }
          });
        })
        .error(function(){
          swal('Erro', 'O registro não foi excluído', 'error');
        });
      }
    );
  };

});
