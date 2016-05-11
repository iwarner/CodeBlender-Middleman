##
# Blog Helpers
#
# @author   Ian Warner <ian.warner@drykiss.com>
# @category helper
##

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

end