##
# Helpers
#
# @author   Ian Warner <ian.warner@drykiss.com>
# @category helper
#
# @todo For Page Title and Description I want to add the brand on the end of the string
# @todo
##

##
# Module Helpers
##
module Helpers

    ##
    # Proxy partial method
    # Allows a shortcut for calling a CodeBlender partial from the symlinked
    # directories _partial/_codeBlender
    ##
    def codeBlender( name, type, locals = false )

        # Extra folder
        folder = ( type.include? "/" ) ? "#{ name }" : "#{ name }/#{ name }"

        # Partial return
        partial "#{ config[ :partials_dir ] }/#{ type }/#{ folder }.haml", locals: locals
    end

    ##
    # Configuration
    # Allows the user to have full control over the aspects of the site structure.
    # This is particularly useful for meta data abstraction.
    #
    # @usage
    # -# Configuration
    # = configuration( "title", "navigation" )
    #
    # A configuration constant can come from four places (highest priority first)
    # - Yield content
    # - Front matter
    # - Locale
    # - Data file
    ##
    def configuration( id, file = "config" )

        # Variable
        cp = current_page.data

        # Front matter meta
        m = cp.stub ? "meta.#{ cp.stub }" : cp

        # Data file lookup
        # Need to specify the named file or will assume config
        localData = I18n.exists?( :"#{ m }.title" ) ? :"#{ m }.title" : data[ file ][ id ]

        # Front locale finds in the front matter or in the locale file (requires a stub)
        frontMatter = cp.title ? m.title : localData

        # Finds the title based on the content_for output helper
        contentFor = content_for?( :title ) ? yield_content( :title ) : frontMatter

        string contentFor
    end

    ##
    # Whether to translate a string of text from the current page data
    # Checks to see if the input is a symbol and assumes it needs translating
    ##
    def string( text )

        # Need to make sure that the translation is activated
        if defined? t
            text = text.is_a?( Symbol ) ? t( text ) : text
        end

        text
    end

    ##
    # Call link
    # Strip the spaces from the number
    ##
    def callLink( number )
        link_to number, "tel:#{ number }"
    end

    ##
    # IMDB Film Lookup
    ##
    def imdb( film, year = nil )
        url  = "http://www.omdbapi.com"
        json = JSON.parse( open( url + "?t=" + URI.encode( film ) ) { | x | x.read } )
    end

    ##
    # Date
    # Create a nice to read date based on the input time
    ##
    # def date( time )
    #     Russian::strftime( time, '%d %b %Y' )
    # end

    #   def url_with_host(path)
    #     host_with_port + path
    #   end

    #   def host_with_port
    #     [config[:host], config[:port]].compact.join(':')
    #   end

    #   def tweet_link_to(text, params = {})
    #     uri = Addressable::URI.parse("https://twitter.com/intent/tweet")
    #     uri.query_values = params
    #     link_to text, uri, target: "_blank"
    #   end

    #   def top_tags
    #     blog('blog').tags.sort_by { |t, a| -a.count }
    #   end

    #   def top_articles
    #     blog('blog').articles.select { |a| a.data[:popular] }.sort_by { |a| a.data[:popular] }
    #   end

    #   def current_page_tags
    #     Array(current_page.data[:tags])
    #   end

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
    #
end
