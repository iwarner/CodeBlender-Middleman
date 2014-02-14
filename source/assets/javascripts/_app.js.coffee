##
# Application Initilisation
#
# @author Ian Warner <iwarner@drykiss.com>
# @see
#
# @todo Sort out the required Namespaces for the Application
##
@App =

    ##
    # App Namespacing
    ##
    Classes     : {}
    Collections : {}
    Models      : {}
    PhoneGap    : {}
    Routers     : {}
    Utils       : {}
    Views       : {}

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

        # For PhoneGap
        document.addEventListener "deviceready", @onDeviceReady, false

    ##
    # Deviceready Event Handler
    ##
    onDeviceReady : ->

        # Router
        new App.Routers.Router

        window.EstimoteBeacons.startRangingBeaconsInRegion ->

            setInterval (->

                window.EstimoteBeacons.getBeacons (data) ->

                    console.log "HERE1"

                return

            ), 1000

        console.log "HERE2"

        # Backbone History Log
        # @see http://artsy.github.io/blog/2012/06/25/replacing-hashbang-routes-with-pushstate/
        # @see http://dev.tenfarms.com/posts/proper-link-handling
        Backbone.history.start
            pushState : true