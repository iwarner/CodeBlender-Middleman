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

    ( $log ) ->

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

                @marker.addListener 'dragend', @handleDragEnd.bind @

            ##
            # Geocode
            ##
            geocodePosition : ( pos ) ->

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

                        # marker.formatted_address = 'Cannot determine address at this location.'
                        return "No address"

            ##
            # Event listener for Dragend
            ##
            handleDragEnd : ( event ) ->

                # Debug
                # $log.info "handleDragEnd", event, event.latLng.lat(), event.latLng.lng()

                # Geo code marker
                @geocodePosition new google.maps.LatLng event.latLng.lat(), event.latLng.lng()
                return

            # Link
            link : ( scope, element, attrs, ctrl ) ->

                # Geocoder
                @geocoder = new google.maps.Geocoder()
                @ctrl     = ctrl

                if ! attrs.country
                    attrs.country = 'uk'

                if ! attrs.type
                    attrs.type = 'geocode'

                # Debug
                # $log.info "googlePlacesAutocomplete - Scope :",   scope
                # $log.info "googlePlacesAutocomplete - Element :", element
                # $log.info "googlePlacesAutocomplete - Attrs :",   attrs
                # $log.info "googlePlacesAutocomplete - Ctrl :",    ctrl
                # $log.info "googlePlacesAutocomplete - Country :",         attrs.country
                # $log.info "googlePlacesAutocomplete - Type :",            attrs.type
                # $log.info "googlePlacesAutocomplete - Sorce selection :", attrs.forceSelection

                # Options
                options =

                    # An array of types specifies an explicit type or a type collection
                    types : [ attrs.type ]

                    componentRestrictions :
                        country : attrs.country

                # Autocomplete
                autocomplete = new google.maps.places.Autocomplete( element[ 0 ], options );

                # Default position
                uk =
                    lat : 54.8
                    lng : -4.6

                # Map
                map = new ( google.maps.Map ) $( '.googleMap' )[ 0 ],
                    center            : uk
                    mapTypeControl    : false
                    panControl        : false
                    zoomControl       : true
                    streetViewControl : false
                    zoom              : 6

                # Add marker
                @addMarker( uk, map )

                ##
                # Event listener for Place change
                ##
                google.maps.event.addListener autocomplete, 'place_changed', =>

                    # Place
                    place = autocomplete.getPlace()

                    # Details
                    if place.geometry and place.geometry.location

                        # Details
                        details =
                            latitude  : place.geometry.location.lat()
                            longitude : place.geometry.location.lng()

                        # Map Zoom
                        map.panTo place.geometry.location
                        map.setZoom 15

                        @addMarker place.geometry.location, map

                    else {}

                    return

                # Destroy
                scope.$on '$destroy', ->
                    google.maps.event.clearInstanceListeners element[ 0 ]
                    return

        }

]
