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
    #
    ##
    initialize : ( options ) ->

        log.info options

        # Backbone.ModelBinding.bind( options )
        # Backbone.Validation.bind( options )

        log.info "Forms"