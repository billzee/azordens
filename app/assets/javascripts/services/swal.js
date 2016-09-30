'use strict';

angular.module('azordens')
.service('swalService', function($http) {

  this.delete = function(id, path) {
    console.log(id);
    swal(
      {
        title: "Tem certeza?",
        text: "Não será possível recuperar o registro após a exclusão!",
        type: "warning",
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "Sim, excluir",
        cancelButtonText: "Cancelar",
        showCancelButton: true,
        closeOnConfirm: false
      },
      function(){
        $http.delete('/'+ path + '/'+ id +'.json')
        .then(function(){
          swal("Excluído!", "", "success");
        });
      }
    );
  };

});
