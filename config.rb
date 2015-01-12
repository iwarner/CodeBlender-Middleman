##
# Middleman Configuration File
#
# @author Ian Warner <ian.warner@drykiss.com>
##

# Variables
set :version,          data.config.version
set :relative_links,   true
set :strip_index_file, false
set :syntaxScheme,     "ThankfulEyes"
set :path,             "assets"
set :css_dir,          "#{ path }/stylesheets"
set :js_dir,           "#{ path }/javascripts"
set :images_dir,       "#{ path }/images"
set :fonts_dir,        "#{ path }/font"
set :partials_dir,     "partial/_library"
set :haml,             { :ugly => true, :format => :html5 }
set :build_dir,        "www"
set :layout,           "_lib/site/sidebar-left"

# Markdown Engine
set :markdown_engine, :kramdown
set :markdown, :layout_engine => :haml,
               :tables        => true,
               :autolink      => true,
               :smartypants   => true

# Syntax Highlighting
activate :syntax, :line_numbers => true, :wrap => true

# i18n
I18n.enforce_available_locales = true
I18n.default_locale            = :en
Time.zone                      = "Europe/London"
activate :i18n, :langs => [ :en ], :mount_at_root => :en

# Live reload
activate :livereload

# Global Layout Selection
page "atom.xml",     :layout => false
page "channel.html", :layout => false
page "config.xml",   :layout => false
page "feed.xml",     :layout => false
page "runner.html",  :layout => false
page "sitemap.xml",  :layout => false

# Remove 404 from directory indexes
page "/404.html", :directory_index => false

# Compass
compass_config do | config |
    config.output_style  = :compressed
    config.line_comments = false
end

# Sprockets
after_configuration do
    sprockets.append_path File.join "#{ root }", "bower_components"
    sprockets.append_path File.join "#{ root }", "bower_components/bootstrap-sass-official/assets/javascripts/bootstrap"
    sprockets.append_path File.join "#{ root }", "bower_components/bootstrap-sass-official/assets/stylesheets/"
    sprockets.append_path File.join "#{ root }", "bower_components/font-awesome/scss/"
    sprockets.append_path "/assets/font"
end

# BLOG
activate :blog do | blog |

    blog.prefix            = "docs"
    blog.default_extension = ".md"

    blog.permalink         = "{category}{title}.html"

    # blog.permalink         = ":title.html"
    blog.sources           = ":title.html"

    blog.layout            = "_library/blog/article"
    blog.summary_separator = /(READMORE)/
    blog.summary_length    = 250

    blog.calendar_template = "/blog/calendar/template.html"
    blog.year_link         = "/blog/calendar/:year.html"
    blog.month_link        = "/blog/calendar/:year/:month.html"
    blog.day_link          = "/blog/calendar/:year/:month/:day.html"

    blog.tag_template      = "/blog/tag/template.html"
    blog.taglink           = "/blog/tag/:tag.html"

    blog.paginate          = true
    blog.per_page          = 10
    blog.page_link         = "page/:num"

end

# # Middleman Deploy
# activate :deploy do | deploy |

# end

# # Create GZIP Content
# helpers do

#     def gzip_css_on_build( key, media = "screen" )
#         o = stylesheet_link_tag( key, { :media => media } )
#         o.sub!( ".css", ".css.gz" ) if build?
#         o
#     end

#     def gzip_js_on_build( key )
#         o = javascript_include_tag( key )
#         o.sub!( ".js", ".js.gz" ) if build?
#         o
#     end

# end

# Build-specific configuration
configure :build do

    # Use relative URLs
    activate :relative_assets

    # GZIP Files
    # activate :gzip

    # For example, change the Compass output style for deployment
    # activate :minify_css

    # Minify Javascript on build
    # activate :minify_javascript

    # Minify HTML
    # activate :minify_html

    # Favicon
    # activate :favicon_maker, :icons => {
    #     "favicon_template.png" => [
    #         { icon: "favicon.png", size: "32x32" },
    #         { icon: "favicon.ico", size: "64x64,32x32,24x24,16x16" },
    #     ]
    # }

end

# # VCard Creation
# if data.scaffolding.vcards

#     data.scaffolding.vcards.each do | vCard |

#         vcard           = VCardigan.create( :version => '3.0' )
#         vcard.name      "#{ vCard.name.l }", "#{ vCard.name.f }"
#         vcard.title     "#{ vCard.title }"
#         vcard.org       "IBM"
#         vcard.fullname  "#{ vCard.name.f } #{ vCard.name.l }"
#         vcard.email     "#{ vCard.email.ibm }", :type => 'work', :preferred => 1
#         vcard.tel       "#{ vCard.tel }", :type => 'mobile', :preferred => 1
#         vcard.impp      "#{ vCard.skype }", :"X-SERVICE-TYPE" => "Skype", :type => "home", :preferred => 1
#         vcard.add('X-Skype', "#{ vCard.skype }")

#         # @todo Output a file
#         # puts vcard

#     end

# end

# # Create Product Pages
# if data.products

#     # Loop through the products
#     data.products.each do | product |

#         # Create the Pages if status is active
#         if product.status == "active"

#             # Page Name
#             page = product.title.downcase.gsub( /[^a-z0-9\- ]/, ' ').gsub( / /, '-' )

#             # Debug
#             # p product
#             # p page

#             # Proxy Pages
#             proxy "/shop/#{ page }/index.html", "templates/product.html", :locals => { :product => product }, :ignore => true

#         end

#     end

# end