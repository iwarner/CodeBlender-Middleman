##
# Default Router
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.Routers.Default extends Backbone.Router

    ##
    # Routes
    ##
    routes :

        "prototyping" : "prototyping"
        "*path"       : "mobile"

    ##
    # Prototyping
    ##
    prototyping : ->

        log.info "prototyping"