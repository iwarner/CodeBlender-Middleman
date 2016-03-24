##
# Dropdown
# Default JavaScript to give drop downs some added functionality
#
# @usage
# require molecule/dropdown/dropdown
#
# @author Ian Warner <ian.warner@drykiss.com>
##

##
# JS lint
##
'use strict'

##
# Dropdown controller
##
DropdownController = ( $log, $rootScope )  ->

    # This
    vm = this

    ##
    # Dropdown list click
    # This will place the selected text as the title of the dropdown
    ##
    vm.dropdown = ( event, data ) ->

        # Debug
        $rootScope.dropdownData = data

        # Target
        target = jQuery event.currentTarget

        # Selected text
        selText = target.html()

        # Set text
        target.closest( 'div' ).find( 'button[data-toggle="dropdown"]' ).html( selText + ' <span class="dropdown__icon"></span>' )

        return

    return

##
# Module
##
angular
    .module     'app.controller'
    .controller 'DropdownController', DropdownController

##
# Inject
##
DropdownController.$inject = [
    '$log'
    '$rootScope'
]
