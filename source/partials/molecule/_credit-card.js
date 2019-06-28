##
# Card
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.Views.Card extends Backbone.View

    ##
    # Initialize
    ##
    initialize : ->

        $( ".form-container" ).card

            container   : $ ".card-wrapper"
            width       : 350
            formatting  : true