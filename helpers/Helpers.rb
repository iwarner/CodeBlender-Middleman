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
    # Whether to translate a string of text from the Current Page Data
    ##
    def string( element )
        element.is_a?( Symbol ) ? t( element ) : element
    end

    ##
    # Mail To Link
    ##
    def mailTo( email )
        result = Haml::Engine.new( "%a{ :href => \"mailto:#{email}\" }\n " + email )
        result.render
    end

    ##
    # Call Link
    ##
    def callLink( number )
        result = Haml::Engine.new( "%a{ :href => \"tel:#{number}\" }\n " + number )
        result.render
    end

    ##
    # IMDB Film Lookup
    ##
    def imdb( film, year = nil )

        url  = "http://www.omdbapi.com"
        json = JSON.parse( open( url + "?t=" + URI.encode( film ) ) { | x | x.read } )

    end

end