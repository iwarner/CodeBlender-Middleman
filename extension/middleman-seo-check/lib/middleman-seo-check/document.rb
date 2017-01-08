##
# Seo check - Document
# Check the document for good form
#
# @usage
#
# @author Ian Warner <ian.warner@drykiss.com>
# @see    http://www.nokogiri.org/tutorials/ensuring_well_formed_markup.html
##
module Middleman

    ##
    # Extension namespace
    ##
    class Document

        ##
        # Initialize
        ##
        def self.analyse( document )

            puts "Document class :", document

            # The document meets a strict standard of markup

            # Check the read time of the document
            # @see https://blog.medium.com/read-time-and-you-
            # bc2048ab620c#.vq11qdex0 Read time is based on the average
            # reading speed of an adult (roughly 275 WPM). We take the total
            # word count of a post and translate it into minutes. Then, we
            # add 12 seconds for each inline image. Boom, read time.

            # Check for errors.empty?
            # Strict mode { |config| config.strict }
            puts post.errors

            # NOBLANKS - Remove blank nodes
            # NOENT - Substitute entities
            # NOERROR - Suppress error reports
            # STRICT - Strict parsing; raise an error when parsing malformed documents
            # NONET - Prevent any network connections during parsing. Recommended for parsing untrusted documents.

        end

        ##
        # Initialize
        ##
        def initialize()

            puts "HERE"

        end

    end

end
