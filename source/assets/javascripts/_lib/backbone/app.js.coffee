##
# Backbone Initialisation
#
# @author Ian Warner <iwarner@drykiss.com>
##

# App
# require ./_lib/app

# Plugin
# require _library/plugin/lightBox
# require _library/plugin/serialize

# Utilities
# require _library/utils/logger
# require _library/utils/ajax
# require _library/utils/language
# require _library/utils/facebook
# require _library/utils/mobile
# require _library/utils/popover
# require _library/utils/topIcon
# require _library/utils/validation

# Classes
# require _library/classes/ecommerce/stripe
# require _library/classes/forms/fileImagePreviewPopover
# require _library/classes/forms/passwordStrengthMeter
# require _library/classes/google/geoCode
# require _library/classes/google/map
# require _library/classes/mobile/device
# require _library/classes/scaffolding/cookies
# require _library/classes/scaffolding/geoLocation
# require _library/classes/scaffolding/localStorage
# require _library/classes/scaffolding/notification
# require _library/classes/scaffolding/scrollTop
# require _library/classes/scaffolding/urlParams

# Models
# require _library/models/session
# require _library/models/user
# require_tree ./_lib/models

# Views
# require_tree ./_lib/views

# Router
# require_tree ./_lib/router

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

        # Default Routers
        new App.Routers.Default

        # Section Routers
        new App.Routers.Blog
        new App.Routers.Bootstrap
        new App.Routers.Charts
        new App.Routers.DataTable
        new App.Routers.Ecommerce
        new App.Routers.Forms
        new App.Routers.Games
        new App.Routers.Google
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
            Backbone.history.start
                pushState: true