'use strict';

angular.module('azordens')
  .controller('MainCtrl', function($scope, $window, $location, swalService) {
    $('select').selectpicker();

    $scope.print = function(){
      $window.print();
    }

    $scope.go = function(route, id){
      var path = route + '/' + id + '/edit';
      $window.location.href = path;
    };

    $scope.showHints = function(){
      var msg = 'Siga as etapas e utilize "azordens" como um Pro! <br /><br />' +
      '<div class="text-left"><ol><li class="m-10"><a href="/customers/new">crie</a> seu primeiro cliente</li>'+
      '<li class="m-10"><a href="/brands/new">crie</a> sua primeira marca</li>' +
      '<li class="m-10">adicione um <a href="/equipments/new">novo equipamento</a> para sua marca</li>' +
      '<li class="m-10"><a href="/orders/new">abra sua primeira OS</a>!</li></ol></div>'
      swal(
        {
          title: 'Seja bem-vindo!',
          text: msg,
          html: true,
          confirmButtonColor: '#ff6600',
          confirmButtonText: 'OK!',
          showCancelButton: false,
          closeOnConfirm: true
        }
      );
    };
  });
