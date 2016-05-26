##
# Facebook service
#
# Core Methods
# .init() Used to initialize and setup the SDK. All other SDK methods must be
#         called after this one.
# .api()  Make an API call to the Graph API.
# .ui()   Used to trigger different forms of Facebook created UI dialogs, such
#         as the Feed dialog, or the Requests dialog.
#
# @usage
# require molecule/facebook/facebook
#
# @author   Ian Warner <ian.warner@drykiss.com>
# @category social
# @see      https://github.com/GoDisco/ngFacebook
##

##
# JS lint
##
'use strict'

##
# Service
##
FacebookModule = ->

    # Configuration
    config =
        permissions : 'email'
        appId       : null
        version     : 'v2.6'
        customInit  : {}

    # Provider methods
    @setAppId = ( appId ) ->
        config.appId = appId
        this

    @getAppId = ->
        config.appId

    @setVersion = ( version ) ->
        config.version = version
        this

    @getVersion = ->
        config.version

    @setPermissions = ( permissions ) ->
        if permissions instanceof Array
            permissions.join ','
            config.permissions = permissions
        this

    @getPermissions = ->
        config.permissions

    @setCustomInit = ( customInit ) ->
        if angular.isDefined( customInit.appId )
            @setAppId customInit.appId
        config.customInit = customInit
        this

    @getCustomInit = ->
        config.customInit

    # Provider method
    @$get = [
        '$q'
        '$rootScope'
        '$window'
        ( $q, $rootScope, $window ) ->

            $facebook = $q.defer()

            resolveFirstAuthResp = ( FB ) ->
                if !firstAuthRespReceived
                    firstAuthRespReceived = true
                    firstAuthResp.resolve FB
                return

            $facebook.config = ( property ) ->
                config[ property ]

            # Initialization
            $facebook.init = ->

                if $facebook.config( 'appId' ) == null
                    throw '$facebookProvider: `appId` cannot be null'

                $window.FB.init angular.extend({
                    appId   : $facebook.config( 'appId' )
                    version : $facebook.config( 'version' )
                    xfbml   : true # parse social plugins on this page
                    cookie  : true # enable cookies to allow the server to access the session
                    status  : true # use graph api version 2.6

                }, $facebook.config( 'customInit' ))

                $rootScope.$broadcast 'fb.load', $window.FB
                return

            $rootScope.$on 'fb.load', ( e, FB ) ->

                $facebook.resolve FB

                # Define action events
                angular.forEach [
                    'auth.login'
                    'auth.logout'
                    'auth.prompt'
                    'auth.sessionChange'
                    'auth.statusChange'
                    'auth.authResponseChange'
                    'xfbml.render'
                    'edge.create'
                    'edge.remove'
                    'comment.create'
                    'comment.remove'
                    'message.send'
                ], ( event ) ->

                    FB.Event.subscribe event, ( response ) ->
                        $rootScope.$broadcast 'fb.' + event, response, FB
                        if !$rootScope.$$phase
                            $rootScope.$apply()
                        return
                    return

                # Make sure 'fb.auth.authResponseChange' fires even if the user is not logged in.
                $facebook.getLoginStatus()
                $facebook.canvasSetAutoResize()

                return

            ##
            # Internal cache
            ##
            $facebook._cache = {}

            $facebook.setCache = ( attr, val ) ->
                $facebook._cache[ attr ] = val
                return

            $facebook.getCache = ( attr ) ->
                if angular.isUndefined( $facebook._cache[ attr ] )
                    return false
                $facebook._cache[ attr ]

            $facebook.clearCache = ->
                $facebook._cache = {}
                return

            ##
            # Authentication
            ##
            firstAuthResp         = $q.defer()
            firstAuthRespReceived = false
            $facebook.setCache 'connected', null

            $facebook.isConnected = ->
                $facebook.getCache 'connected'

            $rootScope.$on 'fb.auth.authResponseChange', ( event, response, FB ) ->
                $facebook.clearCache()

                if response.status == 'connected'
                    $facebook.setCache 'connected', true
                else
                    $facebook.setCache 'connected', false

                resolveFirstAuthResp FB
                return

            $facebook.getAuthResponse = ->
                FB.getAuthResponse()

            $facebook.getLoginStatus = ( force ) ->

                deferred = $q.defer()

                $facebook.promise.then ( FB ) ->
                    FB.getLoginStatus ( ( response ) ->

                        if response.error
                            deferred.reject response.error
                        else
                            deferred.resolve response
                            if $facebook.isConnected() == null
                                $rootScope.$broadcast 'fb.auth.authResponseChange', response, FB

                        if !$rootScope.$$phase
                            $rootScope.$apply()
                        return

                    ), force

                    deferred.promise

            $facebook.login = ( permissions, rerequest ) ->

                if permissions == undefined
                    permissions = $facebook.config( 'permissions' )

                deferred = $q.defer()
                loginOptions = scope: permissions

                if rerequest
                    loginOptions.auth_type = 'rerequest'

                $facebook.promise.then ( FB ) ->

                    FB.login ( ( response ) ->
                        if response.error
                            deferred.reject response.error
                        else
                            deferred.resolve response

                        if !$rootScope.$$phase
                            $rootScope.$apply()
                        return
                    ), loginOptions

                    deferred.promise

            $facebook.logout = ->

                deferred = $q.defer()

                $facebook.promise.then ( FB ) ->
                    FB.logout ( response ) ->
                        if response.error
                            deferred.reject response.error
                        else
                            deferred.resolve response

                        if !$rootScope.$$phase
                            $rootScope.$apply()
                        return

                    deferred.promise

            $facebook.ui = ( params ) ->
                deferred = $q.defer()

                $facebook.promise.then ( FB ) ->
                    FB.ui params, ( response ) ->
                        if response and response.error_code
                            deferred.reject response.error_message
                        else
                            deferred.resolve response

                        if !$rootScope.$$phase
                            $rootScope.$apply()
                        return

                    deferred.promise

            $facebook.api = ->

                deferred = $q.defer()
                args     = arguments

                args[ args.length++ ] = ( response ) ->
                    if response.error
                        deferred.reject response.error
                    if response.error_msg
                        deferred.reject response
                    else
                        deferred.resolve response
                    if !$rootScope.$$phase
                        $rootScope.$apply()
                    return

                firstAuthResp.promise.then ( FB ) ->
                    FB.api.apply FB, args
                    deferred.promise

            ##
            # API cached request - cached request api with promise
            #
            # @param path
            # @returns $q.defer.promise
            ##

            $facebook.cachedApi = ->
                if typeof arguments[ 0 ] != 'string'
                    throw '$facebook.cacheApi can works only with graph requests!'
                promise = $facebook.getCache( arguments[ 0 ] )

                if promise
                    return promise

                result = $facebook.api.apply( $facebook, arguments )
                $facebook.setCache arguments[ 0 ], result
                result

            $facebook.canvasSetAutoGrow = ->
                FB.Canvas.setAutoGrow()

            $facebook.canvasScrollTop = ( x, y ) ->
                FB.Canvas.scrollTo x, y

            $facebook.canvasSetAutoResize = ->
                setInterval (->
                    if !FB
                        return
                    height = angular.element( document.querySelector( 'body' ) )[ 0 ].offsetHeight
                    FB.Canvas.setSize height: height
                ), 500
                return

            $facebook
    ]

    return

##
# Run
##
FacebookModuleRun = ( $rootScope, $window, $facebook ) ->

    console.log "Run"

    $window.fbAsyncInit = ->
        $facebook.init()
        if !$rootScope.$$phase
            $rootScope.$apply()
        return

    return

##
# Module
##
angular
    .module   'app.facebook'
    .provider '$facebook', FacebookModule
    .run      FacebookModuleRun

##
# Inject
##
FacebookModuleRun.$inject = [
    '$rootScope'
    '$window'
    '$facebook'
]
