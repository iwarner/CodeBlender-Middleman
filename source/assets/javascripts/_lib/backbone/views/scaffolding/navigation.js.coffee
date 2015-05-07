##
# Navigation
#
# @author Ian Warner <ian.warner@drykiss.com>
#
# @todo   Should calculate the height of what is above the Navbar
# @todo   Calculate the margins dynamically
##
class App.Views.Navigation extends Backbone.View

    ##
    # Initialize
    ##
    render : ->

        # Elements
        el = $ "#navbar"

        # Affix Offset
        el.affix offset :
            top : 71

        # Affix event
        el.on "affix.bs.affix", ( data ) ->
            $( ".navAbove" ).css "margin-top", "71px"

        # Affix Top event
        el.on "affix-top.bs.affix", ( data ) ->
            $( ".navAbove" ).css "margin-top", "20px"