//Override the default confirm dialog by rails
$.rails.allowAction = function(link){
  if (link.data("confirm") == undefined){
    return true;
  }
  $.rails.showConfirmationDialog(link);
  return false;
}
//User click confirm button
$.rails.confirmed = function(link){
  link.data("confirm", null);
  link.trigger("click.rails");
}
//Display the confirmation dialog
$.rails.showConfirmationDialog = function(link){
  var message = link.data("confirm");
  swal(
    {
      title: 'Tem certeza?',
      text: message,
      type: 'warning',
      confirmButtonColor: '#a94442',
      confirmButtonText: 'Sim',
      cancelButtonText: 'Cancelar',
      showCancelButton: true,
      closeOnConfirm: false
    },
    function(){
      $.rails.confirmed(link);
    }
  );
}
