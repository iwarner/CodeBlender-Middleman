##
# Blog Helpers
#
# Usage
# -# Tag Cloud
# = tagCloud()
#
# @author Ian Warner <ian.warner@drykiss.com>
# @todo   Move the Flikr helpers out of here
##

##
# Require
##
# require "lib/flickr"

##
#
##
module BlogHelpers

    # ##
    # #
    # ##
    # def title
    #     current_page.data.title || yield_content( :title )
    # end

    # module SiteHelpers
    #   def page_title
    #     [data.page.title, "Josh W Lewis"].compact.join(' | ')
    #   end

    #   def page_description
    #     data.page.description || "Slides by Josh W Lewis"
    #   end

    #   def step(id, opts={}, &block)
    #     content_tag :div, id: id, class: :step, data: opts do
    #       capture(&block) if block_given?
    #     end
    #   end
    # end

    # ##
    # #
    # ##
    # def date( time )
    #     Russian::strftime( time, '%d %b %Y' )
    # end

    # ##
    # #
    # ##
    # def tags( page )
    #     page.tags.map { | tag | link_to( tag, tag_path( tag ) ) }.join( ', ' )
    # end

    # ##
    # #
    # ##
    # def related( page )
    #     all_pages = blog.tags.slice( *page.tags ).values.first
    #     return [] if all_pages.blank?
    #     all_pages.delete_if { | p | p == page }
    # end

    # ##
    # #
    # ##
    # def flickr_photo( *photo_ids )
    #     Flickr::Renderer.new( Flickr::Fetcher.new.by_photo_ids( photo_ids ) ).render
    # end

    # ##
    # #
    # ##
    # def flickr_set( set_id )
    #     Flickr::Renderer.new( Flickr::Fetcher.new.by_set_id( set_id ) ).render
    # end

end