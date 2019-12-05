
$(document).on('turbolinks:load', function() {
   
 $("#excercises_list").on("change", function() {
    $.ajax({
        type: "POST",
        headers: {
            'X-CSRF-Token': document.querySelector("meta[name=csrf-token]").content
          },
        dataType: 'script',
        url: "/excercise_years/change_current_excercise",
        data: { current_excercise: $('#excercises_list option:selected').val()},
        success: function(repsonse){},
        error: function(repsonse){}
      });
 });
});