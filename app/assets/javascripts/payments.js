$(document).on('turbolinks:load', function() {
    // For fixed width containers

    $('#commission_by_bank_table').DataTable({
        "ordering": false,
        language: {
            "decimal": ",",
            "thousands": ".",
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
        responsive: true,

        "footerCallback": function ( row, data, start, end, display ) {
            var api = this.api(), data;
            
            				//Remove the formatting to get integer data for summation
				var intVal = function ( i ) {
					return typeof i === 'string' ?
						i.replace('.','').replace(/[\$,]/g, '.')*1 :
						typeof i === 'number' ?
							i : 0;
				};

 
            // Total over all pages
            /*total = api
                .column(4)
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );*/
 
            // Total over this page
            bank_commission_total = api
                .column( ".bank_commission", { page: 'current'} )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );

                        // Total over this page
            company_commission_total = api
                .column( ".company_commission", { page: 'current'} )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
 
 
            // Update footer
            $(api.column( ".bank_commission" ).footer() ).html(
                    //pageTotal.toFixed(2)
                    currency(bank_commission_total, {decimal: ',', separator: '.'}).format()
            );

            // Update footer
            $(api.column( ".company_commission" ).footer() ).html(
                    //pageTotal.toFixed(2)
                    currency(company_commission_total, {decimal: ',', separator: '.'}).format()
            );
        }
    });
});
