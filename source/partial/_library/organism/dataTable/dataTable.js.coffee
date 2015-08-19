##
# DataTable Controllers
#
# @author Ian Warner <ian.warner@drykiss.com>
# @see     http://stackoverflow.com/questions/23637586/datatables-1-10-check-all-via-jquery
##

##
# JS Lint
##
'use strict'

##
# DataTableCtrl
##
DataTable = ( $compile, $filter, $scope, $resource, DTOptionsBuilder, DTColumnBuilder, DTColumnDefBuilder ) ->

    # Scope
    vm = this


    ##
    # Checkbox Toggle All
    ##
    toggleAll = ( selectAll, selectedItems ) ->
        for id of selectedItems
            if selectedItems.hasOwnProperty( id )
                selectedItems[ id ] = selectAll
        return

    ##
    # Checkbox Toggle One
    ##
    toggleOne = ( selectedItems ) ->

        me = this

        for id of selectedItems

            if selectedItems.hasOwnProperty( id )

                if !selectedItems[ id ]
                    me.selectAll = false
                    return

        me.selectAll = true

        return

    ##
    # Create Row
    ##
    createdRow = ( row, data, dataIndex ) ->
        # Recompiling so we can bind Angular directive to the DT
        $compile( angular.element( row ).contents() ) $scope
        return

    # Variables
    vm.selected   = {}
    vm.selectAll  = false
    vm.toggleAll  = toggleAll
    vm.toggleOne  = toggleOne
    vm.prospectId = "21112674777482806MOD161"
    vm.dtInstance = {}

    # Title Select
    titleHtml = '<checkbox ng-model="table.selectAll" ng-change="table.toggleAll( table.selectAll, table.selected )"></checkbox>'

    ##
    # Options
    ##
    vm.dtOptions = DTOptionsBuilder

        # Source and Node
        .fromSource   '/assets/javascripts/data/responses.json'
        .withDataProp 'result'

        # Language
        .withLanguage
            sEmptyTable     : "No data available in table"
            sInfo           : "<strong>_START_ to _END_</strong> of _TOTAL_"
            sInfoEmpty      : "Showing 0 to 0 of 0 entries"
            sInfoFiltered   : "(filtered from _MAX_ total entries)"
            sInfoPostFix    : ""
            sInfoThousands  : ","
            sLengthMenu     : "Items per page: _MENU_"
            sLoadingRecords : "Loading..."
            sProcessing     : "Processing..."
            sSearch         : "Search: "
            sZeroRecords    : "No matching records found"
            oPaginate       :
                sFirst    : "First"
                sLast     : "Last"
                sNext     : "Next"
                sPrevious : "Previous"
            oAria :
                sSortAscending  : ": activate to sort column ascending"
                sSortDescending : ": activate to sort column descending"

        # DOM
        .withDOM '<"dataTablesTop"i<"dataTables_filter">l><"toolbar">tp'

        # Defer Render
        .withOption 'deferRender', true

        # Ordering
        .withOption 'order', [ 6, 'desc' ]

        # Length Menu
        .withOption "lengthMenu", [ [ 10, 25, 50, 100, -1 ], [ 10, 25, 50, 100, "All" ] ]

        # Create Row for Checboxes
        .withOption 'createdRow', createdRow

        # Create Header for Checboxes
        .withOption( 'headerCallback', ( header ) ->

            if !$scope.headerCompiled
                # Use this headerCompiled field to only compile header once
                $scope.headerCompiled = true
                $compile( angular.element( header ).contents() ) $scope
            return
        )

        # Pagination
        .withPaginationType 'full_numbers'

        # Load Bootstrap version
        .withBootstrap()

    ##
    # Columns
    ##
    vm.dtColumns = [

        # ProspectID
        DTColumnBuilder.newColumn( null ).notVisible()
        .renderWith ( data, type, full, meta ) ->

            prospectId = data.prospectId

            if type == "sort" and prospectId == vm.prospectId
                return 1

            return prospectId

        # Checkbox
        DTColumnBuilder.newColumn( null ).withTitle( titleHtml ).notSortable().withClass( 'text-center' )
        .renderWith ( data, type, full, meta ) ->
            vm.selected[ full.prospectId ] = false
            '<checkbox ng-model="table.selected[ \'' + data.prospectId + '\' ]" ></checkbox>'

        # Name
        DTColumnBuilder.newColumn( null ).withTitle( 'Name' ).withClass( 'link nameClick' )
        .renderWith ( data, type, full, meta ) ->

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

        # Role
        DTColumnBuilder.newColumn( 'role' ).withTitle( 'Role' )

        # Company
        DTColumnBuilder.newColumn( 'company' ).withTitle( 'Company' )

        # Tactic Code
        DTColumnBuilder.newColumn( 'tacticCode' ).withTitle( 'Tactic' )

        # Last Contact
        DTColumnBuilder.newColumn( null ).withTitle( 'Last contact' )
        .renderWith ( data, type, full, meta ) ->

            # Variables
            date = data.lastInteraction.date

            # For display
            if type == "display" || type == 'filter'
                return date = $filter( 'date' )( data.lastInteraction.date, 'dd/MM/yy' )

            return date

        # Buying Stage
        DTColumnBuilder.newColumn( null ).withTitle( 'Buying stage' ).withClass( 'capitalise' )
        .renderWith ( data, type, full, meta ) ->

            stage  = data.buyingStage
            action = data.nextBestAction

            switch type

                when 'display'

                    # If the next best action is handedOver - show validated as the Buying Stage
                    if action == 'handedOver'
                        return 'Validated'

                # Display Source
                when 'sort'

                    switch stage
                        when 'learn'     then return 0
                        when 'try'       then return 1
                        when 'buy'       then return 2
                        when 'validated' then return 3
                        else return 4

            # Return for all other types
            return stage

        # Next Action
        DTColumnBuilder.newColumn( null ).withTitle( "Next action" )
        .renderWith ( data, type, full, meta ) ->

            action = data.nextBestAction
            text   = "View actions"

            switch action

                when 'handedOver'
                    return ""

                when 'callScheduled'
                    text = "Review and call"

                when 'setBuyingStage'
                    text = "Set buying stage"

            # Display for the button link
            if type == 'display'
                return """
                    <a class="btn btn-primary btn-small" href="#/timeline/#{ data.prospectId }/#{ data.responseId }" type="submit">#{ text }</a>
                """

            # Return just the text
            text
    ]

    return

