##
# GeoLocation
#
# @author Ian Warner <ian.warner@drykiss.com>
##
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