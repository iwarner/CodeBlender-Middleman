##
# Statement
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.Views.Statement extends Backbone.View

    ##
    # Events
    ##
    events :
        "click .toCSV"           : "tapCSV"
        "change .fileUpload"     : "upload"
        "submit .initialBalance" : "balance"

    ##
    # Backbone Initialize
    ##
    initialize : ->

        # Instantiate Local Storage Class
        @local = new App.Classes.LocalStorage

        # Bind validation for Contact Form
        Backbone.Validation.bind this

    ##
    # Browser Support
    ##
    browserSupport : ->

        isCompatible = false
        isCompatible = true if window.FileReader
        isCompatible

    ##
    # Balance
    ##
    balance : ( event ) ->

        # Prevent Default
        event.stopPropagation()
        event.preventDefault()

        # Serialize and save model
        data = $( ".initialBalance" ).serializeObject()
        @model.set data

        # Run the validation and submit
        if @model.isValid( true )

            # Save the Value into Local Storage
            statement         = {}
            statement.balance = 4

            # Set Item
            @local.setItem "statement", @model.attributes.initialBalance

    ##
    # Render
    ##
    render : ->

        # Bind Backbone Validation
        Backbone.Validation.bind this,

            # Valid
            valid : ( view, attr, selector ) ->

                $el    = view.$ "[ name=" + attr + " ]"
                $group = $el.closest ".form-group"
                $group.removeClass "has-error"
                $group.find( ".help-block" ).html( "" ).addClass( "hidden" )

                # Debug
                # log.info "View : ", view, "Attr : ", attr, "Selector : ", selector

            # Invalid
            invalid : ( view, attr, error, selector ) ->

                $el    = view.$ "[ name=" + attr + " ]"
                $group = $el.closest ".form-group"
                $group.addClass "has-error"
                $group.find( ".help-block" ).html( error ).removeClass( "hidden" )

                # Debug
                # log.info "View : ", view, "Attr : ", attr, "error", error, "Selector : ", selector

    ##
    # Upload
    ##
    upload : ( event ) ->

        # Check Browser Support
        unless @browserSupport()

            log.info "The File APIs are not fully supported in this browser!"

        # Process the file
        else

            # Get the File
            file   = event.target.files[ 0 ]

            # Instnatiate the File Reader API
            reader = new FileReader()
            reader.readAsText file

            ##
            # Reader Load
            ##
            reader.onload = ( event ) ->

                # Parse the CSV file
                csv = new CSV( event.target.result ).parse()

                # Check that CSV data is found
                if csv and csv.length > 0

                    log.info "Imported -" + csv.length + "- rows successfully!"

                    # Create Object
                    statement        = {}
                    statement.length = csv.length
                    statement.data   = csv

                    # Set Item
                    @localStorage.setItem "uxPortal", statement

                else
                    log.info "No data to import!"
                return

            ##
            # Reader Error
            ##
            reader.onerror = ->
                log.info "Unable to read " + file.fileName
            return

        return

    ##
    # Tap CSV
    ##
    tapCSV : ( event ) ->

        # Prevent Default
        event.stopPropagation()
        event.preventDefault()

        # Variables
        data    = $( "table.statement" ).first()
        csvData = []
        tmpArr  = []
        tmpStr  = ""

        # Data Find
        data.find( "tr" ).each ->

            if $( this ).find( "th" ).length

                $( this ).find( "th" ).each ->

                    tmpStr = $( this ).text().replace( /"/g, '""' ).replace( /\s{2,}/g, ' ' ).trim()
                    tmpArr.push '"' + tmpStr + '"'
                    return

                csvData.push tmpArr

            else

                tmpArr = []

                $( this ).find( "td" ).each ->

                    if $( this ).text().match( /^-{0,1}\d*\.{0,1}\d+$/ )

                        tmpArr.push parseFloat( $( this ).text().replace( /\s{2,}/g, ' ' ).trim() )

                    else
                        tmpStr = $( this ).text().replace( /"/g, '""' ).replace( /\£/g, '' ).replace( /\s{2,}/g, ' ' ).trim()
                        tmpArr.push '"' + tmpStr + '"'

                    return

                csvData.push tmpArr.join( "," )

            return

        output = csvData.join( "\n" )
        uri    = "data:application/csv;charset=UTF-8," + encodeURIComponent( output )

        window.open uri
        return

    ##
    # Serialize
    # @see https://github.com/hongymagic/jQuery.serializeObject
    ##
    $.fn.serializeObject = ->
        "use strict"
        a = {}
        b = ( b, c ) ->
            d = a[ c.name ]
            ( if "undefined" isnt typeof d and d isnt null then ( if $.isArray( d ) then d.push( c.value ) else a[ c.name ] = [
                d
                c.value
            ] ) else a[ c.name ] = c.value )
            return

        $.each( @serializeArray(), b )
        a