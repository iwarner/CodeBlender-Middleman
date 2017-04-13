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

    '$log'
    '$rootScope'

    ( $log, $rootScope ) ->

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

                # Debug
                # $log.info "addMarker", position, map

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

                # Debug
                # $log.info "geocodePosition"

                # Geocode
                @geocoder.geocode { latLng: pos }, ( responses ) =>

                    if responses and responses.length > 0

                        # Debug
                        # $log.info responses[ 0 ].formatted_address, @ctrl

                        # Update Autocomplete box
                        @ctrl.$setViewValue responses[ 0 ].formatted_address
                        @ctrl.$render()

                    else

                        # Debug
                        # $log.info "No address"

                        return "No address"

            ##
            # Event listener for Dragend
            ##
            handleDragEnd : ( event ) ->

                # Debug
                # $log.info "handleDragEnd", event, event.latLng.lat(), event.latLng.lng()

                # Geo code marker
                @geocodePosition new google.maps.LatLng event.latLng.lat(), event.latLng.lng()

                # Save to Rootscope
                $rootScope.latitude  = event.latLng.lat()
                $rootScope.longitude = event.latLng.lng()

                return

            # Link
            link : ( scope, element, attrs, ctrl ) ->

                # Debug
                # $log.info "googlePlacesAutocomplete - Scope :",   scope
                # $log.info "googlePlacesAutocomplete - Element :", element
                # $log.info "googlePlacesAutocomplete - Attrs :",   attrs
                # $log.info "googlePlacesAutocomplete - Ctrl :",    ctrl

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

                # Debug
                # $log.info "googlePlacesAutocomplete - Options :", options

                # Autocomplete
                autocomplete = new google.maps.places.Autocomplete( element[ 0 ], options );

                ##
                # Event listener for Place change
                #
                # @todo work this on the button - listen for broadcast from button
                ##
                google.maps.event.addListener autocomplete, 'place_changed', =>

                    # Debug
                    # $log.info "googlePlacesAutocomplete - place_changed"

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

                        # Debug
                        # $log.info "googlePlacesAutocomplete - place     :", place.formatted_address
                        # $log.info "googlePlacesAutocomplete - place     :", place.geometry.location
                        # $log.info "googlePlacesAutocomplete - latitude  :", place.geometry.location.lat()
                        # $log.info "googlePlacesAutocomplete - longitude :", place.geometry.location.lng()

                        # Save to rootScope
                        $rootScope.latitude  = place.geometry.location.lat()
                        $rootScope.longitude = place.geometry.location.lng()

                        # Load map after modal shown
                        angular.element( '#placesModal' ).on 'shown.bs.modal', =>
                            google.maps.event.trigger $rootScope.map, 'resize'
                            $rootScope.map.setCenter place.geometry.location
                            return

                    else

                        # Debug
                        # $log.info "googlePlacesAutocomplete - No place found:"

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
