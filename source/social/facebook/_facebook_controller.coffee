##
# Facebook controller
#
# @usage
# require 'social/facebook/_facebook_controller.coffee'
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
FacebookController = ( $log ) ->

    # Debug
    $log.log "Facebook - controller"

    # This
    vm = this

    # Facebook share
    vm.share = ( url ) ->

        # Debug
        $log.log "Facebook - share"

        # Facebook share
        FB.ui
            method        : 'share'
            mobile_iframe : true
            href          : 'http://drykiss.com'
        return

    return

# Module
angular
    .module     'app.controller'
    .controller 'FacebookController', FacebookController

##
# Inject
##
FacebookController.$inject = [
    '$log'
]
