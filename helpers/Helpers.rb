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

  # def current_path_for_locale(loc = I18n.locale, is_link = true)
  # return 'javascript: void(0);' if is_link && I18n.locale == loc

  # url_regex = /\A\/(?:(#{I18n.available_locales.join('|')})\/)?/
  # current_page.url.gsub(url_regex, '').blank? ?
  # home_for_locale(loc) :
  # current_page.url.gsub(url_regex, root_for_locale(loc))
  # end

  # def path_for_locale(path, loc = I18n.locale)
  # root_for_locale(loc) + path
  # end

  # def home_for_locale(loc = I18n.locale)
  # root_for_locale(loc)
  # end

  # def root_for_locale(loc = I18n.locale)
  # loc == :ja ? '/' : "/#{loc}/"
  # end

  # # Localized link_to
  # def locale_link_to( *args, &block )

  #     url_arg_index = block_given? ? 0 : 1
  #     options_index = block_given? ? 1 : 2

  #     args[ options_index ] ||= {}
  #     options = args[options_index].dup
  #     args[ url_arg_index ] = locale_url_for( args[ url_arg_index ], options )
  #     link_to( *args, &block )
  # end

  # # Localized url_for
  # def locale_url_for(url, options={})
  # locale = options[:locale] || I18n.locale
  # options[:relative] = false
  # url_parts = url.split("#")
  # url_parts[0] = extensions[:i18n].localized_path(url_parts[0], locale) ||
  #      url_parts[0]
  # url = url_parts.join("#")
  # url = url_for(url, options)
  # # Replace leading locale url segment with domain
  # url.sub("/#{locale}/", full_url("/", locale))
  # end

  ##
  # Locale aware links
  # @see https://github.com/middleman/middleman/issues/1490
  ##
  def localePath( path, options = {} )

    lang = options[ :lang ] || I18n.locale

    # If current locale is the root remove the locale
    # If path is an external link i.e. http or https
    if extensions[ :i18n ].options[ :mount_at_root ] == lang || path.start_with?( 'http', '//' )
        path
    else
      "/#{ locale }#{ path }"
    end

  end

  ##
  # Allows for local bools to be interpreted
  #
  # @usage
  # - falsey( 'image' )
  ##
  def falsey( param )

    ! param.nil? && ! param

  end

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
  #
  # @todo Need to delve deeper into the config of the data file at the moment one deep
  ##
  def configuration( id, file = "config" )

    # Variable
    cp = current_page.data

    # Front matter meta
    m = cp.stub ? "meta.#{ cp.stub }" : cp

    # Need a fall back for meta to use the Global settings meta.author for instance

    # Data file lookup or default
    # Need to specify the named file or will assume config
    localData = I18n.exists?( :"#{ m }.#{ id }" ) ? :"#{ m }.#{ id }" : data[ file ][ id ] ? data[ file ][ id ] : :"meta.#{ id }"

    # Front locale finds in the front matter or in the locale file (requires a stub)
    frontMatter = cp[ id ] ? m[ id ] : localData

    # Finds the ID based on the content_for output helper
    contentFor = content_for?( :"#{ id }" ) ? yield_content( :"#{ id }" ) : frontMatter

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

  # def tweet_link_to(text, params = {})
  # uri = Addressable::URI.parse("https://twitter.com/intent/tweet")
  # uri.query_values = params
  # link_to text, uri, target: "_blank"
  # end

  # def page_title
  # [data.page.title, "APPEND and JOIN"].compact.join(' | ')
  # end

  # def page_description
  # data.page.description || "APPEND if not available"
  # end

  # def step(id, opts={}, &block)
  # content_tag :div, id: id, class: :step, data: opts do
  # capture(&block) if block_given?
  # end
  # end

end
