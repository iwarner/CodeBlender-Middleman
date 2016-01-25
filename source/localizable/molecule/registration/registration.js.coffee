# ##
# # Registration
# #
# # @author Ian Warner <ian.warner@drykiss.com>
# ##
# class App.Views.Registration extends Backbone.View

#     ##
#     # Events
#     ##
#     events :
#         "submit .registerForm" : "formSubmit"

#     ##
#     # Initialize
#     ##
#     initialize : ->

#         # Bind validation for Contact Form
#         Backbone.Validation.bind this

#         # Listen for session logged_in state changes and re-render
#         # App.session.on "change:logged_in", @render()

#     ##
#     # Form Submit
#     ##
#     formSubmit : ( event ) ->

#         # Prevent default
#         event.preventDefault() if event

#         # Serialize and save model
#         data = $( ".registerForm" ).serializeObject()
#         @model.set data

#         # Run the validation and submit
#         if @model.isValid( true )

#             Login
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
# # Registration Model
# #
# # @author Ian Warner <ian.warner@drykiss.com>
# # @see    http://thedersen.com/projects/backbone-validation/
# ##
# class App.Models.Registration extends Backbone.Model

#     # Initialize with negative/empty defaults
#     defaults :

#         registerName         : ""
#         registerAddress1     : ""
#         registerAddress2     : ""
#         registerCity         : ""
#         registerCounty       : ""
#         registerCountry      : ""
#         registerEmail        : ""
#         registerPassword     : ""
#         registerPasswordConf : ""
#         registerEmail        : ""
#         registerPassword     : ""

#     # Validation
#     validation :

#         # Name
#         registerName :
#             msg      : "Full Name is required"
#             required : true

#         # Address 1
#         registerAddress1 :
#             msg      : "Address 1 is required"
#             required : true

#         # Address 2
#         registerAddress2 :
#             msg      : "Address 2 is required"
#             required : true

#         # City
#         registerCity :
#             msg      : "City is required"
#             required : true

#         # County
#         registerCounty :
#             msg      : "County is required"
#             required : true

#         # Country
#         registerCountry :
#             msg      : "Country is required"
#             required : true

#         # Email
#         registerEmail :
#             msg      : "Username is required"
#             pattern  : "email"
#             required : true

#         # Password
#         registerPassword :
#             minLength : 8
#             msg       : "Password is required"
#             required  : true

#         # Password Conf
#         registerPasswordConf :
#             equalTo   : "registerPassword"
#             minLength : 8
#             msg       : "Password Conf is required"
#             required  : true