##
# Validation Errors
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.Utils.Validation

    ##
    # Valid
    ##
    valid : ( view, attr, error, selector ) ->

        $el    = view.$ "[ name=" + attr + " ]"
        $group = $el.closest ".form-group"
        $group.removeClass "has-error"
        $group.find( ".help-block" ).html( "" ).addClass( "hidden" )

        # Debug
        # log.info "View : ", view, "Attr : ", attr, "Selector : ", selector

    ##
    # Invalid
    ##
    invalid : ( view, attr, error, selector ) ->

        $el    = view.$ "[ name=" + attr + " ]"
        $group = $el.closest ".form-group"
        $group.addClass "has-error"
        $group.find( ".help-block" ).html( error ).removeClass( "hidden" )

        # Debug
        # log.info "View : ", view, "Attr : ", attr, "error", error, "Selector : ", selector

# Instantiate Utility
@validation = new App.Utils.Validation