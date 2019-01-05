/* Commissions JS */

$(document).on('turbolinks:load', function(){

    $("#search-button").click(function(){
        $("#commissions-datatable").DataTable().ajax.reload();
    });
    $("#commissions-datatable").DataTable({
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
     
        "processing": true,
        "serverSide": true,
        "dataType": "json",
        "ajax": $('#commissions-datatable').data('source'),
        "columns": [
           
            {"data": 'amount_credit'},
            {"data": "production_date"},
            {"data": "acte_date"},
            {"data": "bank_name"},
            {"data": 'credit_id'},
            {"data": "contributor_name"},
            {"data": "contributor_commission_percentage"},
            {"data": "contributor_commission"},
            {"data": "producer_name"},
            {"data": "producer_commission_percentage"},
            {"data": "producer_commission"},
            {"data": "company_commission_percentage"},
            {"data": "bank_commission"},
            {"data": "company_commission"}
                
                
            ]
        

        ,
        
            

        responsive: true
    });
});