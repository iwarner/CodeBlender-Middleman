##
# Seo check - Heading
#
# @usage
# H1..H6
#
# @author Ian Warner <ian.warner@drykiss.com>
# @see    https://yoast.com/headings-use/
##
module Middleman

    ##
    # Extension namespace
    ##
    class Heading

        ##
        # Initialize
        ##
        def self.analyse()

            puts "HERE"

            # Search for keyword in heading
            post.css( 'h1' ).each do | this |

                if options.verbose
                    puts "heading found"
                    puts "heading: #{ this }"
                end

                heading = this.to_s.scan(/#{ options.keyword }/i)

                if options.verbose
                    puts "heading-found: #{ heading }"
                end

            end

            # Output
            puts "Article Heading: #{ not heading.empty? } (#{ heading.count })"

            # You have not used your keyword / keyphrase in any subheading (such as an H2) in your copy.

        end

        ##
        # Initialize
        ##
        def initialize()

            puts "HERE"

        end

    end

end
