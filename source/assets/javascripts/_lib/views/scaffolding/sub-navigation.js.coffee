##
# Sub Navigation
#
# @author Ian Warner <ian.warner@drykiss.com>
#
# @todo If page refreshes directly on hash of menu then it does not expand
# @todo Sub menu should not be active
##
class App.Views.SubNavigation extends Backbone.View

    ##
    # Events
    ##

    ##
    # Initialize
    ##
    initialize : ->

        # Elements
        el = $ ".subNavigation"

        mainHeight = $( ".mainContent" ).innerHeight()
        sideHeight = el.innerHeight()

        if mainHeight > sideHeight

            # Affix Offset
            el.affix offset :
                top    : 320
                bottom : 155

            # ScrollSpy
            $( "body" ).scrollspy
                target : ".subNavigation"
                offset : 10

            # Scrollspy activate event
            $( ".subNavigation" ).on "activate.bs.scrollspy", ( data ) ->

                # Element
                el = data.target

                # Close all submenus
                $( ".subNavigation" ).find( ".submenu" ).hide()

                # Show the active Submenu
                $( el ).children( ".submenu" ).show()