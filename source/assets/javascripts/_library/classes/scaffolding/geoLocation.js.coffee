##
# GeoLocation Class
# The geolocation object provides access to location data based on the device's
# GPS sensor or inferred from network signals.
#
# Setting up a watch will periodically pole the success method with the new location
# On opening up an app the OS should prompt the user to allow Current Location use.
#
# Properties
# latitude         : Latitude in decimal degrees. (Number)
# longitude        : Longitude in decimal degrees. (Number)
# altitude         : Height of the position in meters above the ellipsoid. (Number)
# accuracy         : Accuracy level of the latitude and longitude coordinates in meters. (Number)
# altitudeAccuracy : Accuracy level of the altitude coordinate in meters. (Number)
# heading          : Direction of travel, specified in degrees counting clockwise relative to the true north. (Number)
# speed            : Current ground speed of the device, specified in meters per second. (Number)
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.Classes.GeoLocation

    ##
    # Options
    #
    # @see https://developer.mozilla.org/en-US/docs/Web/API/PositionOptions
    ##
    geoOptions =
        enableHighAccuracy : true
        maximumAge         : 0
        timeout            : 5000

    ##
    # Variables
    ##
    watchID = null

    ##
    # Get Current Position
    ##
    current : ( callback ) ->

        # Get Current Position
        navigator.geolocation.getCurrentPosition callback, @error, geoOptions

    ##
    # Watch Position
    ##
    watch : ( callback ) ->

        # Get Current Position
        watchID = navigator.geolocation.watchPosition callback, @error, geoOptions

    ##
    # Clear Watch
    ##
    clear : ->

        # Clear Watch
        if watchID != null
            navigator.geolocation.clearWatch watchID
            watchID = null

    ##
    # Success
    # This is not really used as callbacks are put into place
    ##
    success : ( position ) ->

        # Render the content - should be in a callback
        element = document.getElementById "geoUpdate"

        element.innerHTML = 'Latitude: '          + position.coords.latitude         + '<br>' +
                            'Longitude: '         + position.coords.longitude        + '<br>' +
                            'Altitude: '          + position.coords.altitude         + '<br>' +
                            'Accuracy: '          + position.coords.accuracy         + '<br>' +
                            'Altitude Accuracy: ' + position.coords.altitudeAccuracy + '<br>' +
                            'Heading: '           + position.coords.heading          + '<br>' +
                            'Speed: '             + position.coords.speed            + '<br>' +
                            'Timestamp: '         + position.timestamp               + '<br>'

    ##
    # Error
    ##
    error : ( error ) ->

        # Debug
        log.info 'Error code: ' + error.code + '\n' + 'Error message: ' + error.message + '\n'