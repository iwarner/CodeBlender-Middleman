##
# Holder
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
##
module Holder

    ##
    #
    ##
    def holderImage( size = "200x200", text = false, theme = "social" )

        img = '<img data-src="holder.js/'

        img << size + '/'
        img << theme + '/'
        img << 'text:' + text if text
        img << '">'

        return img

    end

end