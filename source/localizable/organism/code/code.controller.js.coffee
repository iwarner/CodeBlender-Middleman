##
# Code Controller
#
# @author Ian Warner <ian.warner@drykiss.com>
##

##
# JS lint
##
'use strict'

##
# CodeController
##
CodeController = ->

    # Scope
    vm = this

    ##
    # Copy to Clipboard
    ##
    vm.copy = ( id ) ->
        return angular.element( "#codeCopy#{ id } .tab-pane.active" ).text()

    return

# Module
angular.module 'app.controller'

##
# CodeController
##
.controller 'CodeController', CodeController