'use strict';

angular.module('azordens')
.service('swalService', function($http, $window) {

  this.delete = function(id, path) {
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
        $http.delete('/'+ path + '/'+ id +'.json')
        .success(function(){
          swal({title:'Excluído!', text: '', type: 'success'},
          function(){
            $window.location.reload();
          });
        })
        .error(function(){
          swal('Erro', 'O registro não foi excluído', 'error');
        });
      }
    );
  };

});
