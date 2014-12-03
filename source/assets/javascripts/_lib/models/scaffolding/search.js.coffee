##
# Search Model
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.Models.Search extends Backbone.Model

    # Validation
    validation :

        search :
            required : true
            msg      : "Search query is required"