##
# Application Combined JavaScript
#
# @author Ian Warner <ian.warner@drykiss.com>
##

##
# JS Lint
##
'use strict'

# Module
codeBlenderControllers = angular.module 'codeBlenderControllers'

##
# DataTable Controller
#
# @todo Make this more Angular : http://l-lin.github.io/angular-datatables/#/welcome
##
codeBlenderControllers.controller 'DataTableCtrl', [
    '$scope'
    '$routeParams'
    ( $scope, $routeParams ) ->

        # Save the lastID
        lastIdx = null

        ##
        # Create the Footer Search Inputs
        ##
        jQuery( "#dataTable tfoot th" ).each ( i ) ->

            unless i == 0 or i == 6 or i == 9
                ei    = jQuery( "#dataTable thead th" )
                title = ei.eq( jQuery( this ).index() ).text()
                jQuery( this ).html '<input type="text" placeholder="Search ' + title + '">'
                return

        ##
        # Template for the expandable section
        ##
        format = ( d ) ->
            '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">
                <tr>
                    <td>Full name:</td>
                    <td>' + d[ "name" ] + '</td>
                </tr>
                <tr>
                    <td>Role:</td>
                    <td>' + d[ "role" ] + '</td>
                </tr>
                <tr>
                    <td>Note:</td>
                    <td>' + d[ "note" ] + '</td>
                </tr>
            </table>'

        ##
        # Create the table
        # @see Options : https://www.datatables.net/reference/option/
        ##
        dataTable = jQuery( "#dataTable" ).DataTable

            # Load the Data
            # processing : true
            # serverSide : true
            ajax : '/assets/javascripts/data/responses.json'

            # Columns
            columns : [
                {
                    data           : null
                    orderable      : false
                    searchable     : false
                    defaultContent : ''
                    className      : 'noClick noFooterSearch text-center'
                    render         : ( data, type, row ) ->
                        '<input type="checkbox" class="editor-active">' }
                { data: "name" }
                {
                    data    : "role"
                    visible : false
                }
                { data: "company" }
                { data: "tactic" }
                { data: "contacted" }
                {
                    data       : "stage"
                    searchable : false
                    className   : 'noFooterSearch'
                }
                { data: "offer" }
                {
                    data    : "note"
                    visible : false
                }
                {
                    data           : null
                    className      : 'noClick noFooterSearch details-control'
                    orderable      : false
                    searchable     : false
                    defaultContent : ''
                }
            ]

            # Defer Rendering
            deferRender : true # https://datatables.net/reference/option/deferRender

            # Dom
            dom : "RCT<\"clear\">lfrt<\"clear\">ip"

            # Column Visibility Control
            colVis :
                exclude  : [ 0, 9 ]
                restore  : 'Restore'
                showAll  : 'Show all'
                showNone : 'Show none'

            # Column Ordering
            order : [[ 5, "desc" ]]

            # Paging
            pagingType : "full_numbers"

            # Table Tools - Download
            tableTools :
                sSwfPath : "/assets/swf/copy_csv_xls_pdf.swf"

            # Save the State
            stateSave : true

        # Restore the state for Searches
        state = dataTable.state.loaded()

        if state

            dataTable.columns().eq( 0 ).each ( colIdx ) ->

                colSearch = state.columns[ colIdx ].search

                if colSearch.search
                    jQuery('input', dataTable.column( colIdx ).footer() ).val colSearch.search

                return

            dataTable.draw()

        # Footer Input Search
        jQuery( '#dataTable tfoot input' ).on 'keyup change', ->
            dataTable.column( jQuery( this ).parent().index() + ':visible' ).search( @value ).draw()
            return

        # Cell Click for expansion
        jQuery( '#dataTable tbody' ).on 'click', 'td.details-control', ( event ) ->
            tr  = $( this ).closest( 'tr' )
            row = dataTable.row( tr )

            if row.child.isShown()
                row.child.hide()
                tr.removeClass 'shown'
            else
                row.child( format( row.data() ) ).show()
                tr.addClass 'shown'
            return

        # Row Click
        jQuery( '#dataTable' ).on 'click', 'tbody tr', ( event ) ->

            # Dont expand if the cell has noClick
            if ! $( event.target ).closest( "td" ).hasClass "noClick"
                name = jQuery( 'td', this ).eq( 1 ).text()
                alert 'You clicked on ' + name + '\'s row'

        # Highlight Cells
        jQuery( '#dataTable tbody' ).on( 'mouseover', 'td', ->
            colIdx = dataTable.cell( this ).index().column
            if colIdx != lastIdx
                jQuery(dataTable.cells().nodes()).removeClass 'highlight'
                jQuery(dataTable.column(colIdx).nodes()).addClass 'highlight'
            return
            ).on 'mouseleave', ->
                jQuery( dataTable.cells().nodes() ).removeClass 'highlight'
                return

        # Add Class to the Column Visibility
        jQuery( ".ColVis_MasterButton" ).removeClass( "ColVis_Button" ).addClass "btn btn-primary"

        # Checkboxes
        $( '#selectAll' ).change ->
            cells = dataTable.cells().nodes()
            $( cells ).find( ':checkbox' ).prop 'checked', $( this ).is( ':checked' )
            return

        # Language Options
        # $( "#dataTable" ).DataTable
        #     'language' :
        #         'url' : 'dataTables.german.lang'

        # Alphabet Search
        # https://www.datatables.net/blog/2014-09-22

        # var table = $( "#dataTable" ).DataTable( {
        #     dom: 'RC<"clear">lfrtip',
        #     columnDefs: [
        #         { visible: false, targets: 1 }
        #     ]
        # } );

        # $( "#dataTable" ).dataTable( {
        #     dom: 'Rlfrtip',
        #     colReorder: {
        #         realtime: true
        #     }
        # } );

        return
]