##
# Image
#
# @author Ian Warner <ian.warner@drykiss.com>
##

##
# Image Helpers
##
module Image

    ##
    # Lorem Pixel
    # http://lorempixel.com/400/200/sports/1/Dummy-Text/
    #
    # @see   http://lorempixel.com/
    # @param size  String
    # @param text  String
    # @param theme String
    ##
    def loremPixel( size = "200/200", text = false, theme = "nature" )

        img = "http://lorempixel.com/"

        img << size + '/'
        img << theme + '/'
        img << text if text

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