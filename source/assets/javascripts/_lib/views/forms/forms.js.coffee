##
# Forms
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.Views.Forms extends Backbone.View

    ##
    # el
    ##
    el : ".container"

    ##
    # Events
    ##
    events :
        "click .input-group-addon" : "tapAddon"

    ##
    # Initialize
    ##
    initialize : ->

        # Backbone.ModelBinding.bind( options )
        # Backbone.Validation.bind( options )
        log.info "Forms"

    ##
    # Tap Addon
    ##
    tapAddon : ( e ) ->

        log.info "Addon"