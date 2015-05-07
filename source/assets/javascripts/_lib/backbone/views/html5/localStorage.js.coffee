##
# Local Storage
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.Views.LocalStorage extends Backbone.View

    ##
    # el
    # ##
    el : ".container"

    ##
    # Events
    ##
    events :
        "click  .downloadButton" : "export"
        "change .import"         : "import"

    ##
    # Backbone Initialize
    ##
    initialize : ->

        # Instantiate
        @local = new App.Classes.LocalStorage

        # Create Object
        car        = {}
        car.wheels = 4
        car.doors  = 2
        car.sound  = 'vroom'
        car.name   = 'Lightning McQueen'

        # Set Item
        @local.setItem "uxPortal", car

        # Debug
        # log.info local

    ##
    # Import
    ##
    import : ( e ) =>

        # File List
        fileList = this.files

        # Download Item
        log.info @files

    ##
    # Export
    ##
    export : ( e ) ->

        # Download Item
        @local.downloadItem "uxPortal"