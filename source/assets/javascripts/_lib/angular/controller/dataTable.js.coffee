##
# DataTable Controllers
#
# @author Ian Warner <ian.warner@drykiss.com>
##

##
# JS Lint
##
'use strict'

# Module
angular.module 'app.controllers'

##
# DataTable Controller
#
# @todo Make this more Angular : http://l-lin.github.io/angular-datatables/#/welcome
##
.controller 'DataTableCtrl', [

    '$scope'
    '$filter'

    ( $scope, $filter ) ->

        # Save the lastID
        lastIdx = null

        $scope.prospectId = "21112674777482806MOD161"

        ##
        # Create the Footer Search Inputs
        ##
        jQuery( "#dataTable tfoot th" ).each ( i ) ->

            unless i == 0 or i == 6 or i == 9 or i == 10
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

        # Elements
        $dataTable = jQuery '#dataTable'

        ##
        # Create the table
        # @see Options : https://www.datatables.net/reference/option/
        ##
        dataTable = jQuery( "#dataTable" ).DataTable

            # Language options
            # 'url' : 'dataTables.en.lang'
            language :
                lengthMenu   : "Show _MENU_ response"
                zeroRecords  : "Nothing found"
                info         : "<strong>_TOTAL_</strong> responses"
                infoEmpty    : "No records available"
                infoFiltered : "(filtered from _MAX_ total records)"

            # Load the Data
            ajax :
                dataSrc : 'result'
                type    : 'get'
                url     : '/assets/javascripts/data/responses.json'

            # Column Ordering - prospectId initially
            order : [ 0, 'asc' ]

            # Columns
            columns : [

                # {
                #     data           : null
                #     orderable      : false
                #     searchable     : false
                #     defaultContent : ''
                #     className      : 'noClick noFooterSearch text-center'
                #     render         : ( data, type, row ) ->
                #         '<input type="checkbox" class="editor-active">'
                # }

                # ProspectID 21112674777482806MOD161
                {
                    data    : null
                    visible : false
                    render : ( data, type, row, meta ) ->

                        prospectId = data.prospectId

                        if type == "sort" and prospectId == $scope.prospectId
                            return 1

                        return prospectId
                }

                # Name
                {
                    data          : null
                    className     : 'link nameClick'
                    render        : ( data, type, row, meta ) ->

                        # Variables
                        first = data.firstName
                        last  = data.lastName

                        # Display purposes only
                        if type == 'display'
                            return "<a href='#/timeline/#{ data.prospectId }/#{ data.responseId }'>#{ first } #{ last }</a>"

                        # For filter return last and first
                        if type == 'filter'
                            return last + ' ' + first

                        return last
                }

                # Role
                { data : "role" }

                # Company
                { data : "company" }

                # Tactic Code
                { data : 'tacticCode' }

                # Last contact
                {
                    data : null
                    render  : ( data, type, row, meta ) ->

                        date = data.lastInteraction.date

                        # For display
                        if type == "display" || type == 'filter'
                            return date = $filter( 'date' )( data.lastInteraction.date, 'dd/MM/yy' )

                        return date
                }

                # Buying Stage
                {
                    data      : null
                    className : 'capitalise'

                    # If the next best action is handedOver - show validated as the Buying Stage
                    render  : ( data, type, row, meta ) ->

                        stage  = data.buyingStage
                        action = data.nextBestAction

                        # Display purposes only
                        if type == 'display'

                            # If the next best action is handedOver - show validated as the Buying Stage
                            if action == 'handedOver'
                                return 'Validated'

                        # Display Source
                        else if type == 'sort'

                            if stage == 'learn'
                                return 0
                            else if stage == 'try'
                                return 1
                            else if stage == 'buy'
                                return 2
                            else if stage == 'validated'
                                return 3
                            else if stage == ''
                                return 4

                        # Return for all other types
                        return stage
                }

                # Next Action
                {
                    data : null
                    # Render the button based on the type of the offer
                    render : ( data, type, row, meta ) ->

                        action = data.nextBestAction
                        text   = "View actions"

                        if action == 'handedOver'
                            return ""

                        else if action == 'callScheduled'
                            text = "Review and call"

                        else if action == 'setBuyingStage'
                            text = "Set buying stage"

                        # Display for the button link
                        if type == 'display'
                            return """
                                <a class="btn btn-primary btn-small" href="#/timeline/#{ data.prospectId }/#{ data.responseId }" type="submit">#{ text }</a>
                            """

                        # Return just the text
                        text
                }

                # Expand
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

            # Paging
            pagingType : "full_numbers"

            # Dom
            dom : '<"dataTablesTop"i<"dataTables_filter">l>RCT<"clear">lfrt<"clear">ip'

            # Column Visibility Control
            colVis :
                # exclude  : [ 0, 9 ]
                restore  : 'Restore'
                showAll  : 'Show all'
                showNone : 'Show none'

            # Table Tools - Download
            tableTools :
                sSwfPath : "/assets/swf/copy_csv_xls_pdf.swf"

            # Save the State
            # stateSave : true

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