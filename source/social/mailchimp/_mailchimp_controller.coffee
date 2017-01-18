##
# Mailchimp subscribe form
#
# Require
# Angular resource and Angular sanitize to be loaded into bower
#
# @author Ian Warner <ian.warner@drykiss.com>
# @see    https://github.com/keithio/angular-mailchimp
#
# @todo Turn into an app.controller
##

# JS lint
'use strict'

##
# MailChimp
##
MailChimpSubscriptionController = ( $log, $resource, $rootScope, $sce ) ->

    # Debug
    $log.info "MailChimp - controller"

    # This
    vm = this

    # Handle clicks on the form submission.
    vm.submitSubscription = ( mailChimp, event ) ->

        # Debug
        $log.info "MailChimp - submit", mailChimp

        # Stop propagation
        event.preventDefault()

        # Variable
        actions               = undefined
        mailChimpSubscription = undefined
        params                = {}
        url                   = angular.element( event.target ).attr "action"

        # Get the fields in the MailChimp form
        fields = Object.keys( mailChimp )

        i = 0

        # Loop through the Fields
        while i < fields.length

            # Assign to parameters
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
                    errorMessage = errorMessageParts.join( ' ' )

                else

                    errorMessage = 'Sorry! An unknown error occurred.'

                mailChimp.errorMessage = $sce.trustAsHtml errorMessage

            else if response.result == 'success'

                mailChimp.successMessage = $sce.trustAsHtml response.msg

            # Emit the result for global messages
            $rootScope.$emit 'mailChimp-response', response.result, $sce.trustAsHtml response.msg

            return

        ), ( error ) ->

            $log.error 'MailChimp Error: %o', error
            return

        return

        # Debug
        $log.log fields, mailChimp, params, url

    return

##
# Module
##
angular
    .module     'app.controller'
    .controller 'MailChimpSubscriptionController', MailChimpSubscriptionController

##
# Inject
##
MailChimpSubscriptionController.$inject = [
    '$log'
    '$resource'
    '$rootScope'
    '$sce'
]
