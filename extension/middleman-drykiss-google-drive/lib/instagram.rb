##
# Instagram API request to get the embed code
#
# @usage
# ruby -r "./instagram.rb" -e "Instagram.new"
#
# @author   Ian Warner <ian.warner@drykiss.com>
# @category extension
# @see       https://www.instagram.com/developer/embedding/
#
# @todo place in a connection time out
# @todo place in error detection on the call and log
##

# Require
require "open-uri"
require "json"
require "net/https"
require "uri"

##
# Convenience wrapper for Instagram
##
class Instagram

    ##
    # Constructor. Loads all parameters from environment variables.
    ##
    def initialize

        # Constants
        @url = "https://api.instagram.com/oembed/?url="

    end

    ##
    # Embed code
    # https://api.instagram.com/oembed/?url=http://instagr.am/p/BKpgoM9g5S2/
    ##
    def embedCode( code )

        # Connect to api
        uri = URI.parse( "#{ @url }http://instagr.am/p/#{ code }/&omitscript=true&maxwidth=750" )

        http             = Net::HTTP.new( uri.host, uri.port )
        http.use_ssl     = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        request          = Net::HTTP::Get.new( uri.request_uri )
        response         = http.request( request )

        if response.code == "200"

            result = JSON.parse( response.body )

            # Change the max width
            result[ "html" ].gsub! "max-width:658px;", "max-width:70%;"
            result[ "html" ].gsub! "margin: 1px;", "margin: 0 auto 20px;"

            # result[ "html" ]

        else
            puts "ERROR!!!"
        end

    end

end
