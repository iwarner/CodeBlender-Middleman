##
# Collapse events
#
# Swapping icon indicators on toggle show/hide
#
# ICONS to use:
# - fa-plus / fa-minus
# - fa-chevron-down / fa-chevron-right
#
##
class App.Views.Collapse extends Backbone.View

    ##
    # Events
    ##
    events :
        "shown.bs.collapse"  : "toggleOpen",
        "hidden.bs.collapse" : "toggleClose"

    ##
    # Initialize
    ##
    initialize : ->

        log.info "Collapse"

        -# Set the icons
        $(".panel-collapse").each ->
            if $(this).is(":hidden")
                $(this).prev().find("i.indicator").addClass "fa-plus"
            else
                $(this).prev().find("i.indicator").addClass "fa-minus"
            return


    ##
    # The collapsable content is OPENED
    ##
    toggleOpen : (e) =>

        $(e.target)
            .prev('.panel-heading')
            .find("i.indicator")
            .removeClass('fa-plus')
            .addClass('fa-minus');
        false

    ##
    # The collapsable content is CLOSED
    ##
    toggleClose : (e) =>

        $(e.target)
            .prev('.panel-heading')
            .find("i.indicator")
            .removeClass('fa-minus')
            .addClass('fa-plus');
        false

