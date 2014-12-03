##
# Backbone Router
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.Routers.Router extends Backbone.Router

    ##
    # Routes
    ##
    routes :

        'scaffolding/dropzone-upload'  : 'dropzone'
        'bootstrap/css/forms'          : 'forms'
        'scaffolding/geolocation'      : 'geoLocation'
        'social/mailchimp/embed'       : 'mailchimp'
        'mobile'                       : 'mobile'
        '*path'                        : 'mobile'
        'scaffolding/notifications'    : 'notifications'
        'scaffolding/stripe'           : 'stripe'
        'scaffolding/simple-cart'      : 'simpleCart'
        'scaffolding/simple-cart/cart' : 'cart'

    ##
    # Dropzone
    ##
    dropzone : ->

        # Instantiate
        new App.Views.Dropzone( )

    ##
    # Forms
    ##
    forms : ->

        # Instantiate
        new App.Views.Forms( { model: new App.Models.Forms } )

    ##
    # GeoLocation
    ##
    geoLocation : ->

        # Instantiate
        new App.Views.GeoLocation()

    ##
    # Mailchimp
    ##
    mailchimp : ->

        # Instantiate
        new App.Views.Mailchimp()

    ##
    # Mobile
    ##
    mobile : ->

        # Instantiate
        new App.Views.Mobile()

    ##
    # Notifications
    ##
    notifications : ->

        # Instantiate
        new App.Views.Notification()

    ##
    # Simple Cart
    ##
    simpleCart : ->

        # Instantiate
        new App.Views.SimpleCart()

    ##
    # Cart
    ##
    cart : ->

        # Instantiate
        new App.Views.Cart()

    ##
    # Stripe
    ##
    stripe : ->

        # Instantiate
        new App.Views.Stripe()