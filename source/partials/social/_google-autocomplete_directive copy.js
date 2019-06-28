##
# Google places autocomplete
#
# @usage
# require 'cbsocial/google/places/_autocomplete_directive.coffee'
# extraClass: "googlePlacesAutocomplete"
#
# @author   Ian Warner <ian.warner@drykiss.com>
# @category atom
##

##
# Google places autocomplete
##
angular.module 'app.directive'

##
# Directive
##
.directive 'googlePlacesAutocomplete', [

    '$rootScope'

    ( $rootScope ) ->

        'use strict'

        {
            # Options
            restrict : 'C'
            require  : 'ngModel'
            scope    :
                ngModel : '='
            replace  : true

            ##
            # Add marker
            ##
            addMarker : ( position, map ) ->
                # Remove marker
                if @marker
                    @marker.setMap null
                    @marker = false

                # Marker
                @marker = new ( google.maps.Marker )
                    draggable : true
                    map       : map
                    position  : position

                # Add dragend event to new marker
                @marker.addListener 'dragend', @handleDragEnd.bind @

            ##
            # Reverse Geocode position
            ##
            geocodePosition : ( pos ) ->

                # Geocode
                @geocoder.geocode { latLng: pos }, ( responses ) =>

                    if responses and responses.length > 0

                        # Update Autocomplete box
                        @ctrl.$setViewValue responses[ 0 ].formatted_address
                        @ctrl.$render()

                    else
                        return "No address"

            ##
            # Event listener for Dragend
            ##
            handleDragEnd : ( event ) ->
                # Geo code marker
                @geocodePosition new google.maps.LatLng event.latLng.lat(), event.latLng.lng()

                # Save to Rootscope
                $rootScope.latitude  = event.latLng.lat()
                $rootScope.longitude = event.latLng.lng()

                return

            # Link
            link : ( scope, element, attrs, ctrl ) ->
                # Geocode
                @geocoder = new google.maps.Geocoder()
                @ctrl     = ctrl

                # Default country
                if ! attrs.country
                    attrs.country = 'uk'

                # Default type
                if ! attrs.type
                    attrs.type = 'geocode'

                # Options
                options =

                    # An array of types specifies an explicit type or a type collection
                    types : [ attrs.type ]

                    # Restrict to a certain country
                    componentRestrictions :
                        country : attrs.country

                # Autocomplete
                autocomplete = new google.maps.places.Autocomplete( element[ 0 ], options );

                ##
                # Event listener for Place change
                #
                # @todo work this on the button - listen for broadcast from button
                ##
                google.maps.event.addListener autocomplete, 'place_changed', =>

                    # Place
                    place = autocomplete.getPlace()

                    # Details
                    if place.geometry and place.geometry.location

                        # Map
                        # @todo Should create the map outside of this event really and just move later
                        $rootScope.map = new ( google.maps.Map ) angular.element( '.googleMap' )[ 0 ],
                            center            : place.geometry.location
                            mapTypeControl    : false
                            panControl        : false
                            zoomControl       : true
                            streetViewControl : false
                            zoom              : 15

                        # Add marker
                        @addMarker place.geometry.location, $rootScope.map

                        # Update Autocomplete box
                        @ctrl.$setViewValue place.formatted_address
                        @ctrl.$render()

                        # Save to rootScope
                        $rootScope.latitude  = place.geometry.location.lat()
                        $rootScope.longitude = place.geometry.location.lng()

                        # Load map after modal shown
                        angular.element( '#placesModal' ).on 'shown.bs.modal', =>
                            google.maps.event.trigger $rootScope.map, 'resize'
                            $rootScope.map.setCenter place.geometry.location
                            return

                    else
                        $rootScope.latitude  = false
                        $rootScope.longitude = false
                        $rootScope.place     = @ctrl.$viewValue

                    return

                # Destroy
                scope.$on '$destroy', ->
                    google.maps.event.clearInstanceListeners element[ 0 ]
                    return
        }

]
