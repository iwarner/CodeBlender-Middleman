##
# Bootstrap Router
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.Routers.Bootstrap extends Backbone.Router

    ##
    # Routes
    ##
    routes :

        "thumbnails" : "thumbnails"
        "collapse"   : "collapse"

    ##
    # Thumbnails
    ##
    thumbnails : ->

        # Instantiate
        new App.Views.Thumbnails(
            el : ".container"
        ).render()

    ##
    # File Image Preview Popover
    ##
    collapse : ->

        # Instantiate
        new App.Views.Collapse(
            el : ".container"
        )