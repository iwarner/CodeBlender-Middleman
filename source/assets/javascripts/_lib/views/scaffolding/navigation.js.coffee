##
# Navigation
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.Views.Navigation extends Backbone.View

    ##
    # Initialize
    ##
    initialize : ->

        # Elements
        el = $ "#navbar"

        # Affix Offset
        el.affix offset :
            top : 100