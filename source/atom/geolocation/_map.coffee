##
# Google Map
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.Classes.GoogleMap

    ##
    # Map object
    ##
    map = ""

    ##
    # Array to hold the assigned Markers
    #
    markers = []

    ##
    # Create Map
    #
    # @param latlng  Object
    # @param canvas  Object
    # @param options Object Overide the default options, center is required
    ##
    createMap : ( latlng, canvas, options ) ->

        # Default Map Options
        defaultOptions =
            zoom                     : 14
            zoomControl              : true
            zoomControlOptions       :
                style : google.maps.ZoomControlStyle.SMALL
            mapTypeControl           : true
            mapTypeControlOptions    :
                style : google.maps.MapTypeControlStyle.DROPDOWN_MENU
            navigationControlOptions :
                style : google.maps.NavigationControlStyle.SMALL
            mapTypeId : google.maps.MapTypeId.ROADMAP
            streetViewControl        : false

        # Default Canvas Options
        canvasOptions =
            height : 400

        # If Map is already created
        if ! map

            # Merge Objects
            $.extend canvas, canvasOptions

            # Selector
            el = document.querySelector ".gMap"

            # Set up map
            c               = document.createElement "div"
            c.id           = "mapcanvas"
            c.style.height = canvasOptions.height + "px"
            c.style.width  = "100%"

            # Append Map
            el.appendChild c

            # Merge Objects
            $.extend defaultOptions, options

            # Create Map
            map = new google.maps.Map c, defaultOptions

        # If Map is already created
        else

            # Set Center for map
            map.setCenter options.center

            # Return Map
            map

    ##
    # Create a Map Marker
    #
    # @param title  String Title of the marker
    # @param center Location to place the Marker
    # @see   https://developers.google.com/maps/documentation/javascript/examples/marker-remove
    ##
    createMarker : ( title, center ) ->

        # Add A Marker at the Current Location
        marker = new google.maps.Marker
            animation : google.maps.Animation.DROP
            draggable : false
            # icon      : "https://maps.gstatic.com/mapfiles/ms2/micons/dollar.png"
            map       : map
            position  : center
            title     : title

        # Add marker to Array
        # markers.push marker

    ##
    # Create Info Window
    # An InfoWindow displays content (usually text or images) in a popup window
    # above the map, at a given location. The info window has a content area and
    # a tapered stem. The tip of the stem is attached to a specified location on the map.
    #
    # @param content String HTML content for the info window
    # @see   https://developers.google.com/maps/documentation/javascript/infowindows
    ##
    createInfoWindow : ( content ) ->

        # Create the Info Window
        info = new google.maps.InfoWindow
            content     : content
            pixelOffset : null
            position    : null
            maxWidth    : 400
