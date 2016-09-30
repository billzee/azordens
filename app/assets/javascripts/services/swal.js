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
        $http({method: 'DELETE', url: '/'+ path + '/'+ id +'.json',  headers: {'Content-Type': 'application/json'}, data: ''});
        swal("Excluído!", "", "success");
      }
    );
  };

});
