##
# Touch ID
# Activate the alert bow to allow a user to login via TouchID
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.PhoneGap.TouchID

    ##
    # Current Acceleration
    ##
    create : ( route ) ->

        # Create the TouchID Element
        monaca.touchid.auth (->

            # Route to Home
            Backbone.history.navigate route,
                trigger : true

            return

        ), ( ( errorMessage ) ->

            alert "Login Failed!"
            return

        ), "Message"