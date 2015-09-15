##
# Dropdown
# Default JavaScript to give Dropdowns some added functionality
#
# @usage
# require molecule/dropdown/dropdown
#
# @author Ian Warner <ian.warner@drykiss.com>
#
# @todo Remove the JQuery stuff
# @todo Should be a directive as manipulating the DOM
##

##
# JS Lint
##
'use strict'

##
# Suggested Action Controller
##
CBDropdownController = ->

    # This
    vm = this

    ##
    # Dropdown List Click
    # This will place the selected text as the title of the dropdown
    ##
    vm.dropdown = ( event ) ->

        # Target
        target = jQuery event.currentTarget

        # Selected text
        selText = target.html()

        # Set Text
        target.closest( 'div' ).find( 'button[data-toggle="dropdown"]' ).html( selText + ' <span class="dropdown__icon"></span>' )

        return

    return

##
# Module
##
angular
    .module     'app.controller'
    .controller 'CBDropdownController', CBDropdownController