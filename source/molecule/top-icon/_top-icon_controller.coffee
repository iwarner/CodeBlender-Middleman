##
# Top Icon
#
# @author Ian Warner <ian.warner@drykiss.com>
#
# @usage
# require top-icon/_top-icon_controller
#
# @author   Ian Warner <ian.warner@drykiss.com>
# @category molecule
# @see      https://docs.angularjs.org/api/ng/service/$anchorScroll
##

##
# Top Icon Controller
##
TopIconController = ( $log ) ->

    # This
    vm = this

    # Debug
    # $log.info "TopIconController"

    ##
    # Click
    ##
    vm.gotoTop = ->

        # Animate
        $( "body, html" ).animate
            scrollTop : 0
        , 1000

        return

        # scrollTop : ( reference, offset = 60 ) ->

        #     # Debug
        #     # log.info $( "#" + reference ).offset().top - offset

        #     # Animate To Benefits
        #     $( "html, body" ).clearQueue().animate
        #         scrollTop : $( "#" + reference ).offset().top - offset
        #     , 1000, "easeInOutQuint"

    return

##
# Module
##
angular
    .module     'app.controller'
    .controller 'TopIconController', TopIconController

##
# Inject
##
TopIconController.$inject = [
    '$log'
]
