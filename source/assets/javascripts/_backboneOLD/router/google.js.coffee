##
# Games Router
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.Routers.Google extends Backbone.Router

    ##
    # Routes
    ##
    routes :

        "prototyping/google/signin.html" : "signIn"

    ##
    # Sign In
    ##
    signIn : ->

    ##
    # Sign In
    ##
    signIn : ->

        log.info "JERE"
        # Instantiate
        new App.Views.SignIn
            el : ".container"