##
# Image
#
# @author   Ian Warner <ian.warner@drykiss.com>
# @category helper
##

##
# Image Helpers
##
module Image

    def imageURL( source )
        protocol + host_with_port + image_path( source )
    end

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

end