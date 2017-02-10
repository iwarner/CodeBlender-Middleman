##
# Tooltip directive
#
# @usage
# require molecule/tooltip/tooltip.directive
# "tooltip-directive" => true
#
# @author   Ian Warner <ian.warner@drykiss.com>
# @category molecule
##

##
# Tooltip directive
##
TooltipDirective = ( $log ) ->

    ##
    # Option
    ##
    restrict : 'A'

    ##
    # Link
    ##
    link : ( scope, element, attributes, controller, transclude ) ->

        # console.log "Tooltip directive"

        # Instantiate the tooltip
        element.find( "button" ).tooltip
            animation : "true"
            container : "body"
            html      : false
            # placement : "right"
            trigger   : "hover"

        return

##
# Module
##
angular
    .module    'app.directive'
    .directive 'tooltipDirective', TooltipDirective

##
# Inject
##
TooltipDirective.$inject = [
    '$log'
]
