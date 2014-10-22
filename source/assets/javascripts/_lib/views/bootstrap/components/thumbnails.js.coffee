##
# Thumbnails
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.Views.Thumbnails extends Backbone.View

    ##
    # Initialize
    ##
    initialize : ->

        log.info "Thumbnails"

        # Delegate calls to data-toggle="lightbox"
        $( document ).delegate "*[data-toggle=\"lightbox\"]", "click", ( event ) ->

            log.info "Click Recorded"

            # Prevent Default
            event.preventDefault()

            # Delegate to CBLightBox
            $( this ).CBLightbox onShown : ->
                return