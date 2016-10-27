##
# Seo check - Description
# Meta descriptions can be any length, but search engines generally truncate
# snippets longer than 160 characters. It is best to keep meta descriptions
# between 150 and 160 characters.
#
# @usage
# <meta name="description" content="This is an example of a meta description.">
#
# Keep between 150 and 160 characters long
# Be unique within the site
# Double quote will cut off the description - replace with single quotes
#
# Google announced in September of 2009 that neither meta descriptions nor meta
# keywords factor into Google's ranking algorithms for web search.
#
# @author Ian Warner <ian.warner@drykiss.com>
# @see    https://moz.com/learn/seo/meta-description
##
module Middleman

    ##
    # Extension namespace
    ##
    class Description

        ##
        # Initialize
        ##
        def self.analyse()

            puts "HERE"

            # puts "Meta description: #{not meta_description.empty?}

            # (#{meta_description.count})" The meta description is under 120
            # characters, however up to 156 characters are available. The
            # available space is shorter than the usual 155 characters because
            # Google will also include the publication date in the snippet.

            # The meta description contains the primary keyword / phrase.

        end

        ##
        # Initialize
        ##
        def initialize()

            puts "HERE"

        end

    end

end
