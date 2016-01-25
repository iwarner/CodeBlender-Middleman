##
# URL Parameters
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.Classes.UrlParams

    ##
    # Check Map
    ##
    checkMap : ( map ) ->

        # Loop through the Map Hash
        for k, v of map

            if value = @getParams( k )
                @formFill( value, v )

    ##
    # Get the Parameter
    #
    # Usage
    # url = new App.Classes.UrlParams
    # log.info url.getParam "t"
    #
    # @param param String Element to search for in the URL
    ##
    getParam : ( param ) ->

        result = new RegExp( '[\\?&]' + param + '=([^&#]*)' ).exec( window.location.href )

        if result
            return result[ 1 ]

        # getQueryParam : function(name, queryStr){
        #         name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
        #         var regexS = "[\\?&]" + name + "=([^&#]*)";
        #         var regex = new RegExp(regexS);
        #         var results = regex.exec(queryStr || window.location.search);
        #         if(results === null)
        #             return "";
        #         else
        #            return decodeURIComponent(results[1].replace(/\+/g, " "));
        #     },

    ##
    # Get the Hash Parameter
    ##
    getUrlHash : ->

        return location.hash.replace "#", ""

    ##
    # Prefill the form with the value
    #
    # Usage
    # url = new App.Classes.UrlParams
    # log.info url.formFill "green+touch+thai+massage", "t"
    #
    # @param value String Value of the form field
    # @param name  String Name of the form element
    ##
    formFill : ( value, name ) ->

        $( '[name="' + name + '"]' ).val( value )

    ##
    # Get's the app's absolute URL
    # @return base url
    ##
    getBaseURL : ->

        # Get base URL
        href = window.location.href;
        port = window.location.port;
        endPos = 0;

        if href.match('www/')
            # For when app runs under file://
            endPos = href.indexOf( 'www/') + 4
        else if port != ''
            # For when app runs with a port number
            endPos = href.indexOf( ':'+port ) + port.length + 1
        else
            # For when app runs off a domain with no port number
            endPos = href.indexOf( '/', 8 )   # First "/" after protocol '://'

        baseURL = href.substring(0, endPos);

        return baseURL