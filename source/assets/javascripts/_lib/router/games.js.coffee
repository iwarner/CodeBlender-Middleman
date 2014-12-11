##
# Games Router
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.Routers.Games extends Backbone.Router

    ##
    # Routes
    ##
    routes :

        "melonjs" : "melonJS"

    ##
    # Melon JS
    ##
    melonJS : ->

        # Instantiate
        new App.Views.MelonJS(
            el : ".container"
        ).render()