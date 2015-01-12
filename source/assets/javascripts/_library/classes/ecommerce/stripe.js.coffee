##
# Stripe
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.Classes.Stripe

    ##
    # Create
    ##
    create : ->

        # Stripe Handler
        handler = StripeCheckout.configure

            # Defaults
            key      : "pk_test_hIhsHj4nQWp0iyVcxMWQbEwI"
            currency : "GBP"

            # Token
            token : ( token, args ) ->
                log.info "Checkout Completed"
                log.info token
                log.info args