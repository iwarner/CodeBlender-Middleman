##
# Application Initialisation
#
# @author Ian Warner <iwarner@drykiss.com>
##
@App =

    ##
    # App Name spacing
    ##
    Classes     : {}
    Collections : {}
    Models      : {}
    PhoneGap    : {}
    Plugin      : {}
    Routers     : {}
    Utils       : {}
    Views       : {}

    ##
    # Defaults
    ##
    root : "/"
    URL  : "/"
    API  : "http://localhost/api/v1"

    ##
    # Application constructor
    ##
    initialize : ->
        @bindEvents()

    ##
    # Bind event listeners
    #
    # Bind any events that are required on start-up. Common events are:
    # 'load', 'deviceready', 'offline', and 'online'.
    ##
    bindEvents : ->

        # Sniff Device
        if new App.Classes.Device().isMobile()

            # For PhoneGap
            document.addEventListener "deviceready", @onDeviceReady(), false

        else
            @onDeviceReady()

    ##
    # Device Ready Event Handler
    ##
    onDeviceReady : ->

        # Routers
        new App.Routers.Blog
        new App.Routers.Bootstrap
        new App.Routers.Default
        new App.Routers.Ecommerce
        new App.Routers.Forms
        new App.Routers.Games
        new App.Routers.HTML5
        new App.Routers.Mobile
        new App.Routers.Scaffolding
        new App.Routers.Social
        new App.Routers.SVG

        # Create a new session model and scope it to the app global
        # This will be a singleton, which other modules can access
        App.session = new App.Models.Session

        # Check the auth status upon initialization,
        # before rendering anything or matching routes
        # Start the backbone routing once we have captured a user's auth status
        App.session.checkAuth complete : ->

            # Instantiate Global Views
            new App.Views.Configuration
            new App.Views.Panels
            new App.Views.Navigation().render()
            new App.Views.SubNavigation
            new App.Views.Widget
            new App.Views.Offcanvas

            # Backbone History Start
            Backbone.history.start()