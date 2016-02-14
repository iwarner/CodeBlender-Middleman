##
# Holder Image Helper
#
# Usage
# holderImage( size, text, theme )
#
# Themes
# gray, industrial and social
#
# Fluid
# 100%x75
#
# <img data-src="holder.js/200x300/social/text:hello world">
#
# @author Ian Warner <ian.warner@drykiss.com>
# @see    http://imsky.github.io/holder/
#
# @todo   Need to also have the option of just returning a string
##
module Holder

    ##
    # Holder Image
    #
    # @param size  String
    # @param text  String
    # @param theme String
    ##
    def holderImage( size = "200x200", text = false, theme = "social" )

        img = 'holder.js/'

        img << size + '/'
        img << theme + '/'
        img << 'text:' + text if text

        return img

    end

    ##
    # Holder Image
    #
    # @param size  String
    # @param text  String
    # @param theme String
    ##
    def holder( size = "200x200", auto = "auto", text = false, theme = "social", colors )

        img = 'holder.js/'

        img << size + '/'
        img << auto + '/'
        img << colors + '/'

        if theme
            img << theme + '/'
        end

        if text
            img << 'text:' + text if text
        end

        return img

    end

end