##
# Notification
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.Views.Notification extends Backbone.View

    ##
    # el
    ##
    el : ".container"

    ##
    # Events
    ##
    events : {
        'click .touchNotification' : "touchNotification"
    }

    ##
    # Touch Notification
    ##
    touchNotification : ( e ) ->

        # Prevent Default
        e.stopPropagation()
        e.preventDefault()

        # Instantiate Notification Class
        notification = new App.Classes.Notification

        # Create Notification
        notification.create "Hello",
            body : "Body of the Notification"
            tag  : "CodeBlender"
            icon : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWYGX6PCYhae1Sm6rhkA_UB9lLCTczhtx4mDa6ghPcEHIOwCHL2A"

        # Debug
        # log.info "Notification Class :", notification