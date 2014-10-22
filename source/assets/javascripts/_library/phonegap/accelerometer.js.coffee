##
# Accelerometer Class
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.PhoneGap.Accelerometer

    ##
    # Current Acceleration
    ##
    current : ->

    ##
    # Watch Acceleration
    ##
    watch : ->

    ##
    # Clear Watch
    ##
    clear : ->

    ##
    # Success
    ##
    success : ( acceleration ) ->

    ##
    # Error
    ##
    error : ( error ) ->

        # Debug
        log.info 'Error code: ' + error.code + '\n' + 'Error message: ' + error.message + '\n'