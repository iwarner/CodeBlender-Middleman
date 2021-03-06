##
# Widget
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.Views.Widget extends Backbone.View

    ##
    # EL
    ##
    el : $ ".cartWidget"

    ##
    # Events
    ##
    events :
        "click .cartInfo" : "cartPop"

    ##
    # Initialize
    ##
    initialize : ->

        # Simple Cart
        simpleCart

            # Variables
            tax      : 0.2,
            currency : "GBP"
            limit    : 20

            # Stripe Checkout
            checkout :
                type  : "Stripe"
                image : "http://placehold.it/128.gif/aabbdd/000&text=LOGO"
                key   : "pk_test_hIhsHj4nQWp0iyVcxMWQbEwI"
                name  : "DryKISS Ltd"
                url   : "http://localhost:8080/charge.php"

            # Setting the Cart Columns for the sidebar cart display.
            cartColumns : [

                # A custom cart column for putting the quantity and increment
                # and decrement items in one div for easier styling.
                { view : ( item, column ) ->
                    "<span>" + item.get( "quantity" ) + "</span>
                    <div>
                        <a href='javascript:;' class='simpleCart_increment'>
                            <img src='/assets/images/site/increment.png' title='+1' alt='arrow up'>
                        </a>
                        <a href='javascript:;' class='simpleCart_decrement'>
                            <img src='/assets/images/site/decrement.png' title='-1' alt='arrow down'>
                        </a>
                    </div>"

                attr : "custom" },

                # Name of the item
                { attr  : "name", label : false }

                # Subtotal of that row (quantity of that item * the price)
                { view : "currency", attr : "total", label : false }
            ]

            cartStyle : "div"

    ##
    # cartPop
    ##
    cartPop : ( event ) ->

        log.info "HERE"

        # Prevent default
        event.preventDefault()
        event.stopPropagation()

        # Element
        $el = $ event.currentTarget

        # Toggle opening of Widget
        $el.next().toggle()
        $el.toggleClass "open"