##
# Forms Input View
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.Views.FormsInput extends Backbone.View

    ##
    # Events
    ##
    events :
        "submit .formInput" : "formSubmit"

    ##
    # Initialize
    ##
    initialize : ->

        # Bind validation for Contact Form
        Backbone.Validation.bind this

        # Instantiate Password Strength
        new App.Classes.PasswordStrengthMeter()

    ##
    # Form Submit
    ##
    formSubmit : ( event ) ->

        # Prevent default
        event.preventDefault()

        # Serialize and save model
        data = $( ".formInput" ).serializeObject()
        this.model.set data

        # Run the validation and submit
        event.currentTarget.submit() if @model.isValid( true )

    ##
    # Render
    ##
    render : ->

        # Bind Backbone Validation
        Backbone.Validation.bind this,

            # Valid
            valid : ( view, attr, selector ) ->

                $el    = view.$ "[ name=" + attr + " ]"
                $group = $el.closest ".form-group"
                $group.removeClass "has-error"
                $group.find( ".help-block" ).html( "" ).addClass( "hidden" )

                # Debug
                # log.info "View : ", view, "Attr : ", attr, "Selector : ", selector

            # Invalid
            invalid : ( view, attr, error, selector ) ->

                $el    = view.$ "[ name=" + attr + " ]"
                $group = $el.closest ".form-group"
                $group.addClass "has-error"
                $group.find( ".help-block" ).html( error ).removeClass( "hidden" )

                # Debug
                # log.info "View : ", view, "Attr : ", attr, "error", error, "Selector : ", selector

    ##
    # Thank You
    ##
    thankYou : ->

        # Empty
        $( ".contactForm" ).remove()
        $( ".contactFormPanel" ).append( "Thank you for contacting Green Touch, we will respond very soon, via phone or email." )