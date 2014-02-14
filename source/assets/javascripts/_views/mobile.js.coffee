##
# Mobile
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.Views.Mobile extends Backbone.View

    ##
    # el
    ##
    el : $ ".mobilePrototype"

    ##
    # Events
    ##
    events : {
        "click a"             : "handleClick"
        "click .toggleRegion" : "toggleRegion"
    }

    ##
    # Toggle Region
    ##
    toggleRegion : ( e ) =>

        # Prevent default
        e.preventDefault()
        e.stopPropagation()

        # Element
        el = $( ".mobilePrototype a" ).toggleClass "noBorder"

        # Debug
        console.log "Toggle Region"

    ##
    # Initialize
    ##
    initialize : ->

        # Element
        el = $ ".mobilePrototype"

        # Show Screen - Default to this screen at Construction
        show = false
        # show = $ ".login"

        # Show
        if show

            # Hide All Screen
            el.children().hide()

            # Show Specific Screen
            show.show =>

                # Show JCrop
                show.Jcrop
                    onSelect : @showCoords

    ##
    # Show CSS Coords
    ##
    showCoords : ( c ) ->

        el = $ "#coords"
        el.val( "height   : " + c.h + "px;\nwidth    : " + c.w + "px;\nleft     : " + c.x + "px;\ntop      : " + c.y + "px;" )

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

        # Hide Current Screen
        # If Target contains region then hide the parent
        s = el[ 0 ].className

        # What to hide
        if s.indexOf( "region" ) == -1
            el.hide()
        else
            el.parent().hide()

        # Show Destination Screen
        $( "." + goto ).show()
