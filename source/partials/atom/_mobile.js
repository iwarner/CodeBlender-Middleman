##
# Mobile Utilities and Defaults
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.Utils.Mobile

    ##
    # Constructor
    ##
    constructor : ->

        # Block Bounce on Mobile Web Applications but enable on scrollBoxes
        $( document ).on "touchmove", ( e ) ->
            e.preventDefault() unless $( ".scrollBox" ).has( $( e.target ) ).length

# Instantiate Utility
new App.Utils.Mobile
