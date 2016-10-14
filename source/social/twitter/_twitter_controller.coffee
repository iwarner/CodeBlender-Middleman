##
# Twitter controller
#
# @usage
# require 'social/twitter/_twitter_controller.coffee'
#
# @author   Ian Warner <ian.warner@drykiss.com>
# @category social
##

##
# JS lint
##
'use strict'

##
# Controller
##
TwitterController = ( $log, $window ) ->

    # Debug
    $log.log "Twitter - controller"

    # This
    vm = this

    # Twitter share
    vm.share = ( url ) ->

        # Debug
        $log.log "Twitter - share"

        # Create share
        twttr.widgets.createShareButton url, document.getElementById( 'twitterShare' )

        return

    return

# Module
angular
    .module     'app.controller'
    .controller 'TwitterController', TwitterController

##
# Inject
##
TwitterController.$inject = [
    '$log'
    '$window'
]
