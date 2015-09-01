##
# E-commerce Router
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.Routers.Ecommerce extends Backbone.Router

    ##
    # Routes
    ##
    routes :

        "card"   : "card"
        "cart"   : "cart"
        "stripe" : "stripe"

    ##
    # Card
    ##
    card : ->

        # Instantiate
        new App.Views.Card(
            el : ".container"
        ).render()

    ##
    # Cart
    ##
    cart : ->

        # Instantiate
        new App.Views.Cart(
            el : ".container"
        ).render()

    ##
    # Stripe
    ##
    stripe : ->

        # Instantiate
        new App.Views.Stripe