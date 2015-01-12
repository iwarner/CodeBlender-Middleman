##
# Splash Screen Class
# Displays and hides the application's splash screen.
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.PhoneGap.SplashScreen

    ##
    # Show
    ##
    show : ->

        navigator.splashscreen.show()

    ##
    # Hide
    ##
    hide : ->

        navigator.splashscreen.hide()