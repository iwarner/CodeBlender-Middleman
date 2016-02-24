##
# Popover directive
#
# @usage
# require molecule/popover/popover.directive
# "popover-directive" => true
#
# @category molecule
# @author   Ian Warner <ian.warner@drykiss.com>
# @see      http://getbootstrap.com/javascript/#popovers
##

##
# JS lint
##
'use strict'

##
# Popover directive
##
PopoverDirective = ->

    ##
    # Option
    ##
    restrict : 'C'

    ##
    # Link
    ##
    link : ( scope, element, attributes, controller, transclude ) ->

        # Debug
        # console.log "Popover directive"

        # Create a close icon on the popover
        # template  : """
        #     <div class="popover" role="tooltip">
        #         <button type="button" data-dismiss="popover" class="close">&times;</button>
        #         <div class="arrow"></div>
        #         <h3 class="popover-title"></h3>
        #         <div class="popover-content"></div>
        #     </div>"""
        # html      : true
        # content   : d

        # Instantiate the popover
        element.popover
            animation : "true"
            container : "body"
            html      : true
            # placement : "right"
            trigger   : "hover"

        # Close pop-ups
        # bind_close_popups : ->
        #     $(document).on "click", "[data-dismiss=popover]", (e) =>
        #         e.preventDefault()
        #         $('.popMe').not( $(e.currentTarget) ).popover('hide');

        return

##
# Module
##
angular
    .module    'app.directive'
    .directive 'popoverDirective', PopoverDirective

##
# Inject
##
# PopoverDirective.$inject = [
# ]