$(document).on('page:change', function() {

	//Estilo para Tablas	
	$('#tableMovement').DataTable({
	  // ajax: ...,
	  // autoWidth: false,
	  // pagingType: 'full_numbers',
	  // processing: true,
	  // serverSide: true,

	  // Optional, if you want full pagination controls.
	  // Check dataTables documentation to learn more about available options.
	  // http://datatables.net/reference/option/pagingType
		 "footerCallback": function ( row, data, start, end, display ) {
            var api = this.api(), data;
 
            // Remove the formatting to get integer data for summation
            var intVal = function ( i ) {
                return typeof i === 'string' ?
                    i.replace(/[\$,]/g, '')*1 :
                    typeof i === 'number' ?
                        i : 0;
            };
 
            // Total over all pages
            total = api
                .column( 2 )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
 
            // Total over this page
            pageTotal = api
                .column( 2, { page: 'current'} )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
 
            // Update footer
            $( api.column( 2 ).footer() ).html(
                '$'+pageTotal +' ( $'+ total +' total)'
            );
        },
		 "language": {
	        "sProcessing":    "Procesando...",
	        "sLengthMenu":    "Mostrar _MENU_ registros",
	        "sZeroRecords":   "No se encontraron resultados",
	        "sEmptyTable":    "Ningún dato disponible en esta tabla",
	        "sInfo":          "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
	        "sInfoEmpty":     "Mostrando registros del 0 al 0 de un total de 0 registros",
	        "sInfoFiltered":  "(filtrado de un total de _MAX_ registros)",
	        "sInfoPostFix":   "",
	        "sSearch":        "Buscar:",
	        "sUrl":           "",
	        "sInfoThousands":  ",",
	        "sLoadingRecords": "Cargando...",
	        "oPaginate": {
	            "sFirst":    "Primero",
	            "sLast":    "Último",
	            "sNext":    "Siguiente",
	            "sPrevious": "Anterior"
	        },
	        "oAria": {
	            "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
	            "sSortDescending": ": Activar para ordenar la columna de manera descendente"
			}
	    },
	    "columnDefs": [
		    { "orderable": false, "targets": 3 },
		    { "searchable": false, "targets": 3 }
		]
	});
});