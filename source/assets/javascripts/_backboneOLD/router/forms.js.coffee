##
# Forms Router
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.Routers.Forms extends Backbone.Router

    ##
    # Routes
    ##
    routes :

        "file-image-preview" : "fileImagePreviewPopover"
        "forms"              : "forms"
        "input"              : "formsInput"
        "login"              : "login"
        "registration"       : "registration"
        "strengthMeter"      : "strengthMeter"
        "signin"             : "signIn"

    ##
    # File Image Preview Popover
    ##
    fileImagePreviewPopover : ->

        # Instantiate
        new App.Views.FileImagePreviewPopover
            el : ".container"

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
    # Login
    ##
    login : ->

        # Instantiate
        new App.Views.Login(
            el    : ".container"
            model : new App.Models.Login()
        ).render()

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
    # Sign In
    ##
    signIn : ->

        # Instantiate
        new App.Views.SignIn
            el : ".container"