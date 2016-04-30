##
# Dropdown directive
# Default JavaScript to give drop downs some added functionality
#
# @usage
# require molecule/dropdown/dropdown
#
# @author   Ian Warner <ian.warner@drykiss.com>
# @category molecule
##

##
# JS lint
##
'use strict'

##
# Dropdown directive
##
CBDropdownDirective = ( $log, $rootScope )  ->

    # Debug
    # $log.log "Dropdown directive"

    ##
    # Option
    ##
    restrict : 'C'

    ##
    # Controller
    ##
    controller : [
        '$scope'
        '$element'
        ( $scope, $element ) ->

            # Dropdown click
            $scope.dropdown = ( $event, data ) ->

                # Data
                $rootScope.dropdownData = data

                # Target
                target = jQuery $event.currentTarget

                # Selected text
                selText = target.html()

                # Set text
                target.closest( 'div' ).find( 'button[data-toggle="dropdown"]' ).html( selText + ' <span class="dropdown__icon"></span>' )

                return

            return
    ]

##
# Module
##
angular
    .module    'app.directive'
    .directive 'cbDropdownDirective', CBDropdownDirective

##
# Inject
##
CBDropdownDirective.$inject = [
    '$log'
    '$rootScope'
]
