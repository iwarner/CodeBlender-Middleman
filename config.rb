##
# Middleman Configuration File
#
# @author Ian Warner <ian.warner@drykiss.com>
# @see    http://middlemanapp.com/
##

# Ignore Folders from Build - For Mobile
mobile = false

# Require
require "builder"

# Version
set :version, "0.1.6"

# Syntax Highlighting
activate :syntax, line_numbers: true

# Markdown Engine
set :markdown_engine, :kramdown
set :markdown, :layout_engine => :md,
               :tables        => true,
               :autolink      => true,
               :smartypants   => true

# Layout Selection
set :layout, "site/layout"

# Global Layout Selection
page "config.xml",  :layout => false
page "runner.html", :layout => false

# If I want to build the mobile prototype
if mobile

    ignore "scaffolding/*"
    ignore "scaffolding.html"
    ignore "index1.html"
    ignore "bootstrap/*"
    ignore "bootstrap.html"
    ignore "assets/font/*"
    ignore "assets/font/*"
    ignore "assets/images/footer/*"
    ignore "assets/images/prototype01/*"
    ignore "assets/images/site/*"
    ignore "assets/images/thumbnails/*"
    ignore "assets/images/spritemap.png"
    ignore "assets/images/spritemap@2x.png"
    ignore "blog.html"
    ignore "blog/*"
    ignore "docs/*"
    ignore "google/*"
    ignore "google.html"
    ignore "search.html"
    ignore "social/*"
    ignore "social.html"

end

# Remove 404 from directory indexes
page "/404.html", :directory_index => false

# i18n
I18n.default_locale = :en
Time.zone           = "Europe/London"
activate :i18n, :langs => [:en], :mount_at_root => :en

# Live reload
activate :livereload

# Variables
set :path,         "assets"
set :css_dir,      "#{path}/stylesheets"
set :js_dir,       "#{path}/javascripts"
set :images_dir,   "#{path}/images"
set :partials_dir, "partial/_site"

set :haml, { :ugly => true, :format => :html5 }

# Build Directory WWW for Mobile Builds
set :build_dir, 'www'

# Compass
compass_config do |config|
    config.output_style  = :compressed
    config.line_comments = false
end

# Sprockets
sprockets.append_path File.join "#{root}", "bower_components"
sprockets.append_path File.join "#{root}", "bower_components/bootstrap-sass-official/vendor/assets/javascripts/bootstrap/"
sprockets.append_path File.join "#{root}", "bower_components/bootstrap-sass-official/vendor/assets/stylesheets/bootstrap/"
sprockets.append_path File.join "#{root}", "bower_components/font-awesome/scss/"

### BLOG
Time.zone = "Europe/London"

activate :blog do | blog |

    blog.prefix            = "docs"
    blog.default_extension = ".md"

    blog.permalink         = ":title.html"
    blog.sources           = ":title.html"

    blog.layout            = "blog/article"
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

# Directory Index
activate :directory_indexes

# Build-specific configuration
configure :build do

    # For example, change the Compass output style for deployment
    activate :minify_css

    # Minify JavaScript on build
    activate :minify_javascript

    # Minify HTML
    activate :minify_html

end