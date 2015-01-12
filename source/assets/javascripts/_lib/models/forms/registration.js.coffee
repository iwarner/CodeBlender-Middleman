##
# Registration Model
#
# @author Ian Warner <ian.warner@drykiss.com>
# @see    http://thedersen.com/projects/backbone-validation/
##
class App.Models.Registration extends Backbone.Model

    # Initialize with negative/empty defaults
    defaults :

        registerName         : ""
        registerAddress1     : ""
        registerAddress2     : ""
        registerCity         : ""
        registerCounty       : ""
        registerCountry      : ""
        registerEmail        : ""
        registerPassword     : ""
        registerPasswordConf : ""
        registerEmail        : ""
        registerPassword     : ""

    # Validation
    validation :

        # Name
        registerName :
            msg      : "Full Name is required"
            required : true

        # Address 1
        registerAddress1 :
            msg      : "Address 1 is required"
            required : true

        # Address 2
        registerAddress2 :
            msg      : "Address 2 is required"
            required : true

        # City
        registerCity :
            msg      : "City is required"
            required : true

        # County
        registerCounty :
            msg      : "County is required"
            required : true

        # Country
        registerCountry :
            msg      : "Country is required"
            required : true

        # Email
        registerEmail :
            msg      : "Username is required"
            pattern  : "email"
            required : true

        # Password
        registerPassword :
            minLength : 8
            msg       : "Password is required"
            required  : true

        # Password Conf
        registerPasswordConf :
            equalTo   : "registerPassword"
            minLength : 8
            msg       : "Password Conf is required"
            required  : true