##
# Clipboard controller
#
# @usage
# require 'atom/clipboard/_clipboard_controller.coffee'
#
# @author   Ian Warner <ian.warner@drykiss.com>
# @category atom
##

##
# Clipboard controller
##
ClipboardController = ( $log, clipboard ) ->

    # Debug
    $log.info "Clipboard - controller", clipboard

    # This
    vm = this

    # Supported
    vm.supported = false;

    vm.success = ->
        $log.log "Copied!"

    vm.error = ( error ) ->
        $log.error "Error!", err

    # Check for clipboard compatibility
    if ! clipboard.supported
        $log.info "Copy to clipboard is not supported"

    # Click to copy
    vm.clickHandler = ->
        $log.info "Clipboard - clickHandler"
        clipboard.copyText( 'Copy this text' );

    return

##
# Module
##
angular
    .module     'app.controller'
    .controller 'ClipboardController', ClipboardController

##
# Inject
##
ClipboardController.$inject = [
    '$log'
    'clipboard'
]
