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

        # Bootstrap
        "thumbnails" : "thumbnails"

        # E-Commerce
        "card"   : "card"
        "cart"   : "cart"
        "stripe" : "stripe"

        # Forms
        "file-image-preview" : "fileImagePreviewPopover"
        "forms"              : "forms"
        "input"              : "formsInput"
        "login"              : "login"
        "registration"       : "registration"
        "strengthMeter"      : "strengthMeter"
        "signin"             : "signIn"

        # Games
        "melonjs" : "melonJS"

        # HTML5
        "geolocation"   : "geoLocation"
        "local-storage" : "localStorage"
        "speech"        : "speech"

        # Javscript
        "collapse" : "collapse"

        # Mobile
        "mobile" : "mobile"

        # Scaffolding
        "contact"              : "contact"
        "dropzone-upload"      : "dropzone"
        "editor"               : "editor"
        "flex-slider"          : "flexSlider"
        "gallery"              : "gallery"
        "notifications"        : "notifications"
        "search"               : "search"
        "statement"            : "statement"
        "tasks"                : "tasks"
        "world-cup-sweepstake" : "sweepStake"

        # Style Guide
        "vme" : "vme"

        # Social
        "embed" : "mailchimp"

        # Default
        "*path" : "mobile"

    ##
    # Thumbnails
    ##
    thumbnails : ->

        # Instantiate
        new App.Views.Thumbnails(
            el : ".container"
        ).render()

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
    # File Image Preview Popover
    ##
    collapse : ->

        # Instantiate
        new App.Views.Collapse(
            el : ".container"
        )

    ##
    # Contact
    ##
    contact : ->

        # Instantiate
        new App.Views.Contact

    ##
    # Dropzone
    ##
    dropzone : ->

        # Instantiate
        new App.Views.Dropzone

    ##
    # Editor
    ##
    editor : ->

        # Instantiate
        new App.Views.Editor

    ##
    # File Image Preview Popover
    ##
    fileImagePreviewPopover : ->

        # Instantiate
        new App.Views.FileImagePreviewPopover(
            el : ".container"
        )

    ##
    # Flex Slider
    ##
    flexSlider : ->

        # Instantiate
        new App.Views.FlexSlider

    ##
    # Forms
    ##
    forms : ->

        # Instantiate
        new App.Views.Forms
            model : new App.Models.Forms

    ##
    # Card
    ##
    formsInput : ->

        # Instantiate
        new App.Views.FormsInput(
            el    : ".container"
            model : new App.Models.FormsInput()
        ).render()

    ##
    # Gallery
    ##
    gallery : ->

        # Instantiate
        new App.Views.Gallery

    ##
    # GeoLocation
    ##
    geoLocation : ->

        # Instantiate
        new App.Views.GeoLocation

    ##
    # Local Storage
    ##
    localStorage : ->

        # Instantiate
        new App.Views.LocalStorage

    ##
    # Login
    ##
    login : ->

        # Instantiate
        new App.Views.Login(
            el    : ".container"
            model : new App.Models.Login()
        ).render()

    ##
    # Mailchimp
    ##
    mailchimp : ->

        # Instantiate
        new App.Views.Mailchimp

    ##
    # Melon JS
    ##
    melonJS : ->

        # Instantiate
        new App.Views.MelonJS(
            el : ".container"
        ).render()

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

    ##
    # Notifications
    ##
    notifications : ->

        # Instantiate
        new App.Views.Notification

    ##
    # Registration
    ##
    registration : ->

        # Instantiate
        new App.Views.Registration(
            el    : ".container"
            model : new App.Models.Registration()
        ).render()


    ##
    # Strength Meter
    ##
    strengthMeter : ->

        # Instantiate
        new App.Views.PasswordStrengthMeter(
            el : ".container"
        ).render()

    ##
    # Search
    ##
    search : ->

        # Instantiate
        new App.Views.Search(
            el    : ".container"
            model : new App.Models.Search()
        ).render()

    ##
    # Sign In
    ##
    signIn : ->

        # Instantiate
        new App.Views.SignIn
            el : ".container"

    ##
    # Speech
    ##
    speech : ->

        # Instantiate
        new App.Views.Speech
            el : ".container"

    ##
    # Statement
    ##
    statement : ->

        # Instantiate
        new App.Views.Statement(
            el    : ".container"
            model : new App.Models.Statement()
        ).render()

    ##
    # Stripe
    ##
    stripe : ->

        # Instantiate
        new App.Views.Stripe

    ##
    # Sweep Stake
    ##
    sweepStake : ->

        # Instantiate
        new App.Views.SweepStake(
            el : ".container"
        ).render()

    ##
    # Tasks
    ##
    tasks : ->

        # Instantiate
        new App.Views.Tasks

    ##
    # V.Me
    ##
    vme : ->

        # Instantiate
        new App.Views.VMe