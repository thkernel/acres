// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
// require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require bootstrap
//= require DataTables/datatables.min
// require DataTables/Buttons-1.5.1/js/dataTables.buttons.min
//= require DataTables/Buttons-1.5.1/js/buttons.html5.js

//= require DataTables/JSZip-2.5.0/jszip.min
//= require Chart.bundle
//= require highcharts
//= require chartkick

// require "dataTablesFrench"
//= require toastr
//= require rails.validations
//= require chosen-jquery
//= require custom
//= require banks
//= require commissions
//= require google_analytics
//= require commission_change

$(document).on('turbolinks:load', function() {
    // For fixed width containers

    $('#logs-table-list').DataTable({
        "searching": false,
        "ordering": false,
        language: {
            processing: "Traitement en cours...",
            search: "Rechercher&nbsp;:",
            lengthMenu: "Afficher _MENU_ &eacute;l&eacute;ments",
            info: "Affichage de l'&eacute;lement _START_ &agrave; _END_ sur _TOTAL_ &eacute;l&eacute;ments",
            infoEmpty: "Affichage de l'&eacute;lement 0 &agrave; 0 sur 0 &eacute;l&eacute;ments",
            infoFiltered: "(filtr&eacute; de _MAX_ &eacute;l&eacute;ments au total)",
            infoPostFix: "",
            loadingRecords: "Chargement en cours...",
            zeroRecords: "Aucun &eacute;l&eacute;ment &agrave; afficher",
            emptyTable: "Aucune donnée disponible dans le tableau",
            paginate: {
                first: "Premier",
                previous: "Pr&eacute;c&eacute;dent",
                next: "Suivant",
                last: "Dernier"
            },
            aria: {
                sortAscending: ": activer pour trier la colonne par ordre croissant",
                sortDescending: ": activer pour trier la colonne par ordre décroissant"
            }
        },
        responsive: true
        });
    $('#table-list').DataTable({
        
        dom: 'Bfrtip',
        buttons: [
            { extend: 'copyHtml5', footer: true },
            { extend: 'csvHtml5', footer: true },
            { extend: 'pdfHtml5', footer: true }
        ],
        language: {
            processing: "Traitement en cours...",
            search: "Rechercher&nbsp;:",
            lengthMenu: "Afficher _MENU_ &eacute;l&eacute;ments",
            info: "Affichage de l'&eacute;lement _START_ &agrave; _END_ sur _TOTAL_ &eacute;l&eacute;ments",
            infoEmpty: "Affichage de l'&eacute;lement 0 &agrave; 0 sur 0 &eacute;l&eacute;ments",
            infoFiltered: "(filtr&eacute; de _MAX_ &eacute;l&eacute;ments au total)",
            infoPostFix: "",
            loadingRecords: "Chargement en cours...",
            zeroRecords: "Aucun &eacute;l&eacute;ment &agrave; afficher",
            emptyTable: "Aucune donnée disponible dans le tableau",
            paginate: {
                first: "Premier",
                previous: "Pr&eacute;c&eacute;dent",
                next: "Suivant",
                last: "Dernier"
            },
            aria: {
                sortAscending: ": activer pour trier la colonne par ordre croissant",
                sortDescending: ": activer pour trier la colonne par ordre décroissant"
            }
        },
        responsive: true
    });


    $('#echeance-table-list').DataTable({
        
        dom: 'Bfrtip',
        buttons: [
            { extend: 'copyHtml5', footer: true },
            { extend: 'csvHtml5', footer: true },
            { extend: 'pdfHtml5', footer: true }
        ],
        language: {
            processing: "Traitement en cours...",
            search: "Rechercher&nbsp;:",
            lengthMenu: "Afficher _MENU_ &eacute;l&eacute;ments",
            info: "Affichage de l'&eacute;lement _START_ &agrave; _END_ sur _TOTAL_ &eacute;l&eacute;ments",
            infoEmpty: "Affichage de l'&eacute;lement 0 &agrave; 0 sur 0 &eacute;l&eacute;ments",
            infoFiltered: "(filtr&eacute; de _MAX_ &eacute;l&eacute;ments au total)",
            infoPostFix: "",
            loadingRecords: "Chargement en cours...",
            zeroRecords: "Aucun &eacute;l&eacute;ment &agrave; afficher",
            emptyTable: "Aucune donnée disponible dans le tableau",
            paginate: {
                first: "Premier",
                previous: "Pr&eacute;c&eacute;dent",
                next: "Suivant",
                last: "Dernier"
            },
            aria: {
                sortAscending: ": activer pour trier la colonne par ordre croissant",
                sortDescending: ": activer pour trier la colonne par ordre décroissant"
            }
        },
        "aaSorting": [],
        columnDefs: [ {
            'targets': 0, // column index (start from 0)
            'orderable': false, // set orderable false for selected columns
         }],
        responsive: true
    });



    $("#search-button").click(function() {
        
       // $("#table-list").DataTable().destroy();
        //fill_data();
       
    });

    function fill_data(){
        $('#table-list').DataTable({
       
            dom: 'Bfrtip',
            buttons: [
                { extend: 'copyHtml5', footer: true },
                { extend: 'csvHtml5', footer: true },
                { extend: 'pdfHtml5', footer: true }
            ],
            language: {
                processing: "Traitement en cours...",
                search: "Rechercher&nbsp;:",
                lengthMenu: "Afficher _MENU_ &eacute;l&eacute;ments",
                info: "Affichage de l'&eacute;lement _START_ &agrave; _END_ sur _TOTAL_ &eacute;l&eacute;ments",
                infoEmpty: "Affichage de l'&eacute;lement 0 &agrave; 0 sur 0 &eacute;l&eacute;ments",
                infoFiltered: "(filtr&eacute; de _MAX_ &eacute;l&eacute;ments au total)",
                infoPostFix: "",
                loadingRecords: "Chargement en cours...",
                zeroRecords: "Aucun &eacute;l&eacute;ment &agrave; afficher",
                emptyTable: "Aucune donnée disponible dans le tableau",
                paginate: {
                    first: "Premier",
                    previous: "Pr&eacute;c&eacute;dent",
                    next: "Suivant",
                    last: "Dernier"
                },
                aria: {
                    sortAscending: ": activer pour trier la colonne par ordre croissant",
                    sortDescending: ": activer pour trier la colonne par ordre décroissant"
                }
            },
            responsive: true
        });

    }

});

