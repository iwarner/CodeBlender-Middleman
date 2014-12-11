##
# Scaffolding Router
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.Routers.Scaffolding extends Backbone.Router

    ##
    # Routes
    ##
    routes :

        "contact"         : "contact"
        "dropzone-upload" : "dropzone"
        "editor"          : "editor"
        "flex-slider"     : "flexSlider"
        "gallery"         : "gallery"
        "notifications"   : "notifications"
        "search"          : "search"
        "tasks"           : "tasks"

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
    # Flex Slider
    ##
    flexSlider : ->

        # Instantiate
        new App.Views.FlexSlider

    ##
    # Gallery
    ##
    gallery : ->

        # Instantiate
        new App.Views.Gallery

    ##
    # Notifications
    ##
    notifications : ->

        # Instantiate
        new App.Views.Notification

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
    # Tasks
    ##
    tasks : ->

        # Instantiate
        new App.Views.Tasks