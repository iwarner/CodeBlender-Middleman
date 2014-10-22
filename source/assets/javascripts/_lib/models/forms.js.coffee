##
# Forms Model
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.Models.Forms extends Backbone.Model

    # Validation
    validation :

        username :
            required : true
            msg      : "Username is required"