// Enable chosen js for turbolinks
$(document).on('turbolinks:load', function() {
	$('.chosen-select').chosen({
	allow_single_deselect: true,
	max_selected_options: 10,
    no_results_text: 'Aucun resultat',
    width: '100%'

	});
});
/*$(document).on('turbolinks:load', function() {
    $('#table-list').DataTable( {
        dom: 'Bfrtip',
        buttons: [
            'copy', 'csv', 'excel', 'pdf', 'print'
        ]
    } );
} );*/



  // Enable chosen js for turbolinks
$(document).on('turbolinks:load', function() {
	$('#bank-modal').on('shown.bs.modal', function() {
        $("#bank_commission_percentage").on('focusout', function(){
            $("#bank_date_effet").css("visibility", "visible");
            $("#bank_date_effet").css("display", "block");
        });

        $("#bank_first_installment").on('focusout', function(){
            bank_first_installment = $('#bank_first_installment').val();
            if (bank_first_installment >= 1 && bank_first_installment <= 100){
                bank_number_of_remaining_days = 100 - bank_first_installment ;
                $("#bank_number_of_remaining_days").val(bank_number_of_remaining_days);
            }
            
        });

      
    })
});

$(document).on('turbolinks:load', function(){
  
    $("#chkHiddable").click(function () {
        if ($(this).is(":checked")) {
            $(".hiddable").hide();
        } else {
          

            $(".hiddable").show();
        }
        //alert("hello clickable");
    });

    $("#chkCreditAmount").click(function () {
        if ($(this).is(":checked")) {
            $(".table-credit-amount").hide();
        } else {
          

            $(".table-credit-amount").show();
        }
        //alert("hello clickable");
    });

    $("#chkAmountCommissions").click(function () {
        if ($(this).is(":checked")) {
            $(".table-amount-commissions").hide();
        } else {
          

            $(".table-amount-commissions").show();
        }
        //alert("hello clickable");
    });

    $("#chkAmountCompany").click(function () {
        if ($(this).is(":checked")) {
            $(".table-amount-company").hide();
        } else {
          

            $(".table-amount-company").show();
        }
        //alert("hello clickable");
    });

    $("#chkAmountProducer").click(function () {
        if ($(this).is(":checked")) {
            $(".table-amount-producer").hide();
        } else {
          

            $(".table-amount-producer").show();
        }
        //alert("hello clickable");
    });
    
    $("#chkAmountContributor").click(function () {
        if ($(this).is(":checked")) {
            $(".table-amount-contributor").hide();
        } else {
          

            $(".table-amount-contributor").show();
        }
        //alert("hello clickable");
    });



   
})

$(document).on('turbolinks:load',function() {
    $("#search-button").click(function() {
        //$("#table-list").DataTable().fnReloadAjax();
        //$('#table-list').DataTable().ajax.reload();
        //alert("Humm, search");
        //var oTable = $('#table-list').dataTable();   //pay attention to capital D, which is mandatory to retrieve "api" datatables' object, as @Lionel said
        //oTable.search($(this).val()).draw() 
       // oTable.ajax.reload(null, true);
    });
});

$(document).on("turbolinks:before-cache", function() {
    var dataTable = $('#table-list').DataTable();


  if (dataTable !== null) {
   dataTable.destroy();
   dataTable = null;
   
  }
});
$(document).on('turbolinks:load', function(){
    $('#myTabs a').click(function (e) {
        e.preventDefault()
        $(this).tab('show')
      })
})