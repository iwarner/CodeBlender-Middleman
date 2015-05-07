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
engageControllers = angular.module 'engageControllers'

##
# Top Icon Controller
##
engageControllers.controller 'ThumbnailCtrl', [
    '$scope'
    '$log'
    ( $scope, $log ) ->

        # Delegate calls to data-toggle="lightbox"
        $( document ).delegate "*[data-toggle=\"lightbox\"]", "click", ( event ) ->

            $log.info "Click Recorded"

            # Prevent Default
            event.preventDefault()

            # Delegate to CBLightBox
            $( this ).CBLightbox onShown : ->
                return

        $log.info "HERE"

        return
]