##
# Language
##
class App.Utils.Language

    ##
    # Get the Language identifier for the site
    ##
    constructor : ->

        # Get the Lang data attribute from Body
        @language = $("body").data "lang"
        @locale   = $("body").data "locale"