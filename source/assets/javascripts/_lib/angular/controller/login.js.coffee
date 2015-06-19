##
# Login Controller
#
# @author Ian Warner <ian.warner@drykiss.com>
##

##
# JS Lint
##
'use strict'

# Module
angular.module 'app.controllers'

##
# Firebase Controller
#
# @todo Make this more Angular : http://l-lin.github.io/angular-datatables/#/welcome
##
.controller 'LoginCtrl', [

    '$scope'
    '$log'
    '$firebaseAuth'
    '$firebaseArray'
    'FBURL'

    ( $scope, $log, $firebaseAuth, $firebaseArray, FBURL ) ->

        $scope.save = ->
            $scope.$broadcast 'show-errors-check-validity'

            if $scope.loginForm.$valid
              $log.info 'User saved'
              $scope.reset()
            return

        $scope.reset = ->
            $scope.$broadcast 'show-errors-reset'
            $scope.user =
                email    : ''
                password : ''
            return
]

.config [

    '$urlRouterProvider'

    ( $urlRouterProvider ) ->

        console.log "HERE"

        # require user to be authenticated before they can access this page
        # this is handled by the .whenAuthenticated method declared in
        # components/router/router.js
        $urlRouterProvider.whenAuthenticated '/account',
            templateUrl : 'account/account.html'
            controller  : 'AccountCtrl'
        return
]


# .controller 'LoginCtrl', [
#   '$scope'
#   'Auth'
#   '$location'
#   'fbutil'
#   ($scope, Auth, $location, fbutil) ->

#     errMessage = (err) ->
#       if angular.isObject(err) and err.code then err.code else err + ''

#     firstPartOfEmail = (email) ->
#       ucfirst email.substr(0, email.indexOf('@')) or ''

#     ucfirst = (str) ->
#       # inspired by: http://kevin.vanzonneveld.net
#       str += ''
#       f = str.charAt(0).toUpperCase()
#       f + str.substr(1)

#     $scope.email = null
#     $scope.pass = null
#     $scope.confirm = null
#     $scope.createMode = false

#     $scope.login = (email, pass) ->
#       $scope.err = null
#       Auth.$authWithPassword({
#         email: email
#         password: pass
#       }, rememberMe: true).then (->
#         $location.path '/account'
#         return
#       ), (err) ->
#         $scope.err = errMessage(err)
#         return
#       return

#     $scope.createAccount = ->
#       $scope.err = null
#       if assertValidAccountProps()
#         email = $scope.email
#         pass = $scope.pass
#         # create user credentials in Firebase auth system
#         Auth.$createUser(
#           email: email
#           password: pass).then(->
#           # authenticate so we have permission to write to Firebase
#           Auth.$authWithPassword
#             email: email
#             password: pass
#         ).then((user) ->
#           # create a user profile in our data store
#           ref = fbutil.ref('users', user.uid)
#           fbutil.handler (cb) ->
#             ref.set {
#               email: email
#               name: name or firstPartOfEmail(email)
#             }, cb
#             return
#         ).then (->
#           # redirect to the account page
#           $location.path '/account'
#           return
#         ), (err) ->
#           $scope.err = errMessage(err)
#           return
#       return

#     return
# ]