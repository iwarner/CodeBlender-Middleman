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
    # Option
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
        el = document.getElementById "geoUpdate"

        el.innerHTML = 'Latitude: '          + position.coords.latitude         + '<br>' +
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

class App.Views.GeoLocation extends Backbone.View

    ##
    # EL
    ##
    el : $ ".container"

    ##
    # Events
    ##
    events :
        "click  .input-group-addon" : "tapAddon"
        "submit .locationForm"      : "formSubmit"

    ##
    # Initilize
    ##
    initialize : ->

        # Check ID exists
        if el = document.querySelector "#place"
            searchBox = new google.maps.places.SearchBox el
        else
            throw new Error "#place is not defined in the DOM"

        # Instantiate Map
        @gMap = new App.Classes.GoogleMap

    ##
    # Tap Addon
    ##
    tapAddon : ->

        # Instantiate the Geo Location Class
        @geo = new App.Classes.GeoLocation().current @render

    ##
    # Form Submit
    ##
    formSubmit : ( event ) ->

        # Prevent default
        event.preventDefault()
        event.stopPropagation()

        # Element
        ct  = event.currentTarget
        $el = $ ct

        # Check Validity
        valid = ct.checkValidity()

        # If not Valid
        if valid

            # Get Address Field
            address = document.getElementById( 'place' ).value

            # Instantitate the GeoCoder Class
            geoCode = new App.Classes.GoogleGeoCode().codePlace( address, @render )

    ##
    # Callback
    ##
    render : ( position ) =>

        # Center Map
        center = new google.maps.LatLng position.coords.latitude, position.coords.longitude

        # Overide Options
        options =
            center : center
            zoom   : 16

        # Overide Canvas
        canvas =
            height : 400

        # Show Map
        $( ".latLong" ).show()

        # Create Map
        map = @gMap.createMap center, canvas, options

        # Create the Info Window
        info = @gMap.createInfoWindow $( ".infoWindow" )[ 0 ].outerHTML

        # Add A Marker
        marker = @gMap.createMarker "You are here!", center

        # Create the Click Handler for the Marker
        google.maps.event.addListener marker, "click", ->
            info.open map, marker

        # When window resizes keep map centered
        google.maps.event.addDomListener window, "resize", ->
            map.setCenter center

        # Click event to get co-ordinates back
        google.maps.event.addListener map, "click", ( e ) ->

            # Get the Co-ords
            lat = e.latLng.lat()
            lng = e.latLng.lng()

            # Update the Input Fields
            $( "#latitude" ).val( lat )
            $( "#longitude" ).val( lng )
