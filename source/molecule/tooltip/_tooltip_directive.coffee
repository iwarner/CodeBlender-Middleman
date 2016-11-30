##
# Tooltip directive
#
# @usage
# require molecule/tooltip/tooltip.directive
# "tooltip-directive" => true
#
# @category molecule
# @author   Ian Warner <ian.warner@drykiss.com>
# @see      http://getbootstrap.com/javascript/#tooltips
##

##
# Tooltip directive
##
TooltipDirective = ->

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
# TooltipDirective.$inject = [
# ]