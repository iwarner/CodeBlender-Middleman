##
# Stripe
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.Views.Stripe extends Backbone.View

    ##
    # el
    ##
    el : ".container"

    ##
    # Events
    ##
    events :
        'click .customButton' : "tapStripe"

    ##
    # Tap Notification
    ##
    tapStripe : ( event ) ->

        # Prevent Default
        event.stopPropagation()
        event.preventDefault()

        # Open Checkout with further options
        new App.Classes.Stripe().create().open
            image       : "http://placehold.it/128.gif/aabbdd/000&text=Image"
            name        : "DryKISS Ltd"
            description : "Granola Bar (£20.00)"
            amount      : 1000
            panelLabel  : "Buy @"