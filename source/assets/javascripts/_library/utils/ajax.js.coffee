##
# JQuery Ajax Setup
#
# @author Ian Warner <ian.warner@drykiss.com>
# @see    http://api.jquery.com/jquery.ajaxsetup/
##
class App.Utils.Ajax

    ##
    # Constructor
    ##
    constructor : ->

        # Ajax Setup
        $.ajaxSetup
            cache       : false
            crossDomain : true
            # data        : {}
            # dataType    : "json"
            # type        : "POST"
            # xhrFields   :
            #     withCredentials : true

        $.ajaxPrefilter "json script", ( options ) ->
          options.crossDomain = true
          return

# Instantiate Utility
new App.Utils.Ajax