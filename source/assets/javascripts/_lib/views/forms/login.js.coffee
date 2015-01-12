##
# Login
#
# @author Ian Warner <ian.warner@drykiss.com>
# @see    http://maxoffsky.com/code-blog/login-to-laravel-web-application-from-phonegap-or-backbone/
# @see    https://www.youtube.com/watch?v=xa-FRWDxJrI
##
class App.Views.Login extends Backbone.View

    ##
    # Events
    ##
    events :
        "submit .loginForm" : "formSubmit"

    ##
    # Initialize
    ##
    initialize : ->

        # Bind validation for Contact Form
        Backbone.Validation.bind this

        # Listen for session logged_in state changes and re-render
        App.session.on "change:logged_in", @render()

    ##
    # Form Submit
    ##
    formSubmit : ( event ) ->

        # Prevent default
        event.preventDefault() if event

        # Serialize and save model
        data = $( ".loginForm" ).serializeObject()
        @model.set data

        # Run the validation and submit
        if @model.isValid( true )

            # Debug
            # log.info @model.attributes

            # Login
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
                    # App.showAlert "Bummer dude!", err.error, "alert-danger"
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

        # Debug
        log.info "Render Login Page"

        # Validate
        @validate()