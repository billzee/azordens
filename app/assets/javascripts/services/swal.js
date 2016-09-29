'use strict';

angular.module('azordens')
.service('swalService', function($http) {

  this.delete = function(id, path) {
    swal(
      {
        title: "Tem certeza?",
        text: "Não será possível recuperar o registro após a exclusão!",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "Sim, excluir",
        cancelButtonText: "Cancelar",
        closeOnConfirm: false
      },
      function(){
        $http.delete('/'+ path + '/' + id + '.json');
        swal("Excluído!", "", "success");
      }
    );
  };

});
