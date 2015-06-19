##
# Security
##

##
# JS Lint
##
'use strict'

##
#
##
do ( angular ) ->

    # When $routeProvider.whenAuthenticated() is called, the path is stored in this list
    # to be used by authRequired() in the services below
    securedRoutes = []

    ##
    #
    ##
    angular.module 'app.security', []

    ##
    #
    ##
    .config [

        '$urlRouterProvider'

        ( $urlRouterProvider ) ->

            # routes which are not in our map are redirected to /home
            # $urlRouterProvider.otherwise( { redirectTo: '/home' } )
            return
    ]

    ##
    #
    ##
    .config [

        '$urlRouterProvider'

        ( $urlRouterProvider ) ->

            console.log "Security When Authenticated"

            # credits for this idea: https://groups.google.com/forum/#!msg/angular/dPr9BpIZID0/MgWVluo_Tg8J
            # unfortunately, a decorator cannot be use here because they are not applied until after
            # the .config calls resolve, so they can't be used during route configuration, so we have
            # to hack it directly onto the $routeProvider object
            $urlRouterProvider.whenAuthenticated = ( path, route ) ->

                securedRoutes.push path

                # Store all secured routes for use with authRequired() below
                route.resolve      = route.resolve or {}
                route.resolve.user = [
                    'auth'
                    ( auth ) ->
                        auth.$requireAuth()
                ]

                $urlRouterProvider.when path, route
                this

            return
    ]

    ##
    #
    ##
    .run [

        '$rootScope'
        '$location'
        'auth'
        'loginRedirectPath'

        ( $rootScope, $location, auth, loginRedirectPath ) ->

            # Watch for login status changes and redirect if appropriate
            check = ( user ) ->

                if !user and authRequired( $location.path() )
                    console.log 'check failed', user, $location.path()
                    $location.path loginRedirectPath
                return

            authRequired = ( path ) ->
                console.log 'authRequired?', path, securedRoutes.indexOf( path )
                securedRoutes.indexOf( path ) != -1

            auth.$onAuth check

            # some of our routes may reject resolve promises with the special {authRequired: true} error
            # this redirects to the login page whenever that is encountered
            $rootScope.$on '$routeChangeError', ( e, next, prev, err ) ->

                if err == 'AUTH_REQUIRED'
                    $location.path loginRedirectPath
                return

            return
    ]

    return