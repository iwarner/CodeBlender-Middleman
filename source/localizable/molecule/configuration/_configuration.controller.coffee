##
# Configuration
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.Views.Configuration extends Backbone.View

    ##
    # el
    ##
    el : "body"

    ##
    # Events
    ##
    events :
        'click .skin-toolbox-toggle' : "toggle"
        "change #backgroundSelector" : "imageChange"

    ##
    # Initialize
    ##
    initialize : ->

        # Check that the variable is in the URL to load up the configurator
        url = new App.Classes.UrlParams

        if param = url.getParam "configurator"
            return

    ##
    # Toggle
    ##
    toggle : ( event ) ->

        # Prevent default
        event.preventDefault()
        event.stopPropagation()

        # Element
        el = $( event.currentTarget )

        # Close Configurator
        if el.hasClass( "toolbox-open" )

            el.removeClass( "toolbox-open" ).parent().animate
                right : -182
            , "fast"

            localStorage.setItem "toolboxState", "closed"

        # Open Configurator
        else

            el.addClass( "toolbox-open" ).parent().animate
                right : -4
            , "fast"

            localStorage.setItem "toolboxState", "open"

        return

    ##
    # Image Change
    ##
    imageChange : ( event ) ->

        # Prevent default
        event.preventDefault()
        event.stopPropagation()

        # El
        el = $( event.currentTarget ).val().trim()

        # Check el is a string
        if ! $.isNumeric( el )

            # Get the link value / text
            $( "#navbar" ).css( "background-image", "url( /assets/images/footer/" + el + " )" )