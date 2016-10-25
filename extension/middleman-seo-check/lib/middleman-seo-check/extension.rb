##
# Seo check
#
# @author Ian Warner <ian.warner@drykiss.com>
##

# Require
require 'middleman-core'
require "nokogiri"

##
#  Middleman
##
module Middleman

    ##
    # Seo check
    ##
    class SeoCheck < ::Middleman::Extension

        # Options
        option :verbose, false,      "Print debug messages"
        option :keyword, "Running", "SEO keyword"

        ##
        # Initialize
        ##
        def initialize( app, options_hash={}, &block )

            # Call super to build options from the options_hash
            super

        end

        ##
        # Middleman after build hook
        # Process the look up of pages and check SEO elements - alert on issues
        ##
        def after_build( builder )

            # Variables
            heading          = []
            title            = []
            url              = []
            content          = []
            meta_description = []
            temp             = []

            # Build path
            buildPath = app.config[ :build_dir ] + File::SEPARATOR

            # Extensions
            extensions = [ "html", "htm" ]

            # Loop through the resources to get the extensions
            @resources.select{ | r | extensions.include?( r.ext.split( '.' ).last ) }.each do | resource |

                # Verbose
                if options.verbose
                    puts "Analyzing Post: #{ resource }..."
                end

                # Open up file and analyse through NokiGiri
                post = Nokogiri::HTML( File.open( buildPath + resource.destination_path ) )

                # Analyse title
                Middleman::Title.analyse()

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

                puts ""
                puts "Article Heading: #{ not heading.empty? } (#{ heading.count })"
                # puts "Page title: #{not title.empty?} (#{title.count})"
                # # puts "Page URL: Yes (1)"
                # puts "Content: #{not content.empty?} (#{content.count})"
                # puts "Meta description: #{not meta_description.empty?} (#{meta_description.count})"

            end

        end

        ##
        # A site map Manipulator
        ##
        def manipulate_resource_list( resources )

            # Make resources available for after build
            @resources = resources
        end

    end

end

##
# You have not used your keyword / keyphrase in any subheading (such as an H2) in your copy.
# No images appear in this page, consider adding some as appropriate.
# The meta description is under 120 characters, however up to 156 characters are available. The available space is shorter than the usual 155 characters because Google will also include the publication date in the snippet.
# The page title contains keyword / phrase, but it does not appear at the beginning; try and move it to the beginning.
# The keyword / phrase does not appear in the URL for this page. If you decide to rename the URL be sure to check the old URL 301 redirects to the new one!
# The copy scores 68.9 in the Flesch Reading Ease test, which is considered OK to read.
# This page has 14 outbound link(s).
# The keyword density is 1.74%, which is great, the keyword was found 15 times.
# The meta description contains the primary keyword / phrase.
# There are 890 words contained in the body copy, this is greater than the 300 word recommended minimum.
# The page title is more than 40 characters and less than the recommended 70 character limit.
# The keyword appears in the first paragraph of the copy.
##
