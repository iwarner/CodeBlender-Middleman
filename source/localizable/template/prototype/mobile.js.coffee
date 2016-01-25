##
# Mobile
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.Views.Mobile extends Backbone.View

    ##
    # Events
    ##
    events :
        "tap a" : "handleClick"

    ##
    # Handle Click
    ##
    handleClick : ( e ) ->

        # Prevent default
        e.preventDefault()
        e.stopPropagation()

        # Current Target
        el = $ e.currentTarget

        # Get Data SRC
        goto = $( e.currentTarget ).data "goto"

        # Split the goto on a hashbang
        # Basically if you want to go to a screen and then to a desired region in the target
        split = goto.split "#"

        # If Target contains region then hide the parent
        s = el[ 0 ].className

        # What to hide
        if s.indexOf( "region" ) == -1
            el.hide()
        else
            el.parent().hide()

        # Show Destination Screen
        $( "." + split[ 0 ] ).show()

        # Update the Select Box with the Screen we are on
        $( "#screenSelection" ).val( split[ 0 ] )

        # If another region is added then move to that also
        if split[ 1 ]

            # Keyword Top
            if split[ 1 ] == "top"
                calc = 0

            # Keyword Bottom - TBD
            else if split[ 1 ] == "bottom"
                calc = 0

            # Region
            else
                calc = $( "." + split[ 1 ] ).offset().top

            # Scroll
            $( '.iphoneContainer' ).scrollTop( calc )