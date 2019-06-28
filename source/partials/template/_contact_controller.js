##
# Contact
# Create the Google Map on the contact page
#
# @author   Ian Warner <ian.warner@drykiss.com>
# @category template
##

# JS lint
'use strict'

##
# Contact
##
ContactController = ( $http, $log, $scope ) ->

    # Debug
    # $log.info "Contact - controller"

    # This
    vm = this

    # Variable
    vm.sent = false

    # Map options
    vm.map =
        center :
            latitude  : 51.419778051
            longitude : -0.20196300
        zoom : 16

    # Marker options
    vm.marker =
        id     : 1
        coords :
            latitude  : 51.419778051
            longitude : -0.20196300
        options :
            animation : "BOUNCE"

    # Get URL params for Treatment and change Select Menu.
    result = new RegExp( '[\\?&]t=([^&#]*)' ).exec( window.location.href )

    if result

        # Set treatment select
        $scope.formSpree = []
        $scope.formSpree.treatment = decodeURIComponent( result[ 1 ].split( '+' ).join( ' ' ))

    ##
    # Submit form
    ##
    vm.submitForm = ( contact, event ) ->

        # Debug
        # $log.info "Contact - submit form - fields:", contact
        # $log.info "Contact - submit form - Date :", contact.date
        # $log.info "Contact - submit form - Time :", contact.time

        # Post form
        $http
            url  : 'https://formspree.io/info@greentouchpi.com'
            # url  : 'https://formspree.io/ian.warner@drykiss.com'
            data : $.param(
                Name      : contact.name
                Email     : contact.email
                Mobile    : contact.mobile
                Treatment : contact.treatment
                Date      : contact.date.toLocaleDateString()
                Time      : contact.time.toLocaleTimeString()
                Message   : contact.message
                _subject  : "Greentouch Contact"
            )
            method  : 'POST'
            headers :
                'Accept'       : 'application/json'
                'Content-Type' : 'application/x-www-form-urlencoded'

        vm.sent = true

        return false

    return

##
# Module
##
angular
    .module     'app.controller'
    .controller 'ContactController', ContactController

##
# Inject
##
ContactController.$inject = [
    '$http'
    '$log'
    '$scope'
]
