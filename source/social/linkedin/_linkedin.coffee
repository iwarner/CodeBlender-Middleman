##
# LinkedIn JS SDK Inclusion
#
# @author Ian Warner <ian.warner@drykiss.com>
# @see    https://gist.github.com/brikis98/1021321
##
class App.Social.LinkedIn

    ##
    # Setup an event listener to make an API call once auth is complete
    ##
    onLinkedInLoad : =>

        # IN.User.logout()
        # log.info IN.User.isAuthorized()
        # log.info IN.API.Profile "me"

        IN.Event.on( IN, "auth", @getProfileData() )

    ##
    # Handle the successful return from the API call
    ##
    onSuccess : ( data ) ->

        log.info "Success", data

    ##
    # Handle an error response from the API call
    ##
    onError : ( error ) ->

        log.info "Error", error

    ##
    # Use the API call wrapper to request the member's basic profile data
    ##
    getProfileData : ( error ) ->

        log.info "Profile Data"
        IN.API.Raw( "people/rGQjATQHGR?format=json" ).result( @onSuccess ).error( @onError );

# Instantiate Utility
App.IN = new App.Social.LinkedIn
