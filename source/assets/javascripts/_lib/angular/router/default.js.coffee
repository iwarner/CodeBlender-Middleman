##
# Router
##

##
# JS Lint
##
'use strict'

# Module
angular.module 'app'

##
# Config
#
# @param routeProvider    NGRouter
# @param locationProvider To remove the Hash
##
.config [

    '$stateProvider'
    '$urlRouterProvider'

    ( $stateProvider, $urlRouterProvider ) ->

        # Default state
        $urlRouterProvider.when "", "/"
        $urlRouterProvider.when "/", "/"

]

##
# Run
# Check Auth state
#
# @see https://www.firebase.com/docs/web/libraries/angular/api.html#angularfire-users-and-authentication-onauthcallback-context
##
.run [

    '$rootScope'
    '$state'
    '$stateParams'
    '$log'
    'auth'

    ( $rootScope, $state, $stateParams, $log, auth ) ->

        # Track status of authentication
        auth.$onAuth ( user ) ->

            $log.info "Loggind In:", user

            $rootScope.loggedIn = ! !user
            return
]

# Module
angular.module 'app.controllers', []