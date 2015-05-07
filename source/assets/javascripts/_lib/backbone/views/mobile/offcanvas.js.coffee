##
# Offcanvas with flyin submenus
#
# @see http://codepen.io/waqasss/pen/afFky
#
##

class App.Views.Offcanvas extends Backbone.View


    ##
    # el
    ##
    el : "body"


    easing :'Power1.easeOut'
    navOpen : false
    subNavOpen : false


    ##
    # Events
    ##
    events :
        "tap [data-toggle=offcanvas]" : "toggleNavMenu"
        "tap #navbar-collapse .navbar-wrapper ul li:not(.dropdown) a" : "doScrollTo"
        "tap a[ href^=# ]:not(.external)" : "doScrollTo"
        "tap [data-toggle=suboffcanvas]" : "toggleSubNavMenu"

    ##
    # Initialize
    ##
    initialize : ->

        this.updateNav()

        $( window ).on( "resize", this.updateNav )


    ##
    # Updates the navigation menu
    ##
    updateNav : ->

        outerHeight = window.outerHeight

        if ( window.innerWidth <= 1024 )

            $( "#navbar .navbar-toggle" ).attr( "data-toggle", "offcanvas" )
            $( "#navbar .dropdown-toggle" ).attr( "data-toggle", "suboffcanvas" )

            $( "#navbar-collapse" ).css( { "height" : outerHeight, "max-height" : outerHeight } )
            $( "#navbar-collapse .dropdown-menu" ).css( { "height" : outerHeight, "max-height" : outerHeight } )

        # DESKTOP
        else

            $( "#navbar .navbar-toggle" ).attr( "data-toggle", "collapse" )
            $( "#navbar .dropdown-toggle" ).attr( "data-toggle", "dropdown" )

            # $( "#navbar-collapse" ).css( { "height" :"340px", "max-height" : "340px" } ) # 340px is the default height
            $( "#navbar-collapse .navbar-wrapper" ).css( { "height" : "auto", "max-height" : "auto" } )
            $( "#navbar-collapse .dropdown-menu" ).css( { "height" : "auto", "max-height" : "auto" } )


    ##
    # Toggle the offcanvas nav menu
    ##
    toggleNavMenu : ( e ) ->

        e.preventDefault()

        $( ".row-offcanvas-right" ).toggleClass( "active" ) # Need to remove css transitions

        if( $( ".row-offcanvas-right" ).hasClass( "active") )
            this.openNav()
        else
            this.closeNav()

    ##
    # Toggle the offcanvas sub nav menu
    ##
    toggleSubNavMenu : ( e ) ->
        e.preventDefault()

        log.info 'click'
        # Element
        $el = $( e.currentTarget )
        $parent = $el.parent('li')

        # Targetted Submenu is already open
        if( $parent.hasClass( "active" ) )
            # Close the targetted Submenu
            this.closeSubNav( $parent )
            this.subNavOpen = false

        else
            # Targetted Submenu is not open

            # If a submenu is open then close all of them first
            if( this.subNavOpen )
                $navMenus = $( ".row-offcanvas-right .navbar-collapse .active .dropdown-menu" )
                TweenLite.to($navMenus, 0.5, {left: "100%", ease: App.Views.Offcanvas.prototype.easing} );
                $navMenus.parent().removeClass( "active" )

            # Open the targetted submenu
            this.openSubNav( $parent )
            this.subNavOpen = true



    ##
    # Open the offcanvas
    ##
    openNav : ->

        # Get variables
        windowWidth = window.innerWidth;
        $navMenu = $( ".row-offcanvas-right .navbar-collapse" )
        navMenuLeft = windowWidth - $navMenu.width()
        contentLeft = $navMenu.width() * -1

        # Tween Nav Menu
        TweenLite.to($navMenu, 0.5, {left: navMenuLeft, ease: App.Views.Offcanvas.prototype.easing} );

        # Tween Header AND main content
        $header = $( "#navbar .navbar-header, .main" )
        TweenLite.to($header, 0.5, {left: contentLeft, ease: App.Views.Offcanvas.prototype.easing} );

        this.navOpen = true

    ##
    # Close the offcanvas
    ##
    closeNav : ->

        # Tween Nav Menu
        $navMenu = $( ".row-offcanvas-right .navbar-collapse" )
        TweenLite.to($navMenu, 0.5, {left: "100%", ease: App.Views.Offcanvas.prototype.easing} );

        # Tween Header AND main content
        $header = $( "#navbar .navbar-header, .main" )
        TweenLite.to($header, 0.5, {left: 15, ease: App.Views.Offcanvas.prototype.easing} );    # 15 == 15px (margin)

        if( this.subNavOpen )
            $navMenus = $( ".row-offcanvas-right .navbar-collapse .active .dropdown-menu" )
            $navMenus.css( {"left" : "100%"} )
            $navMenus.parent().removeClass( "active" )

        this.navOpen = false


    ##
    # Open the SubNav
    ##
    openSubNav : ( $parent ) ->

        # Tween Nav Menu
        $subNavMenu = $parent.find( ".dropdown-menu" )
        TweenLite.to($subNavMenu, 0.5, {left: "60px", ease: App.Views.Offcanvas.prototype.easing} );
        $parent.addClass( "active" )


    ##
    # Close the SubNav
    ##
    closeSubNav : ( $parent ) ->

        # Tween Nav Menu
        $subNavMenu = $parent.find( ".dropdown-menu" )
        TweenLite.to($subNavMenu, 0.5, {left: "100%", ease: App.Views.Offcanvas.prototype.easing} );
        $parent.removeClass( "active" )



    ##
    # Do the scroll to section or go to location
    ##
    doScrollTo : ( e ) ->

        # Remove leading slashes and hash bangs ( backward compatablility )
        hash    = $(e.target).attr "href"

        $hashEl = $ hash

        # Check hash exists
        if $hashEl.length

            # Prevent default
            # Prevent the default if we need to stop/hijack default behaviour
            # ... like below...
            e.preventDefault()


            # Close offcanvas menu
            $( ".row-offcanvas-right" ).removeClass( "active" )
            $( ".main" ).removeClass( "offcanvas" )

            hashReplace = hash.replace /^.*?(#|$)/, ""

            # Remove the Hash ID from the element on the page
            $hashEl.attr "id", ""

            # Add the new URL to Backbone's history and update the URL
            Backbone.history.navigate hash,
                trigger : true

            # Put the Hash ID back
            $hashEl.attr "id", hashReplace

            # Scroll
            scroll = new App.Classes.ScrollTop
            scroll.scrollTop hashReplace, 50

        else

            # Go to page with hash tag
            if( hash != '#' && hash != '' && hash != undefined )
                window.location = "index.html" + hash