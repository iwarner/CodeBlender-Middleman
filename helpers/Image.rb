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

    ##
    # In-line SVG
    #
    # @usage
    # = inlineSVG "drykiss-sq-color.svg"
    #
    # @see https://robots.thoughtbot.com/organized-workflow-for-svg
    # @see https://gist.github.com/bitmanic/0047ef8d7eaec0bf31bb
    ##
    def inlineSVG( filename, options = {} )

        root      = Middleman::Application.root
        file_path = "#{ root }/source/assets/svg/#{ filename }"

        if File.exists?( file_path )

            file = File.read( file_path ).force_encoding "UTF-8"

            # doc  = Nokogiri::HTML::DocumentFragment.parse file
            # svg  = doc.at_css "svg"

            # if options[ :class ].present?
            #     svg[ "class" ] = options[ :class ]
            # end

            file

        else
            "file not found: #{ file_path }"
        end

    end

    ## 
    # Image URL
    ##
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

    ##
    # Holder Image
    #
    # @usage
    # holderImage( size, text, theme )
    #
    # Themes
    # gray, industrial and social
    # Fluid
    # 100%x75
    #
    # <img data-src="holder.js/200x300/social/text:hello world">
    #
    # @param size  String
    # @param text  String
    # @param theme String
    #
    # @see http://imsky.github.io/holder/
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