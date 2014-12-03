##
# Application Initilisation
#
# @author Ian Warner <iwarner@drykiss.com>
##
@App =

    ##
    # App Namespacing
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
    # Application Constructor
    ##
    initialize : ->
        @bindEvents()

    ##
    # Bind Event Listeners
    #
    # Bind any events that are required on startup. Common events are:
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
    # Deviceready Event Handler
    ##
    onDeviceReady : ->

        # Router
        App.router = new App.Routers.Router

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
            new App.Views.Navigation
            new App.Views.SubNavigation
            new App.Views.Widget
            new App.Views.Offcanvas

            # Backbone History Start
            Backbone.history.start()