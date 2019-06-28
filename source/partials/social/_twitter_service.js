##
# Twitter service
#
# @usage
# require social/twitter/_twitter_service
#
# @author   Ian Warner <ian.warner@drykiss.com>
# @category social
# @see      https://dev.twitter.com/rest/tools/console
# @see      https://www.sitepoint.com/building-twitter-app-using-angularjs/
##

##
# JS lint
##
'use strict'

##
# Service
##
TwitterService = ( $q ) ->

    #
    authorizationResult = false

    #
    {
        ##
        # initialise
        ##
        initialise : ->

            # Debug
            console.log "Twitter service - initialise"

            # Initialize OAuth.io with public key of the application
            OAuth.initialize 'bJwtCHf9e5D3ypLhShgTDg15wGA', cache: true

            # Try to create an authorization result when the page loads,
            # this means a returning user won't have to click the twitter button again
            authorizationResult = OAuth.create 'twitter'

            return

        ##
        #
        ##
        isReady : ->
            authorizationResult

        ##
        # Connect to twitter
        ##
        connectTwitter : ->

            deferred = $q.defer()

            OAuth.popup 'twitter', { cache: true }, (error, result) ->

                # cache means to execute the callback if the tokens are already present
                if !error
                    authorizationResult = result
                    deferred.resolve()
                else
                    #do something if there's an error
                return

            deferred.promise

        ##
        #
        ##
        clearCache : ->
            OAuth.clearCache 'twitter'
            authorizationResult = false
            return

        ##
        # Get latest tweets
        # Returns a collection of the most recent Tweets and retweets posted by
        # the authenticating user and the users they follow
        ##
        getLatestTweets : ( search, maxId ) ->

            # Create a deferred object using Angular's $q service
            deferred = $q.defer()


            # https://api.twitter.com/1.1/search/tweets.json?q=bangkok&geocode=13.724239%2C100.578657%2C50km&lang=en&locale=en&count=15

            # Geocode latitude, longitude, radius
            # 13.724239, 100.578657, 50km

            #
            url = '/1.1/search/tweets.json?q=bangkok&geocode=13.724239%2C100.578657%2C50km&lang=en&locale=en&count=15'

            #
            if maxId
                url += '&max_id=' + maxId

            #
            promise = authorizationResult.get( url ).done( ( data ) ->
                deferred.resolve data
                return

            ).fail( ( err ) ->
                deferred.reject err
                return
            )

            deferred.promise
    }

# Module
angular
    .module  'app.service'
    .factory 'TwitterService', TwitterService

##
# Inject
##
TwitterService.$inject = [
    '$q'
]