# Module
angular.module 'app.controllers'

##
# DataTable
##
.controller 'DataTableCtrl', DataTable


# # Save the lastID
# lastIdx = null

# ##
# # Create the Footer Search Inputs
# ##
# jQuery( "#dataTable tfoot th" ).each ( i ) ->

#     unless i == 0 or i == 6 or i == 9 or i == 10
#         ei    = jQuery( "#dataTable thead th" )
#         title = ei.eq( jQuery( this ).index() ).text()
#         jQuery( this ).html '<input type="text" placeholder="Search ' + title + '">'
#         return

# ##
# # Template for the expandable section
# ##
# format = ( d ) ->
#     '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">
#         <tr>
#             <td>Full name:</td>
#             <td>' + d[ "name" ] + '</td>
#         </tr>
#         <tr>
#             <td>Role:</td>
#             <td>' + d[ "role" ] + '</td>
#         </tr>
#         <tr>
#             <td>Note:</td>
#             <td>' + d[ "note" ] + '</td>
#         </tr>
#     </table>'

# ##
# # Create the table
# # @see Options : https://www.datatables.net/reference/option/
# ##
# dataTable = jQuery( "#dataTable" ).DataTable

#     # Dom
#     dom : '<"dataTablesTop"i<"dataTables_filter">l>RCT<"clear">lfrt<"clear">ip'

#     # Column Visibility Control
#     colVis :
#         # exclude  : [ 0, 9 ]
#         restore  : 'Restore'
#         showAll  : 'Show all'
#         showNone : 'Show none'

#     # Table Tools - Download
#     tableTools :
#         sSwfPath : "/assets/swf/copy_csv_xls_pdf.swf"

#     # Save the State
#     # stateSave : true

# # Restore the state for Searches
# state = dataTable.state.loaded()

# if state

#     dataTable.columns().eq( 0 ).each ( colIdx ) ->

#         colSearch = state.columns[ colIdx ].search

#         if colSearch.search
#             jQuery('input', dataTable.column( colIdx ).footer() ).val colSearch.search

#         return

#     dataTable.draw()

# # Footer Input Search
# jQuery( '#dataTable tfoot input' ).on 'keyup change', ->
#     dataTable.column( jQuery( this ).parent().index() + ':visible' ).search( @value ).draw()
#     return

# # Cell Click for expansion
# jQuery( '#dataTable tbody' ).on 'click', 'td.details-control', ( event ) ->
#     tr  = $( this ).closest( 'tr' )
#     row = dataTable.row( tr )

#     if row.child.isShown()
#         row.child.hide()
#         tr.removeClass 'shown'
#     else
#         row.child( format( row.data() ) ).show()
#         tr.addClass 'shown'
#     return

# # Row Click
# jQuery( '#dataTable' ).on 'click', 'tbody tr', ( event ) ->

#     # Dont expand if the cell has noClick
#     if ! $( event.target ).closest( "td" ).hasClass "noClick"
#         name = jQuery( 'td', this ).eq( 1 ).text()
#         alert 'You clicked on ' + name + '\'s row'

# # Select All Click
# jQuery( '#checkall' ).on 'click', ( event) ->
#     checkBoxes = jQuery "input[ name=numbers\\[\\]]"
#     checkBoxes.prop( 'checked', !checkBoxes.prop( "checked" ) )
#     return

# # Highlight Cells
# jQuery( '#dataTable tbody' ).on( 'mouseover', 'td', ->
#     colIdx = dataTable.cell( this ).index().column
#     if colIdx != lastIdx
#         jQuery(dataTable.cells().nodes()).removeClass 'highlight'
#         jQuery(dataTable.column(colIdx).nodes()).addClass 'highlight'
#     return
#     ).on 'mouseleave', ->
#         jQuery( dataTable.cells().nodes() ).removeClass 'highlight'
#         return

# # Add Class to the Column Visibility
# jQuery( ".ColVis_MasterButton" ).removeClass( "ColVis_Button" ).addClass "btn btn-primary"

# # Checkboxes
# $( '#selectAll' ).change ->
#     cells = dataTable.cells().nodes()
#     $( cells ).find( ':checkbox' ).prop 'checked', $( this ).is( ':checked' )
#     return

# # var table = $( "#dataTable" ).DataTable( {
# #     dom: 'RC<"clear">lfrtip',
# #     columnDefs: [
# #         { visible: false, targets: 1 }
# #     ]
# # } );

# # $( "#dataTable" ).dataTable( {
# #     dom: 'Rlfrtip',
# #     colReorder: {
# #         realtime: true
# #     }
# # } );