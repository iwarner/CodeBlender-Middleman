##
# Mailchimp Subscribe Form
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.Views.Mailchimp extends Backbone.View

    ##
    # el
    ##
    el : $ ".container"

    ##
    # Events
    ##
    events :
        "submit .mailChimpForm" : "formSubmit"

    ##
    # Form Submit
    ##
    formSubmit : ( e ) ->

        # Prevent default
        e.preventDefault()
        e.stopPropagation()

        # Element
        ct  = e.currentTarget
        $el = $ ct

        # Debug
        # log.info "EL", $el, $el.serialize()

        # Check Validity
        valid = ct.checkValidity()

        # If not Valid
        if valid

            # Ajax POST
            $.ajax

                cache       : false
                url         : $el.attr( "action" )
                data        : $el.serialize()
                contentType : "application/json; charset=utf-8"
                dataType    : "json"

            # Done
            .done ( data, status, xhr ) ->

                # If Error show message
                if data.result == "error"
                    $( ".msg" ).show().text( "Sorry somthing went wrong : " + data.msg )
                else
                    $( ".msg" ).show().text( data.msg )

                # Debug
                # log.info "Done: ", data, status, xhr

                return

            # Fail
            .fail ( xhr, status, error ) ->

                # Debug
                # log.info "Fail: ", xhr, status, error

                return

            # Always
            .always ( data, status, error ) ->

                # Debug
                # log.info "Always: ", data, status, error

                return