##
# Language Defaults
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.Utils.Language

    ##
    # Get the Language attributes
    ##
    constructor : ->

        el = $ "body"

        # Attribute from Body Tag
        window.lang   = el.data "lang"
        window.locale = el.data "locale"

        # Debug
        # log.info  "Language :" + window.lang, "Locale :" + window.locale

# Instantiate Utility
new App.Utils.Language