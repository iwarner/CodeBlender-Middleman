##
# Todo
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.Views.Tasks extends Backbone.View

    ##
    # Initialize
    ##
    initialize : ->

        # Elemnent
        el = $ "#dataTable"

        # Initialise DataTable
        # Order by date
        table = el.DataTable
            order: [[
                2
                "desc"
            ]]

        # Unhide Grid
        el.removeAttr "hidden"

        # Loop through the Footer Headings
        $( "#dataTable tfoot th" ).each ( i ) ->

            # select = $( "<select><option value=\"\"></option></select>" ).appendTo( $( this ).empty() ).on "change", ->
            #     table.column( i ).search( $( this ).val() ).draw()
            #     return

            # $.each table.column( i ).data().unique().sort(), ( tag ) ->
            #     log.info tag

            # for data in table.column( i ).data().unique().sort()
            #     do ->
            #         log.info data

            # log.info table.column( i ).data().unique().sort().each( key, value ) =>
            #     log.info key

            # table.column( i ).data().unique().sort().each( d, j ) ->
            #     log.info i
            # #     select.append "<option value=\"" + d + "\">" + d + "</option>"
            # #     return

            # return