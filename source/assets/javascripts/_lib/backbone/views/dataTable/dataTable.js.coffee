##
# DataTable
#
# @author Ian Warner <ian.warner@drykiss.com>
# @see    https://www.datatables.net/
##
class App.Views.DataTable extends Backbone.View

    ##
    # Render
    ##
    render : ->

        ##
        # Create the table
        # @see Options : https://www.datatables.net/reference/option/
        ##
        dataTable = $( "#dataTable" ).DataTable

            columnDefs    : [ {
                visible : false
                targets : 2
            } ]

            colVis        :
                restore  : 'Restore'
                showAll  : 'Show all'
                showNone : 'Show none'

            # Defer Rendering
            "deferRender" : true # https://datatables.net/reference/option/deferRender

            # Dom
            "dom"         : "RT<\"clear\">lfrtC<\"clear\">ip"

            # Column Ordering
            "order"       : [[ 0, "desc" ]]

            # Paging
            # paging        : true

            # Table Tools - Download
            "tableTools"  : "sSwfPath" : "/assets/swf/copy_csv_xls_pdf.swf"

            # Enable Scrolling
            # scrollY       : 300

        # Debug
        # log.info dataTable.order() # https://datatables.net/reference/api/order()

        # Language Options
        # $( "#dataTable" ).DataTable
        #     'language' :
        #         'url' : 'dataTables.german.lang'

        # Column Visibility Options
        # $( "#dataTable" ).DataTable
        #     dom        : 'C<"clear">lfrtip'
        #     columnDefs : [ {
        #         visible : false
        #         targets : 2
        #     } ]
        #     colVis     :
        #         restore  : 'Restore'
        #         showAll  : 'Show all'
        #         showNone : 'Show none'

        # Alphabet Search
        # https://www.datatables.net/blog/2014-09-22

        # var table = $( "#dataTable" ).DataTable( {
        #     dom: 'RC<"clear">lfrtip',
        #     columnDefs: [
        #         { visible: false, targets: 1 }
        #     ]
        # } );

        # // Setup - add a text input to each footer cell
        # $( "#example tfoot th" ).each( function () {
        #     var title = $('#example thead th').eq( $(this).index() ).text();
        #     $(this).html( '<input type="text" placeholder="Search '+title+'" />' );
        # } );

        # // DataTable
        # var table = $( "#dataTable" ).DataTable( {
        #     dom: 'Rlfrtip'
        # } );

        # // Apply the filter
        # $( "#example tfoot input" ).on( 'keyup change', function () {
        #     table
        #         .column( $(this).parent().index()+':visible' )
        #         .search( this.value )
        #         .draw();
        # } );

        # $( "#dataTable" ).dataTable( {
        #     dom: 'Rlfrtip',
        #     colReorder: {
        #         realtime: true
        #     }
        # } );