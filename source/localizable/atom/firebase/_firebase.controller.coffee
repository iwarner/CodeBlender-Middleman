##
# Firebase Controller
#
# @author Ian Warner <ian.warner@drykiss.com>
##

##
# JS Lint
##
'use strict'

##
# Firebase Controller
##
FirebaseController = ( $log, $firebaseAuth, $firebaseArray, FBURL ) ->

    $log.info "Firebase Controller"

    # Instantiate
    fireBase = new Firebase FBURL

    #
    messages = $firebaseArray( fireBase )

    # add a new record to the list
    messages.$add
        user : "physicsmarie",
        text : "Hello world"

    # $scope.messages = $firebaseArray fireBase

    # Auth
    # $log.info auth = $firebaseAuth fireBase

    # # Create User
    # fireBase.createUser {
    #     email    : 'ianwarner@drykiss.com'
    #     password : 'test123'
    # }, ( error, userData ) ->

    #     if error
    #         $log.info 'Error creating user:', error
    #     else
    #         $log.info 'Successfully created user account with uid:', userData.uid
    #     return

    ##
    # Log User In
    # Can set optional remember variable
    #
    # @see https://www.firebase.com/docs/web/guide/login/password.html
    ##
    # fireBase.authWithPassword {

    #     email    : 'ianwarner1@drykiss.com'
    #     password : 'test123'

    # }, ( error, authData ) ->

    #     if error
    #         $log.info 'Login Failed!', error
    #     else
    #         $log.info 'Authenticated successfully with payload:', authData
    #     return

    # , remember: 'sessionOnly'

    ##
    # Change Email
    ##
    # fireBase.changeEmail {

    #     oldEmail : 'ianwarner@drykiss.com'
    #     newEmail : 'ianwarner1@drykiss.com'
    #     password : 'test123'

    # }, ( error ) ->

    #     if error == null
    #         $log.info 'Email changed successfully'
    #     else
    #         $log.info 'Error changing email:', error
    #     return

##
# Module
##
angular
    .module     'app.controller'
    .controller 'FirebaseController', FirebaseController

##
# Inject
##
FirebaseController.$inject = [
    '$log'
    '$firebaseAuth'
    '$firebaseArray'
    'FBURL'
]