##
# Top Icon
#
# @author Ian Warner <ian.warner@drykiss.com>
#
# @usage
# require molecule/top-icon/top-icon.controller
#
# @see  https://docs.angularjs.org/api/ng/service/$anchorScroll
#
# @todo Look at a more angular way to do a smooth transition.
##

##
# JS Lint
##
'use strict'

##
# Top Icon Controller
##
TopIconController = ->

    # This
    vm = this

    vm.gotoTop = ->

        # JQuery Animate
        $( "body, html" ).animate
            scrollTop : 0
        , 1000

        return

        # scrollTop : ( reference, offset = 60 ) ->

        #     # Debug
        #     # log.info $( "#" + reference ).offset().top - offset

        #     # Animate To Benefits
        #     $( "html, body" ).clearQueue().animate
        #         scrollTop : $( "#" + reference ).offset().top - offset
        #     , 1000, "easeInOutQuint"

    return

##
# Module
##
angular
    .module     'app.controller'
    .controller 'TopIconController', TopIconController