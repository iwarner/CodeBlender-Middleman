##
# Notification Abstraction
#
# Options
# dir  : The direction of the notification; it can be auto, ltr, or rtl
# lang : Specifiy the lang used within the notification. This string must be a valid BCP 47 language tag.
# body : A string representing an extra content to display within the notification
# tag  : An ID for a given notification that allows to retrieve, replace or remove it if necessary
# icon : The URL of an image to be used as an icon by the notification
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.Classes.Notification

    # Options
    options =
        icon              : ''
        body              : ''
        tag               : ''
        notifyShow        : null
        notifyClose       : null
        notifyClick       : null
        notifyError       : null
        permissionGranted : null
        permissionDenied  : null

    ##
    # Create
    ##
    create : ( title, option ) ->

        # Debug
        # log.info "Create Notification | Title:", title, "| Options: " + option
        # log.info permission = window.Notification.permission

        # Let's check if the browser supports Notification
        unless "Notification" of window

            # Debug
            # log.warn "Notification Support Not Found"

        # If permission has been granted process Notification
        else if window.Notification.permission is "granted"

            # Create Notification
            new window.Notification title, option

        # Check Permission
        else if window.Notification.permission isnt "granted"

            # Request Permission
            window.Notification.requestPermission ( status ) ->

                # Whatever the user answers, we make sure Chrome stores the information
                window.Notification.permission = permission unless "permission" of window.Notification

                # If the user is okay, let's create a notification
                new window.Notification title, option if permission is "granted"

    ##
    # Show Notify
    ##
    showNotify : ->

        log.info "Notification Sent"