##
# Panels
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.Views.Panels extends Backbone.View

    ##
    # el
    ##
    el : ".container"

    ##
    # Events
    ##
    events :
        'click .tools .toggle' : "toggle"

    ##
    # Expand
    ##
    toggle : ( e ) ->

        # Prevent default
        e.preventDefault()
        e.stopPropagation()

        # Current Target
        current = $ e.currentTarget

        # Element
        el = current.closest( ".panel" ).find( ".content" )

        # Check Class
        if el.hasClass "collapse"

            # Toggle Icon
            current.children( "i" ).removeClass( "fa-caret-down" ).addClass( "fa-caret-up" )

            # Remove Collapse
            el.removeClass "collapse"

        #
        else

            # Toggle Icon
            current.children( "i" ).removeClass( "fa-caret-up" ).addClass( "fa-caret-down" )

            # Add Collapse
            el.addClass "collapse"