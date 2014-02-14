##
# Stripe
#
# @author Ian Warner <ian.warner@drykiss.com>
# @see    https://stripe.com/gb
##
class App.Views.Stripe extends Backbone.View

    ##
    # el
    ##
    el : ".container"

    ##
    # Events
    ##
    events : {
        'click .customButton' : "touchStripe"
    }

    ##
    # Touch Notification
    ##
    touchStripe : ( e ) ->

        # Prevent Default
        e.stopPropagation()
        e.preventDefault()

        # Open Checkout with further options
        new App.Utils.Stripe().create().open
            image       : "http://placehold.it/128.gif/aabbdd/000&text=Image"
            name        : "DryKISS Ltd"
            description : "Granola Bar (£20.00)"
            amount      : 1000
            panelLabel  : "Buy @"