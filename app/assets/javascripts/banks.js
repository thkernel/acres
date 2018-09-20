
$(document).on('turbolinks:load', function(){

    $('#modal-content').on('shown.bs.modal', function() {
		$("#txtname").focus();
	})
  
   
  });