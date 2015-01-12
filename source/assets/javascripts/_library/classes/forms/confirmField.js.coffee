##
# Input File - Confirm Field
#
# Core Methods
# .constructor() Used to initialize and setup the confirm fields
#
# @author Pratomchai P
##
class App.Classes.ConfirmField

    ##
    # initialise
    ##
    constructor : ->

        @bindConfirmFields()
        return

    ##
    # Bind the confirm field - shows tick if field values match
    ##
    bindConfirmFields : =>

        $( document ).on( "keyup", ".confirm-field", function ( e ) {
            this.checkConfirmField( $( this ) )

        false;

    ##
    # Check the confirmation fields
    # @param string conf_field confirm field
    ##
    checkConfirmField : ( $conf_field ) ->

        $field_container = $conf_field.closest( 'div' );

        if ( $conf_field.val() == $( $conf_field.attr( 'data-confirmWith' ) ).val() && $conf_field.val() != '' ) {
            $field_container.find( '.icon-ok-sign' ).show();
        } else {
            $field_container.find( '.icon-ok-sign' ).hide();
        }