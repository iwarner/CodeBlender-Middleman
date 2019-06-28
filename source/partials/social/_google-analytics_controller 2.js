# Google analytics
#
# @author   Ian Warner <ian.warner@drykiss.com>
# @category social

# JS lint
'use strict'

# Google analytics controller
GoogleAnalyticsController = ( $log, $facebook ) ->

    # Debug
    $log.info "Google analytics"

    # This
    vm = this

    # URL
    url = "http://drykiss.com"

    # Twitter service
    $log.info twttr

    twttr.ready ( twttr ) ->
        # Now bind our custom intent events
        twttr.events.bind 'tweet', tweetIntentToAnalytics
        return

    tweetIntentToAnalytics = ->

        $log.info "Analytics Tweet"
        return

    if twttr and twttr.events and twttr.events.bind

        twttr.events.bind 'tweet', ( event ) ->

            if event

                targetUrl = undefined

                # Default value is undefined.
                if event.target and event.target.nodeName == 'IFRAME'
                    targetUrl = _ga.extractParamFromUri_(event.target.src, 'url')
                else if event.target and event.target.nodeName == 'A'
                    targetUrl = _ga.extractParamFromUri_(event.target.href, 'url')
                try
                    trackTweet targetUrl
                    ga 'send', 'pageview', '/twitter/tweet' + targetUrl.replace(Settings.homepage, '/')
                    ga 'send', 'social', 'twitter', 'tweet', targetUrl
                catch e

            return


    # Twitter share
    vm.twitterShare = ->

        # Debug
        $log.info "Google analytics - twitter share", ga

        ga "send", "pageview", "/twitter/click/codeBlenderFacebookShare"
        ga "send", "social", "twitter", "tweet_click", url

        return

    # Facebook share
    vm.facebookShare = ->

        # Debug
        $log.info "Google analytics - facebook share", ga

        # Facebook share promise
        promise = $facebook.ui
            method        : 'share'
            mobile_iframe : true
            href          : url
            hashtag       : "#DryKISS"

        # Promise response
        promise.then ( response ) ->

            # Debug
            $log.info "FB UI response:", response

            # Check that we have a response
            # If they hit cancel the response is undefined
            if response

                # Analytics
                try
                    ga 'send', 'pageview', '/facebook/click/codeBlenderFacebookShare'
                    ga 'send', 'social', 'facebook', 'share_click', url
                catch h

            return

        return

    return

##
# Module
##
angular
    .module     'app.controller'
    .controller 'GoogleAnalyticsController', GoogleAnalyticsController

##
# Inject
##
GoogleAnalyticsController.$inject = [
    '$log'
    '$facebook'
]
