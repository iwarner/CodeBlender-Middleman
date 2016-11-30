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
        option :verbose, false,     "Print debug messages"
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
                document = Nokogiri::HTML( File.open( buildPath + resource.destination_path ) )

                # Analyse document
                Middleman::Document.analyse( document )

                # Analyse title
                # Middleman::Title.analyse( document )

                # Analyse description

                # Analyse keyword

                # Analyse language

                # Analyse uniqueness

                # Analyse heading

                # Analyse open graph

                # puts "Page URL: Yes (1)"

                # puts "Content: #{not content.empty?} (#{content.count})"


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
