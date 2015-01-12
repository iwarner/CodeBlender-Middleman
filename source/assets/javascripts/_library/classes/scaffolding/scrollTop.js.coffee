##
# Scroll To Helper
#
# Usage
# scroll = new App.Classes.ScrollTop
# scroll.scrollTop( "benefits", 70 )
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.Classes.ScrollTop

    ##
    # Constructor
    ##
    scrollTop : ( reference, offset = 60 ) ->

        # Debug
        # log.info $( "#" + reference ).offset().top - offset

        # Animate To Benefits
        $( "html, body" ).clearQueue().animate
            scrollTop : $( "#" + reference ).offset().top - offset
        , 1000, "easeInOutQuint"