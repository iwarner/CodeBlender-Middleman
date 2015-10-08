##
# Facebook JS SDK Inclusion
# Includes the SDK and provides the correct methods to check user status.
#
# Core Methods
# .init() Used to initialize and setup the SDK. All other SDK methods must be
#         called after this one.
# .api()  Make an API call to the Graph API.
# .ui()   Used to trigger different forms of Facebook created UI dialogs, such
#         as the Feed dialog, or the Requests dialog.
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.Utils.Facebook

    ##
    # Constructor
    ##
    constructor : ->

        # Load the Facebook SDK Asynchronously
        $.getScript "//connect.facebook.net/" + window.locale + "/all.js", ( data, textStatus, jqxhr ) ->

            # Debug
            # log.info data, textStatus, jqxhr

            # Initialise Facebook
            FB.init

                appId      : "<%= dataFacebook.app.id %>"
                channelUrl : "<%= data.config.url %>channel.html"
                status     : true
                cookie     : true
                xfbml      : true

# Instantiate Utility
new App.Utils.Facebook