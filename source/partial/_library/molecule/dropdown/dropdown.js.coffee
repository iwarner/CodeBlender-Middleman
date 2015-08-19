##
# Dropdown
# Default JavaScript to give Dropdowns some added functionality
#
# @usage
# require molecule/dropdown/dropdown
#
# @author Ian Warner <ian.warner@drykiss.com>
##

##
# JS Lint
##
'use strict'

# Module
angular.module 'app.controllers'

##
# Top Icon Controller
##
.controller 'DropdownCtrl', [

    '$scope'

    ( $scope ) ->

        ##
        # Dropdown List Click
        # This will place the selected text as the title of the dropdown
        ##
        $scope.dropdown = ( event ) ->

            # Target
            target = jQuery event.currentTarget

            # Selected text
            selText = target.html()

            # console.log target.closest( '.dropdown' ).find( '.dropdown-toggle' ).replaceWith( selText )
            # <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:;"><span class="fa fa-bars fa-fw"></span>
            # Menu
            # <span class="fa fa-chevron-down fa-fw"></span>
            # </a>

            # Set Text
            target.closest( 'div' ).find( 'button[data-toggle="dropdown"]' ).html( selText + ' <span class="dropdown__icon"></span>' )

            return

        return
]
