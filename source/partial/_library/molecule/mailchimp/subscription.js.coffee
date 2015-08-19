##
# Mailchimp Subscribe Form
#
# Require
# Angular resource and Angular sanitize to be loaded into bower
#
# @author Ian Warner <ian.warner@drykiss.com>
# @see    https://github.com/keithio/angular-mailchimp
##

# JS Hint
'use strict'

##
# Module
##
angular.module( 'mailChimp', [

    'ng'
    'ngResource'
    'ngSanitize'

]).controller 'mailChimpSubscriptionCtrl', [

    '$log'
    '$resource'
    '$scope'
    '$rootScope'

    ( $log, $resource, $scope, $rootScope ) ->

        # Handle clicks on the form submission.
        $scope.submitSubscription = ( mailChimp, event ) ->

            # Stop Propagation
            event.preventDefault()

            # Variables
            actions               = undefined
            mailChimpSubscription = undefined
            params                = {}
            url                   = angular.element( event.target ).attr "action"

            # Get the fields in the MailChimp form
            fields = Object.keys( mailChimp )

            i = 0

            # Loop through the Fields
            while i < fields.length

                # Assign to Params
                params[ fields[ i ] ] = mailChimp[ fields[ i ] ]

                i++

            # Action
            actions =
                save :
                    method : 'jsonp'

            # Create the resource
            mailChimpSubscription = $resource( url, params, actions )

            # Send subscriber data to MailChimp
            mailChimpSubscription.save ( ( response ) ->

                # Define message containers.
                mailChimp.errorMessage   = ''
                mailChimp.successMessage = ''

                # Store the result from MailChimp
                mailChimp.result = response.result

                # mailChimp returned an error
                if response.result == 'error'

                    $log.error "HERE", response.msg

                    if response.msg

                        # Remove error numbers, if any
                        errorMessageParts = response.msg.split( ' - ' )

                        if errorMessageParts.length > 1
                            errorMessageParts.shift()

                        # Remove the error number
                        mailChimp.errorMessage = errorMessageParts.join( ' ' )

                    else

                        mailChimp.errorMessage = 'Sorry! An unknown error occured.'

                else if response.result == 'success'

                    mailChimp.successMessage = response.msg

                # Broadcast the result for global msgs
                $rootScope.$broadcast 'mailChimp-response', response.result, response.msg

                return

            ), ( error ) ->
                $log.error 'MailChimp Error: %o', error

                return

            return

            # Debug
            $log.log fields, mailChimp, params, url

        return
]

# ##
# # Mailchimp Subscribe Form
# #
# # @author Ian Warner <ian.warner@drykiss.com>
# ##
# class App.Views.Mailchimp extends Backbone.View

#     ##
#     # el
#     ##
#     el : $ ".container"

#     ##
#     # Events
#     ##
#     events :
#         "submit .mailChimpForm" : "formSubmit"

#     ##
#     # Form Submit
#     ##
#     formSubmit : ( e ) ->

#         # Prevent default
#         e.preventDefault()
#         e.stopPropagation()

#         # Element
#         ct  = e.currentTarget
#         $el = $ ct

#         # Debug
#         # log.info "EL", $el, $el.serialize()

#         # Check Validity
#         valid = ct.checkValidity()

#         # If not Valid
#         if valid

#             # Ajax POST
#             $.ajax

#                 cache       : false
#                 url         : $el.attr( "action" )
#                 data        : $el.serialize()
#                 contentType : "application/json; charset=utf-8"
#                 dataType    : "json"

#             # Done
#             .done ( data, status, xhr ) ->

#                 # If Error show message
#                 if data.result == "error"
#                     $( ".msg" ).show().text( "Sorry somthing went wrong : " + data.msg )
#                 else
#                     $( ".msg" ).show().text( data.msg )

#                 # Debug
#                 # log.info "Done: ", data, status, xhr

#                 return

#             # Fail
#             .fail ( xhr, status, error ) ->

#                 # Debug
#                 # log.info "Fail: ", xhr, status, error

#                 return

#             # Always
#             .always ( data, status, error ) ->

#                 # Debug
#                 # log.info "Always: ", data, status, error

#                 return