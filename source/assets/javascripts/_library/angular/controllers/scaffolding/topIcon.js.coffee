##
# Top Icon
#
# @author Ian Warner <ian.warner@drykiss.com>
#
# @see  https://docs.angularjs.org/api/ng/service/$anchorScroll
# @todo Look at a more angular way to do a smooth transition.
##

##
# JS Lint
##
'use strict'

# Module
angular.module 'app.controllers'

##
# Top Icon Controller
##
.controller 'TopIconCtrl', [

    '$scope'
    '$log'

    ( $scope, $log ) ->

        $scope.gotoTop = ->

            # JQuery Animate
            $( "body, html" ).animate
                scrollTop : 0
            , 1000

            return

        return
]