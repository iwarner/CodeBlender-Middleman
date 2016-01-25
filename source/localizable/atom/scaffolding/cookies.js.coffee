##
# Cookies
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.Classes.Cookies

    ##
    # Read Cookie
    ##
    readCookie : ( name ) ->

        nameEQ = name + "="
        ca     = document.cookie.split( ";" )
        i      = 0

        while i < ca.length
            c = ca[i]
            c = c.substring( 1, c.length ) while c.charAt( 0 ) is " "
            return c.substring( nameEQ.length, c.length ) if c.indexOf( nameEQ ) is 0
            i++

        null

    ##
    # Erase Cookie
    ##
    eraseCookie : ( name, domain ) ->

        # set to epoch in the past for deletion
        document.cookie = name + "=;path=/" + ( ( if ( domain ) then ";domain=" + domain else "" ) ) + ";expires=Thu, 01 Jan 1970 00:00:01 GMT"
        return

    ##
    # Create Cookie
    ##
    createCookie : ( name, value, days ) ->

        expires = undefined

        if days
            date = new Date()
            date.setTime date.getTime() + ( days * 24 * 60 * 60 * 1000 )
            expires = "; expires=" + date.toGMTString()
        else
            expires = ""

        document.cookie = name + "=" + value + expires + "; path=/"

        return