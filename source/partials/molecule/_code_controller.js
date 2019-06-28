##
# Code controller
#
# @author   Ian Warner <ian.warner@drykiss.com>
# @category molecule
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
    # Copy to clipboard
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