##
# Facebook controller
#
# @usage
# require 'social/facebook/_facebook_controller.coffee'
#
# @param href    The link attached to this post.
# @param hashtag A hashtag specified by the developer to be added to the shared content.
#
# @author   Ian Warner <ian.warner@drykiss.com>
# @category social
#
# @see https://github.com/djds4rce/angular-socialshare/blob/master/angular-socialshare.js
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
    vm.share = ( url = "https://drykiss.com", hashtag = "#DeliverooFoodSceneUK", quote = "quote" ) ->

        # Debug
        $log.log "Facebook - share"

        # Facebook share
        FB.ui {
          method        : 'share'
          mobile_iframe : true
          hashtag       : hashtag
          href          : url
          quote         : quote
        }, ( response ) ->
            $log.info "Facebook - share - response:", response

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
