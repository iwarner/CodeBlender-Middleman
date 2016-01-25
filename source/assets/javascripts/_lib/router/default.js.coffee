##
# Router
##

##
# JS Lint
##
'use strict'

##
# Config
#
# @param routeProvider    NGRouter
# @param locationProvider To remove the Hash
##
config = ( $stateProvider, $urlRouterProvider, ngClipProvider ) ->

    console.log "Config Loaded"

    # Zero Clipboard Setting
    ngClipProvider.setPath '/assets/swf/ZeroClipboard.swf'

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
]

run.$inject = [
    '$rootScope'
    '$state'
    '$stateParams'
    'auth'
]