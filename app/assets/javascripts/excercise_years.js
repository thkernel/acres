
$(document).on('turbolinks:load', function() {
    /*$("#client_selection").change(function() {
        $.ajax({
        url: "/factures/get_montant",
        dataType: "script",
        data:{ client_id: $('#client_selection option:selected').val()}
        });
    )};*/
 $("#excercises_list").on("change", function() {
    $.ajax({
        type: "POST",
        dataType: 'script',
        url: "/excercise_years/change_current_excercise",
        data:{ current_excercise: $('#excercises_list option:selected').val()},
        success: function(repsonse){alert(response);},
        error: function(repsonse){}
      });
 });
});