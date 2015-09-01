##
# Mobile Router
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.Routers.Mobile extends Backbone.Router

    ##
    # Routes
    ##
    routes :

        "mobile" : "mobile"

    ##
    # Mobile
    ##
    mobile : ->

        # Instantiate
        new App.Views.Mobile
            el : ".mobilePrototype"

        # Instantiate
        new App.Views.PhoneToolsSection
            el : ".phoneToolsSection"