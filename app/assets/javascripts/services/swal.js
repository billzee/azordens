'use strict';

angular.module('azordens')
.service('swalService', function() {

  this.delete = function() {
    swal(
      {
        title: "Tem certeza?",
        text: "Não será possível recuperar o registro após a exclusão!",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "Sim, excluir",
        closeOnConfirm: false
      },
      function(){
        swal("Excluído!", "", "success");
      }
    );
  };

});
