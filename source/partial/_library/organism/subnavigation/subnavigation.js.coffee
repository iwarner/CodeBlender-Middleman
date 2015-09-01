

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

        # Variables
        mainHeight = $( ".mainContent" ).innerHeight()
        sideHeight = el.innerHeight()
        difference = mainHeight - 300

        # Debug
        # log.info mainHeight
        # log.info sideHeight
        # log.info footerHeight
        # log.info difference
        # log.info $(document).height()

        # Check that the page is not shorter than the sidemenu
        if mainHeight > sideHeight

            # Affix Offset
            el.affix offset :
                top    : 280
                bottom : -difference

        # ScrollSpy
        $( "body" ).scrollspy
            target : ".subNavigation"
            offset : 10

        # Scroll Spy activate event
        el.on "activate.bs.scrollspy", ( data ) ->

            # Close all sub menus
            el.find( ".submenu" ).hide()

            # Show the active sub menu
            $( data.target ).children( ".submenu" ).show()