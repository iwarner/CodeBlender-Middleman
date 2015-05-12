##
# Tag Cloud
#
# @usage
# -# Tag Cloud
# = tagCloud()
#
# @author Ian Warner <ian.warner@drykiss.com>
##

##
# Require
##
require "lib/tagCloud"

##
#
##
module Tags

    ##
    #
    ##
    def tagCloud( options = {} )

        [].tap do | html |

            TagCloud.new( options ).render( blog.tags ) do | tag, size, unit |
                html << link_to( tag, tag_path( tag ), style: "font-size: #{ size }#{ unit }" )
            end

        end.join(" ")

    end

end