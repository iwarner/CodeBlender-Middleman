##
# Config
#
# @author Ian Warner <ian.warner@drykiss.com>
##

##
# JS Lint
##
'use strict'

##
# Config
#
# @param ngRoute Router
# @param codeBlenderControllers Controller
##
angular
    .module   'app.config'
    .constant 'version', '1.0.0'
    .constant 'loginRedirectPath', '/login'
    .constant 'FBURL', 'https://codeblender.firebaseio.com/'
    .run [

        'FBURL'
        '$timeout'

        ( FBURL, $timeout ) ->

            if FBURL.match '//INSTANCE.firebaseio.com'

                angular.element( document.body ).html '<h1>Please configure app/config.js before running!</h1>'

                $timeout (->

                    angular.element( document.body ).removeClass 'hide'
                    return

                ), 250

            return
    ]