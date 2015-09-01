##
# HTML5 Router
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.Routers.HTML5 extends Backbone.Router

    ##
    # Routes
    ##
    routes :

        "geolocation"   : "geoLocation"
        "local-storage" : "localStorage"
        "speech"        : "speech"

    ##
    # GeoLocation
    ##
    geoLocation : ->

        # Instantiate
        new App.Views.GeoLocation

    ##
    # Local Storage
    ##
    localStorage : ->

        # Instantiate
        new App.Views.LocalStorage

    ##
    # Speech
    ##
    speech : ->

        # Instantiate
        new App.Views.Speech
            el : ".container"