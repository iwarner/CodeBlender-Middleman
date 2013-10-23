##
# URL Parameters
##
class App.Utils.UrlParams

    ##
    # Constructor
    ##
    checkMap : ( map ) ->

        # Loop through the Map Hash
        for k, v of map

            if value = @getParams( k )
                @formFill( value, v )

    ##
    # Get the Parameters
    ##
    getParams : ( param ) ->

        result = new RegExp( '[\\?&]' + param + '=([^&#]*)' ).exec( window.location.href )

        if result
            return result[ 1 ]

    ##
    # Get the Hash Parameter
    ##
    getUrlHash : ->

        return location.hash.replace "#", ""

    ##
    # Prefill the form with the value
    ##
    formFill : ( value, param ) ->

        $( '*[name="' + param + '"]' ).val( value )