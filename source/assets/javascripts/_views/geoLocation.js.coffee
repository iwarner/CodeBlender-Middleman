##
# GeoLocation
#
# @author Ian Warner <ian.warner@drykiss.com>
# @see    https://developers.google.com/maps/
# @see    https://developers.google.com/maps/documentation/javascript/tutorial
# @todo   All Maps API applications* should load the Maps API using an API key
# @todo   Markers may need to be created in a loop based on the data required
##
class App.Views.GeoLocation extends Backbone.View

    ##
    # Initalize
    ##
    initialize : ->

        # Instantiate the Geo Location Class
        @geo = new App.Classes.GeoLocation

        # Get Current Position with Success Callback
        @geo.getCurrentPosition @render

    ##
    # Callback
    ##
    render : ( position ) =>

        # Center Map
        center = new google.maps.LatLng position.coords.latitude, position.coords.longitude

        # Overide Options
        options =
            center : center

        # Create Map
        map = @geo.createMap center, canvas, options

        # Create the Info Window
        info = @geo.createInfoWindow $( ".infoWindow" )[0].outerHTML

        # Add A Marker
        marker = @geo.createMarker "You are here!", center

        # Create the Click Handler for the Marker
        google.maps.event.addListener marker, "click", ->
            info.open map, marker

        # When window resizes keep map centered
        google.maps.event.addDomListener window, "resize", ->
            map.setCenter center