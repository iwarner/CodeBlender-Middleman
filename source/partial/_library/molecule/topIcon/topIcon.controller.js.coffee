##
# Top Icon
#
# @author Ian Warner <ian.warner@drykiss.com>
#
# @usage
# require ../../../partial/_library/molecule/topIcon/topIcon
#
# @see  https://docs.angularjs.org/api/ng/service/$anchorScroll
# @todo Look at a more angular way to do a smooth transition.
##

### jshint eqnull: true, eqeqeq: false ###


##
# JS Lint
##
'use strict'

# Module
angular.module 'app.controller'

##
# Top Icon Controller
##
.controller 'TopIconController', [

    '$scope'

    ( $scope ) ->

        $scope.gotoTop = ->

            # JQuery Animate
            $( "body, html" ).animate
                scrollTop : 0
            , 1000

            return

        return
]
