##
# Phone Tools Section
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.Views.PhoneToolsSection extends Backbone.View

    ##
    # Events
    ##
    events :
        "click .toggleRegion"     : "toggleRegion"
        "click .toggleJCrop"      : "toggleJCrop"
        "change #screenSelection" : "screenSelection"

    ##
    # Screen Selection
    ##
    screenSelection : ( event ) =>

        # Prevent default
        event.preventDefault()
        event.stopPropagation()

        # Show the screen
        screen = $( event.currentTarget ).val()

        # Hide the current Screen
        if ! $.isNumeric( screen )
            $( ".iphoneContainer" ).children().hide()
            $( ".iphoneContainer ." + screen ).show()

    ##
    # Toggle JCrop
    ##
    toggleJCrop : ( event ) =>

        # Prevent default
        event.preventDefault()
        event.stopPropagation()

        screen = $( "#screenSelection" ).find( ":selected" ).val()

        # Show JCrop
        $( "." + screen ).Jcrop
            onSelect : @showCoords

    ##
    # Show CSS Coords
    ##
    showCoords : ( c ) ->

        el = $ "#coords"
        el.val( "coords     : [ " + c.h + ", " + c.w + ", " + c.x + ", " + c.y + " ]" )

    ##
    # Toggle Region
    ##
    toggleRegion : ( event ) =>

        # Prevent default
        event.preventDefault()
        event.stopPropagation()

        # Element
        $( ".mobilePrototype a" ).toggleClass "noBorder"
