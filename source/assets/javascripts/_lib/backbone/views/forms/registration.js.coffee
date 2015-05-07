##
# Registration
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.Views.Registration extends Backbone.View

    ##
    # Events
    ##
    events :
        "submit .registerForm" : "formSubmit"

    ##
    # Initialize
    ##
    initialize : ->

        # Bind validation for Contact Form
        Backbone.Validation.bind this

        # Listen for session logged_in state changes and re-render
        # App.session.on "change:logged_in", @render()

    ##
    # Form Submit
    ##
    formSubmit : ( event ) ->

        # Prevent default
        event.preventDefault() if event

        # Serialize and save model
        data = $( ".registerForm" ).serializeObject()
        @model.set data

        # Run the validation and submit
        if @model.isValid( true )

            Login
            App.session.login

                # Set
                username : @model.attributes.loginEmail
                password : @model.attributes.loginPassword
            ,
                # Success
                success: ( mod, res ) ->

                    log.info "SUCCESS", mod, res
                    return

                # Error
                error: ( err ) ->

                    log.info "ERROR", err
                    return

    ##
    # Validate
    ##
    validate : ->

        # Bind Backbone Validation
        Backbone.Validation.bind this,

            # Valid
            valid : ( view, attr, selector ) ->
                validation.valid view, attr, selector

            # Invalid
            invalid : ( view, attr, error, selector ) ->
                validation.invalid view, attr, error, selector

    ##
    # Render
    ##
    render : ->

        # Validate
        @validate()