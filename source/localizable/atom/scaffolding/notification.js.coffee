##
# Notification Class
# Visual, audible, and tactile device notifications.
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.PhoneGap.Notification

    ##
    # Alert
    # Shows a custom alert or dialog box.
    #
    # @param message       String Dialog message.
    # @param alertCallback Object Callback to invoke when alert dialog is dismissed.
    # @param title         String Dialog title. (Optional, defaults to Alert)
    # @param buttonName    String Button name.  (Optional, defaults to OK)
    ##
    alert : ( message = "Alert Message", callback = @alertHide, title = "Alert", buttonName = "OK" ) ->

        navigator.notification.alert( message, callback, title, buttonName )

    ##
    # Alert Hide
    ##
    alertHide : ->

        # Debug
        # log.info "Alert Hide"

    ##
    # Confirm
    # Displays a customizable confirmation dialog box.
    #
    # @param message         String Dialog message.
    # @param confirmCallback Object Callback to invoke with index of button pressed (1, 2, or 3) or when the dialog is dismissed without a button press (0).
    # @param title           String Dialog title. (Optional, defaults to Alert)
    # @param buttonName      String Button name.  (Optional, defaults to OK)
    ##
    confirm : ( message = "Confirm Message", callback = @confirmOn, title = "Confirm", buttonName = ['Save', 'Cancel'] ) ->

        navigator.notification.confirm( message, callback, title, buttonName )

    ##
    # Confirm
    ##
    confirmOn : ( index ) ->

        # Debug
        # log.info index
        # alert index

    ##
    # Prompt
    # Shows a customizable prompt dialog box.
    #
    # @param message        String Dialog message.
    # @param promptCallback Object Callback to invoke when a button is pressed.
    # @param title          String Dialog title (Optional, defaults to Prompt)
    # @param buttonLabels   Array Array of strings specifying button labels (Optional, defaults to ["OK","Cancel"])
    # @param defaultText    String Default textbox input value (Optional, Default: empty string)
    ##
    prompt : ( message = "Prompt Message", callback = @promptOn, title = "Confirm", buttonLabels = ['Save', 'Cancel'], defaultText = "email" ) ->

        navigator.notification.prompt( message, callback, title, buttonLabels, defaultText )

    ##
    # Prompt On
    ##
    promptOn : ( results ) ->

        # alert "You selected button number " + results.buttonIndex + " and entered " + results.input1

    ##
    # Beep
    # The device plays a beep sound.
    #
    # @param times Int The number of times to repeat the beep.
    ##
    beep : ( times = "2" ) ->

        navigator.notification.beep( times )

    ##
    # Vibrate
    # Vibrates the device for the specified amount of time.
    #
    # iOS - Ignores the specified time and vibrates for a pre-set amount of time.
    #
    # @param time Int Milliseconds to vibrate the device, where 1000 milliseconds equals 1 second.
    ##
    vibrate : ( time = "1000" ) ->

        navigator.notification.vibrate( time )