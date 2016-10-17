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
run = ( $log, $rootScope, $state, $stateParams ) ->

    do ->

        # Debug
        $log.log "Facebook sdk loaded"

        # Facebook load
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

        # Debug
        $log.log "Twitter sdk loaded"

        # Twitter load
        ( ( d, s, id ) ->
            js  = undefined
            fjs = d.getElementsByTagName( s )[ 0 ]
            t   = window.twttr or {}
            if d.getElementById( id )
                return t
            js     = d.createElement( s )
            js.id  = id
            js.src = 'https://platform.twitter.com/widgets.js'
            fjs.parentNode.insertBefore js, fjs
            t._e = []
            t.ready = ( f ) ->
                t._e.push f
                return
            t
        )( document, 'script', 'twitter-wjs' )

    # Track status of authentication
    # auth.$onAuth ( user ) ->

    #     $log.log "Loggind In:", user

    #     $rootScope.loggedIn = ! !user
    #     return

##
# Module
##
angular
    .module 'app'
    .config config
    .run    run

##
# Inject
##
config.$inject = [
    '$stateProvider'
    '$urlRouterProvider'
    'ngClipProvider'
    '$facebookProvider'
]

##
# Inject
##
run.$inject = [
    '$log'
    '$rootScope'
    '$state'
    '$stateParams'
]
