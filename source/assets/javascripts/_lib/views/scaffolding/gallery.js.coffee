##
# Gallery
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.Views.Gallery extends Backbone.View

    ##
    # Initialize
    ##
    initialize : ->

        # Delegate calls to data-toggle="lightbox"
        $( document ).delegate "*[data-toggle=\"lightbox\"]", "click", ( event ) ->

            # Prevent Default
            event.preventDefault()

            # Delegate to CBLightBox
            $( this ).CBLightbox onShown : ->
                return