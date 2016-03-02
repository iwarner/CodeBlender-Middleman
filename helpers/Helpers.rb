##
# Helpers
#
# @author Ian Warner <ian.warner@drykiss.com>
##

##
# Module Helpers
##
module Helpers

    ##
    # Proxy partial method
    ##
    def codeBlender( name, type, locals = false, path = "partial/_codeBlender" )

        # Folder
        folder = ( type.include? "/" ) ? "#{ name }" : "#{ name }/#{ name }"

        # Partial return
        partial "#{ path }/#{ type }/#{ folder }.haml", locals: locals

    end

    ##
    # Whether to translate a string of text from the Current Page Data
    ##
    def string( element )

        element.is_a?( Symbol ) ? t( element ) : element

    end

    ##
    # Call Link
    # Strip the spaces from the number
    ##
    def callLink( number )
        link_to number, "tel:#{ number }"
    end

    ##
    # IMDB Film Lookup
    ##
    def imdb( film, year = nil )

        url  = "http://www.omdbapi.com"
        json = JSON.parse( open( url + "?t=" + URI.encode( film ) ) { | x | x.read } )

    end

end