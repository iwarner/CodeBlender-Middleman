##
# Top Icon Utility
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.Utils.TopIcon

    ##
    # Constructor
    ##
    constructor : ->

        # Bind click for move to Top Icon
        $( ".copyright" ).on 'tap click', ".toTop", ( event ) =>
            @tapTopIcon event

        # Bind click for move to Top Icon
        $( ".scrollTop" ).on 'tap click', ( event ) =>
            @tapTopIcon event

    ##
    # Tap Top Icon
    ##
    tapTopIcon : ( event ) ->

        # Stop Defaults
        event.preventDefault()
        event.stopPropagation()

        # JQuery Animate
        $( "body, html" ).animate
            scrollTop : 0
        , 1000

# Instantiate Utility
new App.Utils.TopIcon