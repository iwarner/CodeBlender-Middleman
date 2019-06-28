##
# Thumbnail
#
# @author Ian Warner <ian.warner@drykiss.com>
##

##
# JS Lint
##
'use strict'

# Module
angular.module 'app.controller'

##
# Thumbnail
##
ThumbnailController = ( $log ) ->

    $log.info "Firebase Controller"

    # Delegate call to data-toggle="lightbox"
    $( document ).delegate "*[data-toggle=\"lightbox\"]", "click", ( event ) ->

        $log.info "Click Recorded"

        # Prevent Default
        event.preventDefault()

        # Delegate to CBLightBox
        $( this ).CBLightbox onShown : ->
            return

    return

##
# Module
##
angular
    .module     'app.controller'
    .controller 'ThumbnailController', ThumbnailController

##
# Inject
##
ThumbnailController.$inject = [
    '$log'
]
