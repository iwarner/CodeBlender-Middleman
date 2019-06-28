##
# Google GeoCode service
#
# @usage
# require 'cbsocial/google/geocode/_geocode_service.coffee'
#
# @author   Ian Warner <ian.warner@drykiss.com>
# @category module
##

(->

    ##
    # Controller
    ##
    geoCodeService = ( $http, $log ) ->

        # Debug
        $log.info "GoeCode - service"

        return {

            ##
            # Get address
            #
            # @param address
            #
            # @todo Handle the various returned error codes from Google
            # @todo Handle finding by the PlaceID also
            ##
            getAddress : ( address, country ) ->

                # Debug
                $log.info "GeoCode service getAddress", address

                # Check to see if Google maps is loaded
                if typeof google == 'object' && typeof google.maps == 'object'

                    # Debug
                    $log.info "GeoCode service getAddress - google maps loaded"

                    # Geocoder
                    geocoder = new google.maps.Geocoder()

                    # Geocode
                    geocoder.geocode { latLng: pos }, ( responses ) =>

                        if status == google.maps.GeocoderStatus.OK

                            # if responses and responses.length > 0

                            # Debug
                            $log.info responses[ 0 ].formatted_address, @ctrl

                            # Update Autocomplete box
                            # @ctrl.$setViewValue responses[ 0 ].formatted_address
                            # @ctrl.$render()

                        else

                            # Debug
                            $log.info "No address"

                            return "No address"

                # Run an HTTP request to the API service
                else

                    # Debug
                    $log.info "GeoCode service getAddress - using API"

                    # Google URL
                    # Output Json or XML
                    url = 'https://maps.googleapis.com/maps/api/geocode/json?'
                    key = 'AIzaSyA_g0e_o6sz7zNJpbdTtrVoBrWokt6Y7BQ'

                    # Params
                    # address or components
                    # @see https://developers.google.com/maps/documentation/geocoding/intro#ComponentFiltering

                    # HTTP
                    $http
                        url    : url,
                        method : "GET",
                        params : { address: address, components: "country:#{ country }", key: key }

                    # Then
                    .then ( ( response ) =>

                        # Check that we have a response
                        if response.status == "OK"

                            # Debug
                            $log.info "GeoCode service getAddress - success response:", response

                            # Return the first matched address
                            return response.data.results[ 0 ]

                        # Zero results
                        else if response.status == "ZERO_RESULTS"

                            # Debug
                            $log.info "GeoCode service getAddress - fail: zero responses"

                        # Over API query rate
                        else if response.status == "OVER_QUERY_LIMIT"

                            # Debug
                            $log.info "GeoCode service getAddress - fail: Over query limit"

                        # Request denied
                        else if response.status == "REQUEST_DENIED"

                            # Debug
                            $log.info "GeoCode service getAddress - fail: request denied"

                        # Invalid request
                        else if response.status == "INVALID_REQUEST"

                            # Debug
                            $log.info "GeoCode service getAddress - fail: Invalid request"

                        # Unknown error
                        else if response.status == "UNKNOWN_ERROR"

                            # Debug
                            $log.info "GeoCode service getAddress - fail: Unknown error"

                    # Fatal error
                    ), ( response ) =>

                        # Debug
                        $log.info "GeoCode service getAddress - fatal error response:", response.data

                        return

                # # HTTP request to get the google results
                # $http.jsonp( $sce.trustAsResourceUrl( @sheet ) )

                # # Then
                # .then ( ( response ) =>

                #     # Debug
                #     # $log.info "Corporate Competition - response", response

                #     # Small
                #     if response.data.small
                #         @small = sortObject response.data.small

                #     # Medium
                #     if response.data.medium
                #         @medium = sortObject response.data.medium

                #     # Large
                #     if response.data.large
                #         @big  = sortObject response.data.large

                # # Error
                # ), ( response ) ->

                #     # Debug
                #     # $log.info "Error", response

                #     return

            ##
            #
            ##
            getCoOrdinates : () ->

                # Debug
                $log.info "Co-Ordinates"

                #   vm.geocodePosition = geocodePosition;

                #   var geocoder = new google.maps.Geocoder();

                #   function geocodePosition(lat, lng, fn) {
                #     var latlng = new google.maps.LatLng(lat, lng);
                #     geocoder.geocode({
                #       latLng: latlng
                #     }, function(responses) {
                #       if (responses && responses.length > 0) {
                #          fn(responses[0].formatted_address);
                #       } else {
                #          alert('Error while trying to find the location');
                #       }
                #     });
                #   }

        }

    ##
    # Module
    ##
    angular
        .module  'app.service'
        .service 'geoCodeService', geoCodeService

    ##
    # Inject
    ##
    geoCodeService.$inject = [
        '$http'
        '$log'
    ]

)()
