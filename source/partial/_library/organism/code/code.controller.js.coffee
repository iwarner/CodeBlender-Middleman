##
# Code Controller
#
# @usage
#
#
# @author Ian Warner <ian.warner@drykiss.com>
##

##
# JS Lint
##
'use strict'

##
# DataTableCtrl
##
CodeController = ->

    # Scope
    vm = this

    ##
    # Copy to Clipboard
    ##
    vm.copy = ( id ) ->

        console.log '#copy' + id
        console.log angular.element( '#copy' + id + ' .tab-pane.active' )
        console.log angular.element( '#copy' + id ).html()
        console.log angular.element( '#copy' + id ).text()
        console.log angular.element( '#copy' + id ).val()
        console.log id

        return

    return

# Module
angular.module 'app.controller'

##
# CodeController
##
.controller 'CodeController', CodeController