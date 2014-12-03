##
# fileImagePreviewPopover
#
# @author Pratomchai P
##
class App.Views.PasswordStrengthMeter extends Backbone.View

    ##
    # Events
    ##
    events :
        "keyup .password-strength" : "handleKeys"

    ##
    # Backbone Initialize
    ##
    initialize : ->

        # Instantiate Password Strength Meter
        @strengthMeter = new App.Classes.PasswordStrengthMeter()

    ##
    # Handle Keys
    ##
    handleKeys : ( event ) ->

        $el             = $( event.currentTarget )
        $fieldContainer = $el.closest( 'div' )
        passwordStr     = $el.val()

        @strengthMeter.updateMeter( $fieldContainer, passwordStr )