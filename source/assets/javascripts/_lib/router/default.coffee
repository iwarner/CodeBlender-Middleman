##
# Router
##

##
# JS lint
##
'use strict'

##
# Configuration
#
# @param routeProvider    NGRouter
# @param locationProvider To remove the Hash
##
config = ( $stateProvider, $urlRouterProvider, ngClipProvider, $facebookProvider ) ->

    # Zero Clipboard Setting
    ngClipProvider.setPath '/assets/swf/ZeroClipboard.swf'

    # Set Facebook app ID
    $facebookProvider.setAppId '253027968192447'

    # Default state
    # $urlRouterProvider.when "", "/"
    # $urlRouterProvider.when "/", "/"

##
# Run
# Check Auth state
#
# @see https://www.firebase.com/docs/web/libraries/angular/api.html#angularfire-users-and-authentication-onauthcallback-context
##
run = ( $rootScope, $state, $stateParams, auth ) ->

    do ->

        console.log "Facebook sdk loaded"

        ( ( d, s, id ) ->

            js  = undefined
            fjs = d.getElementsByTagName( s )[ 0 ]

            if d.getElementById id
                return

            js     = d.createElement s
            js.id  = id
            js.src = 'https://connect.facebook.net/en_GB/sdk.js'

            fjs.parentNode.insertBefore js, fjs

            return

        ) document, 'script', 'facebook-jssdk'

    # Track status of authentication
    # auth.$onAuth ( user ) ->

    #     console.log "Loggind In:", user

    #     $rootScope.loggedIn = ! !user
    #     return

##
# Module
##
angular
    .module 'app'
    .config config
    .run    run

config.$inject = [
    '$stateProvider'
    '$urlRouterProvider'
    'ngClipProvider'
    '$facebookProvider'
]

run.$inject = [
    '$rootScope'
    '$state'
    '$stateParams'
    'auth'
]
