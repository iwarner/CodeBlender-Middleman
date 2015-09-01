##
# Thumbnails
#
# @author Ian Warner <ian.warner@drykiss.com>
#
# @see
# @todo
##

##
# JS Lint
##
'use strict'

# Module
angular.module 'app.controller'

##
# Top Icon Controller
##
.controller 'ThumbnailCtrl', [

    '$scope'
    '$log'

    ( $scope, $log ) ->

        # Delegate call to data-toggle="lightbox"
        $( document ).delegate "*[data-toggle=\"lightbox\"]", "click", ( event ) ->

            $log.info "Click Recorded"

            # Prevent Default
            event.preventDefault()

            # Delegate to CBLightBox
            $( this ).CBLightbox onShown : ->
                return

        return
]