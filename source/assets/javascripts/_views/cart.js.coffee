##
# Cart
#
# @author Ian Warner <ian.warner@drykiss.com>
# @see    https://github.com/wojodesign/simplecart-js
##
class App.Views.Cart extends Backbone.View

    ##
    # Initialize
    ##
    initialize : ->

        # Setup Simple Cart - append options
        simpleCart

            # Variables
            tax      : 0.2,
            currency : "GBP"

            # Stripe Checkout
            checkout :
                type  : "Stripe"
                image : "http://placehold.it/128.gif/aabbdd/000&text=LOGO"
                key   : "pk_test_hIhsHj4nQWp0iyVcxMWQbEwI"
                name  : "DryKISS Ltd"
                url   : "http://localhost:8080/charge.php"

            # Cart Columns
            cartColumns: [
                { attr  : "name", label : "Name" },
                { attr  : "quantity", label : "Quantity", view : "input"},
                { view  : "remove", text: "Remove", label: false},
                { attr  : "price", label: "Price"},
                { attr  : "total", label : "Subtotal", view  : "currency"}
            ]

            # Cart Style
            cartStyle : "table"