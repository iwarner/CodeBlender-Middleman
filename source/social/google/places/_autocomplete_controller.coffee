##
# Autocomplete controller
#
# @usage
# require 'cbsocial/google/places/_autocomplete_controller.coffee'
#
# @author   Ian Warner <ian.warner@drykiss.com>
# @category social
##

##
# Controller
##
AutocompleteController = ( $http, $log, $rootScope, $window ) ->

    # Debug
    # $log.info "Autocomplete - controller"

    # This
    vm = this

    # Variable
    vm.showError = false

    # Scroll fade in when 100px from the top
    angular.element( window ).scroll ->

        if angular.element( '#resolutionSize' ).is( ':hidden' )

            if angular.element( this ).scrollTop() > 100
                angular.element( '.findFood__position label, .findFood__link' ).fadeOut( "slow" )
            else
                angular.element( '.findFood__position label, .findFood__link' ).fadeIn( "slow" )
            return

    ##
    # Add marker
    ##
    addMarker = ( position, map ) ->

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
        @marker.addListener 'dragend', handleDragEnd.bind @

    ##
    # Event listener for Dragend
    ##
    handleDragEnd = ( event ) ->

        # Debug
        # $log.info "handleDragEnd", event, event.latLng.lat(), event.latLng.lng()

        # Save to Rootscope
        $rootScope.latitude  = event.latLng.lat()
        $rootScope.longitude = event.latLng.lng()

        return

    ##
    # Geocode place
    # Takes a place name and geocodes it into a location
    #
    # @see https://developers.google.com/maps/documentation/javascript/geocoding
    # https://maps.googleapis.com/maps/api/js/GeocodeService.Search?4sliffey&7sUS&8m2&1scountry&2sie&9sen-GB&key=AIzaSyAyr59mULbjJrOHIIMyd_KA9PH8EkLkEoU&callback=_xdc_._wzdz2k&token=76781
    ##
    geocodePlace = ( place ) ->

        # Debug
        # $log.info "Autocomplete - GeoCode Place", place

        geocoder = new google.maps.Geocoder()

        # Data
        data =
            address : place
            componentRestrictions :
                country : 'ie'

        # Geocode
        geocoder.geocode data, ( responses ) ->

            if responses and responses.length > 0

                # Debug
                # $log.info "GeocodePlace - response :", responses[ 0 ].geometry.location.lat(), responses[ 0 ].geometry.location.lng(), responses[ 0 ].formatted_address
                # $log.info "GeocodePlace - location :", responses[ 0 ].geometry.location

                # Get co-ordinates
                $rootScope.latitude  = responses[ 0 ].geometry.location.lat()
                $rootScope.longitude = responses[ 0 ].geometry.location.lng()

                # Map
                # @todo Should create the map outside of this event really and just move later
                $rootScope.map = new ( google.maps.Map ) angular.element( '.googleMap' )[ 0 ],
                    center            : responses[ 0 ].geometry.location
                    mapTypeControl    : false
                    panControl        : false
                    zoomControl       : true
                    streetViewControl : false
                    zoom              : 15

                # Add marker
                addMarker responses[ 0 ].geometry.location, $rootScope.map

                # Update map
                angular.element( '#placesModal' ).on 'shown.bs.modal', ->
                    google.maps.event.trigger $rootScope.map, 'resize'
                    $rootScope.map.setCenter responses[ 0 ].geometry.location

            else

                # Debug
                # $log.info "No address"

                return "No address"

    ##
    # Find food submit on initial form
    #
    # @todo On Enter the Google Places  change event is fired + Submit - no XHR sent
    # @todo On click just the submit is fired
    # @todo Both will have no location associated to them
    ##
    vm.submit = ( event, isValid ) ->

        # Errors
        vm.showErrorBlank     = false
        vm.showErrorYQL       = false
        vm.showErrorNoService = false

        # Debug
        # $log.info "Autocomplete - submit", $rootScope.latitude, $rootScope.longitude, $rootScope.place

        # If Valid
        if isValid

            if ! $rootScope.latitude

                # Debug
                # $log.info "Autocomplete - valid - no location - do lookup"
                geocodePlace( $rootScope.place )

            # Check if modal is shown
            if ! angular.element( '#placesModal' ).hasClass 'in'

                # Debug
                # $log.info "Autocomplete - valid", angular.element( '#placesModal' )

                # Open up the modal window
                angular.element( '#placesModal' ).modal 'show'

        # Show blank error
        else
            vm.showError      = true
            vm.showErrorBlank = true

        return

    ##
    # Find food confirm on modal
    ##
    vm.confirm = ->

        # Errors
        vm.showErrorBlank     = false
        vm.showErrorYQL       = false
        vm.showErrorNoService = false

        # Debug
        # $log.info "Autocomplete - confirm"

        url = angular.element( 'body' ).data( 'url' )

        # Set the data for the call
        data =
           "url"       : "#{ url }/api/restaurants"
           "longitude" : $rootScope.longitude
           "latitude"  : $rootScope.latitude
           "format"    : "json"
           "version"   : "1.01"

        # Http get to YQL
        $http.get 'https://query.yahooapis.com/v1/public/yql/drykiss/DeliverooLocation', params : data

        # Then
        .then ( ( response ) ->

            # Debug
            # $log.info "Autocomplete - status", response.statusText

            # URL
            if response.data.query.results.json.url

                # Debug
                # $log.info "Autocomplete controller - Success:", response.statusText

                # Hide errors
                vm.showError = false

                # Refresh the page to the URL results
                $window.location.href = "#{ url }#{ response.data.query.results.json.url }"

            else

                # Debug
                # $log.info "Autocomplete controller - Bad request:", response.statusText

                # Close modal
                angular.element( '#placesModal' ).modal 'hide'

                # If there is an error close the modal and display the error message
                vm.showError          = true
                vm.showErrorNoService = true

        # Error
        ), ( response ) ->

            # Debug
            # $log.info "Autocomplete controller - error:", response.statusText

            vm.showError    = true
            vm.showErrorYQL = true
            vm.errorMessage = response.data.error.description

    return

# Module
angular
    .module     'app.controller'
    .controller 'AutocompleteController', AutocompleteController

##
# Inject
##
AutocompleteController.$inject = [
    '$http'
    '$log'
    '$rootScope'
    '$window'
]
