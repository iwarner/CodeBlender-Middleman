##
# Forms Model
#
# @author Ian Warner <ian.warner@drykiss.com>
# @see    http://thedersen.com/projects/backbone-validation/
##
class App.Models.Login extends Backbone.Model

    # Validation
    validation :

        # Email
        loginEmail :
            msg      : "Username is required"
            pattern  : "email"
            required : true

        # Password
        loginPassword :
            minLength : 8
            msg       : "Password is required"
            required  : true

        # Remember Me
        loginRemember :
            required : false

        #     password :
        #         required  : true
        #         minlength : 8
        #         pwcheck   : true
        #     remember :
        #         required : false

        # # Custom Messages
        # messages :
        #     username :
        #         required : "Username is required."
        #     password :
        #         required : "Password is required."
        #         pwcheck  : "Password does not pass the requirements"

        # # Password Check
        # # at least one lower-case character
        # # at least one digit
        # # Allowed Characters: A-Z a-z 0-9 @ * _ - . !
        # $.validator.addMethod "pwcheck", ( value ) ->
        #     /^[A-Za-z0-9\d=!\-@._*]*$/.test( value ) and /[a-z]/.test( value ) and /\d/.test( value )