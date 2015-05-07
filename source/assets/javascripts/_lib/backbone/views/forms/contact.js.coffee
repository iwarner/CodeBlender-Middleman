##
# Contact
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.Views.Contact extends Backbone.View

    ##
    # EL
    ##
    el : $ ".map"

    ##
    # Initilize
    ##
    initialize : ->

        # Instantiate Map
        @gMap = new App.Classes.GoogleMap

        # Position
        position = coords :
            latitude  : "51.419778051"
            longitude : "-0.20196300"

        # Render the map based on position
        @render position

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
            height : 300

        # Create Map
        map = @gMap.createMap center, canvas, options

        # Create the Info Window
        # info = @gMap.createInfoWindow $( ".infoWindow" )[ 0 ].outerHTML

        # Add A Marker
        marker = @gMap.createMarker "Greentouch PI", center

        # Create the Click Handler for the Marker
        google.maps.event.addListener marker, "click", ->
            info.open map, marker

        # When window resizes keep map centered
        google.maps.event.addDomListener window, "resize", ->
            map.setCenter center