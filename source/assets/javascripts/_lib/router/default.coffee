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
config = ( ngClipProvider, $facebookProvider ) ->

    # Zero Clipboard Setting
    ngClipProvider.setPath '/assets/swf/ZeroClipboard.swf'

    # Get the facebook locale from body data
    appID = $( 'body' ).data( 'facebookappid' )

    # Set Facebook app ID
    $facebookProvider.setAppId appID
    $facebookProvider.setVersion "v2.8"

##
# Run
# Check Auth state
#
# @see https://www.firebase.com/docs/web/libraries/angular/api.html#angularfire-users-and-authentication-onauthcallback-context
##
run = ( $log, $window ) ->

    do  ->

        # Debug
        $log.log "Facebook sdk loaded"

        # Locale
        locale = $( 'body' ).data( 'localefacebook' )
        appID  = $( 'body' ).data( 'facebookappid' )

        # Facebook
        ( ( d, s, id ) ->
            js  = undefined
            fjs = d.getElementsByTagName( s )[ 0 ]
            if d.getElementById id
                return
            js        = d.createElement s
            js.id     = id
            js.src    = '//connect.facebook.net/' + locale + '/sdk.js#xfbml=1&version=v2.8&appId=' + appID
            # js.onload = _ga.trackFacebook
            fjs.parentNode.insertBefore js, fjs
            return
        ) document, 'script', 'facebook-jssdk'

        # Debug
        $log.log "Twitter sdk loaded"

        # Twitter
        $window.twttr = ( ( d, s, id ) ->
            js  = undefined
            fjs = d.getElementsByTagName( s )[ 0 ]
            t   = $window.twttr or {}
            if d.getElementById( id )
                return t
            js        = d.createElement( s )
            js.id     = id
            js.src    = 'https://platform.twitter.com/widgets.js'
            # js.onload = _ga.trackTwitter
            fjs.parentNode.insertBefore js, fjs
            t._e = []
            t.ready = ( f ) ->
                t._e.push f
                return
            t
        )( document, 'script', 'twitter-wjs' )

        # Debug
        $log.log "Pinterest sdk loaded"

        # Pinterest
        ((d) ->
            f       = d.getElementsByTagName( 'SCRIPT' )[ 0 ]
            p       = d.createElement( 'SCRIPT' )
            p.type  = 'text/javascript'
            p.async = true
            p.src   = '//assets.pinterest.com/js/pinit.js'
            f.parentNode.insertBefore p, f
            return
        ) document

        # Track status of authentication
        # auth.$onAuth ( user ) ->

        #     $log.log "Loggind In:", user

        #     $rootScope.loggedIn = ! !user
        #     return

    return

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
    'ngClipProvider'
    '$facebookProvider'
]

##
# Inject
##
run.$inject = [
    '$log'
    '$window'
]
