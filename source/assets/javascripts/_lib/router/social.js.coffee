##
# Social Router
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.Routers.Social extends Backbone.Router

    ##
    # Routes
    ##
    routes :

        "embed" : "mailchimp"

    ##
    # Mailchimp
    ##
    mailchimp : ->

        # Instantiate
        new App.Views.Mailchimp