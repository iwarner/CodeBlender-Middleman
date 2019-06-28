# GeoCode Controller
#
# @usage
# require 'cbsocial/google/geocode/_geocode_controller.coffee'
#
# @author   Ian Warner <ian.warner@drykiss.com>
# @category module

(->

    # Controller
    # Calls the GeoCode service
    GeoCodeController = ( $log, $scope, geoCodeService ) ->

        ##
        # Init
        ##
        init = () =>

            # Debug
            $log.info "GoeCode - controller", init, geoCodeService

            # Actions
            @submit        = submit
            @submitReverse = submitReverse

            # Debug - GeoCode Form
            @geoCodeAddress          = undefined
            @geoCodeFormData         = {}
            @geoCodeFormData.address = "SW19 2EZ"

            # Debug - GeoCode Reverse Form
            @geoCodeReverseFormData           = {}
            @geoCodeReverseFormData.latitude  = "51.4186534"
            @geoCodeReverseFormData.longitude = "-0.1723711"

            # Disable button
            @buttonDisabled = false

        ##
        # GeoCode submit
        ##
        submit = ( event, isValid ) =>

            # Debug
            $log.info "GoeCode controller - submit:", @geoCodeFormData

            # # Broadcast Errors on Submit click
            # $scope.$broadcast 'show-errors-check-validity'

            # If Valid
            if isValid

                # Debug
                $log.info "GeoCode controller form submit : valid"

                # Call the GeoCode Service getAddress
                new geoCodeService.getAddress( @geoCodeFormData.address, @geoCodeFormData.country )
                .then ( ( response ) =>

                    # Debug
                    $log.info "GeoCode controller service response:", response

                    # Set results
                    @geoCodeAddress   = response.formatted_address
                    @geoCodePlaceID   = response.place_id
                    @geoCodeLatitude  = response.geometry.location.lat
                    @geoCodeLongitude = response.geometry.location.lng

                )

            return

        ##
        # GeoCode reverse submit
        ##
        submitReverse = ( event, isValid ) =>

            # Debug
            $log.info "GoeCode controller - submit:", @geoCodeReverseFormData

            # Broadcast Errors on Submit click
            $scope.$broadcast 'show-errors-check-validity'

            # If Valid
            if isValid

                # Debug
                $log.info "GeoCode controle form submit : valid"

            return

        # Init
        init()

        return

    ##
    # Module
    ##
    angular
        .module     'app.controller'
        .controller 'GeoCodeController', GeoCodeController

    ##
    # Inject
    ##
    GeoCodeController.$inject = [
        '$log'
        '$scope'
        'geoCodeService'
    ]

)()
