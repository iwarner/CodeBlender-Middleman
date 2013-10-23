##
# Google Font Loader Controller
##
class App.Utils.GoogleFontLoader

    ##
    # Constructor
    ##
    constructor : ->

        window.WebFontConfig =
            google:
                families: [ 'Droid+Sans::latin', 'Droid+Serif::latin' ]

        # Create script tag matching protocol
        s       = document.createElement 'script'
        s.src   = "#{if document.location.protocol is 'https:' then 'https' else 'http'}://ajax.googleapis.com/ajax/libs/webfont/1/webfont.js"
        s.type  = 'text/javascript'
        s.async = 'true'

        # Insert it before the first script tag
        s0 = (document.getElementsByTagName 'script')[0]
        s0.parentNode.insertBefore s, s0