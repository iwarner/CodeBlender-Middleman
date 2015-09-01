##
# Charts Router
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.Routers.Charts extends Backbone.Router

    ##
    # Routes
    ##
    routes :

        "amchart" : "amchart"

    ##
    # Amchart
    ##
    amchart : ->

        # Instantiate
        new App.Views.Amchart(
            el : ".container"
        ).render()