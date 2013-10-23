##
# Mobile Utilities
##
class App.Utils.Mobile

    ##
    # Constructor
    ##
    constructor : ->

        # Block Bounce on Mobile Web Applications but enable on scrollBoxes
        $( document ).on "touchmove", ( e ) ->
            e.preventDefault() unless $( ".scrollBox" ).has( $( e.target ) ).length

        # Check for clicks on Data URL links
        $( '[data-url]' ).on "click touchstart", ( e ) =>
            @urlChange e

    ##
    # URL Change
    ##
    urlChange : ( e ) =>

        e.stopPropagation()
        e.preventDefault()

        # Get the data URL
        window.location = $( e.currentTarget ).data( "url" )