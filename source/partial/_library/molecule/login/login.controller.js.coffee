##
# Login Controller
#
# @category molecule
# @author   Ian Warner <ian.warner@drykiss.com>
# @see      http://l-lin.github.io/angular-datatables/#/welcome
##

##
# JS Lint
##
'use strict'

##
# Login
##
LoginController = ->

    @name = "HELLO"

##
# Module
##
angular
    .module     'app.controller'
    .controller 'LoginController', LoginController

# ##
# # Firebase Controller
# ##
# .controller 'LoginCtrl', [

#     '$scope'
#     '$log'
#     '$firebaseAuth'
#     '$firebaseArray'
#     'FBURL'

#     ( $scope, $log, $firebaseAuth, $firebaseArray, FBURL ) ->

#         $scope.save = ->
#             $scope.$emit 'show-errors-check-validity'

#             if $scope.loginForm.$valid
#               $log.info 'User saved'
#               $scope.reset()
#             return

#         $scope.reset = ->
#             $scope.$emit 'show-errors-reset'
#             $scope.user =
#                 email    : ''
#                 password : ''
#             return
# ]

# .config [

#     '$urlRouterProvider'

#     ( $urlRouterProvider ) ->

#         # require user to be authenticated before they can access this page
#         # this is handled by the .whenAuthenticated method declared in
#         # components/router/router.js
#         # $urlRouterProvider.whenAuthenticated '/account',
#         #     templateUrl : 'account/account.html'
#         #     controller  : 'AccountCtrl'
#         # return

# ]


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


# ##
# # Login
# #
# # @author Ian Warner <ian.warner@drykiss.com>
# # @see    http://maxoffsky.com/code-blog/login-to-laravel-web-application-from-phonegap-or-backbone/
# # @see    https://www.youtube.com/watch?v=xa-FRWDxJrI
# ##
# class App.Views.Login extends Backbone.View

#     ##
#     # Events
#     ##
#     events :
#         "submit .loginForm" : "formSubmit"

#     ##
#     # Initialize
#     ##
#     initialize : ->

#         # Bind validation for Contact Form
#         Backbone.Validation.bind this

#         # Listen for session logged_in state changes and re-render
#         App.session.on "change:logged_in", @render()

#     ##
#     # Form Submit
#     ##
#     formSubmit : ( event ) ->

#         # Prevent default
#         event.preventDefault() if event

#         # Serialize and save model
#         data = $( ".loginForm" ).serializeObject()
#         @model.set data

#         # Run the validation and submit
#         if @model.isValid( true )

#             # Login
#             App.session.login

#                 # Set
#                 username : @model.attributes.loginEmail
#                 password : @model.attributes.loginPassword
#             ,
#                 # Success
#                 success: ( mod, res ) ->

#                     log.info "SUCCESS", mod, res
#                     return

#                 # Error
#                 error: ( err ) ->

#                     log.info "ERROR", err
#                     # App.showAlert "Bummer dude!", err.error, "alert-danger"
#                     return

#     ##
#     # Validate
#     ##
#     validate : ->

#         # Bind Backbone Validation
#         Backbone.Validation.bind this,

#             # Valid
#             valid : ( view, attr, selector ) ->
#                 validation.valid view, attr, selector

#             # Invalid
#             invalid : ( view, attr, error, selector ) ->
#                 validation.invalid view, attr, error, selector

#     ##
#     # Render
#     ##
#     render : ->

#         # Validate
#         @validate()

# ##
# # Forms Input View
# #
# # @author Ian Warner <ian.warner@drykiss.com>
# ##
# class App.Views.FormsInput extends Backbone.View

#     ##
#     # Events
#     ##
#     events :
#         "submit .formInput" : "formSubmit"

#     ##
#     # Initialize
#     ##
#     initialize : ->

#         # Bind validation for Contact Form
#         Backbone.Validation.bind this

#         # Instantiate Password Strength
#         new App.Classes.PasswordStrengthMeter()

#     ##
#     # Form Submit
#     ##
#     formSubmit : ( event ) ->

#         # Prevent default
#         event.preventDefault()

#         # Serialize and save model
#         data = $( ".formInput" ).serializeObject()
#         this.model.set data

#         # Run the validation and submit
#         event.currentTarget.submit() if @model.isValid( true )

#     ##
#     # Render
#     ##
#     render : ->

#         # Bind Backbone Validation
#         Backbone.Validation.bind this,

#             # Valid
#             valid : ( view, attr, selector ) ->

#                 $el    = view.$ "[ name=" + attr + " ]"
#                 $group = $el.closest ".form-group"
#                 $group.removeClass "has-error"
#                 $group.find( ".help-block" ).html( "" ).addClass( "hidden" )

#                 # Debug
#                 # log.info "View : ", view, "Attr : ", attr, "Selector : ", selector

#             # Invalid
#             invalid : ( view, attr, error, selector ) ->

#                 $el    = view.$ "[ name=" + attr + " ]"
#                 $group = $el.closest ".form-group"
#                 $group.addClass "has-error"
#                 $group.find( ".help-block" ).html( error ).removeClass( "hidden" )

#                 # Debug
#                 # log.info "View : ", view, "Attr : ", attr, "error", error, "Selector : ", selector

#     ##
#     # Thank You
#     ##
#     thankYou : ->

#         # Empty
#         $( ".contactForm" ).remove()
#         $( ".contactFormPanel" ).append( "Thank you for contacting Green Touch, we will respond very soon, via phone or email." )

# ##
# # Forms Model
# #
# # @author Ian Warner <ian.warner@drykiss.com>
# # @see    http://thedersen.com/projects/backbone-validation/
# ##
# class App.Models.Login extends Backbone.Model

#     # Validation
#     validation :

#         # Email
#         loginEmail :
#             msg      : "Username is required"
#             pattern  : "email"
#             required : true

#         # Password
#         loginPassword :
#             minLength : 8
#             msg       : "Password is required"
#             required  : true

#         # Remember Me
#         loginRemember :
#             required : false

#         #     password :
#         #         required  : true
#         #         minlength : 8
#         #         pwcheck   : true
#         #     remember :
#         #         required : false

#         # # Custom Messages
#         # messages :
#         #     username :
#         #         required : "Username is required."
#         #     password :
#         #         required : "Password is required."
#         #         pwcheck  : "Password does not pass the requirements"

#         # # Password Check
#         # # at least one lower-case character
#         # # at least one digit
#         # # Allowed Characters: A-Z a-z 0-9 @ * _ - . !
#         # $.validator.addMethod "pwcheck", ( value ) ->
#         #     /^[A-Za-z0-9\d=!\-@._*]*$/.test( value ) and /[a-z]/.test( value ) and /\d/.test( value )
