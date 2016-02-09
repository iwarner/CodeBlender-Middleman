##
# Middleman configuration file
#
# @author Ian Warner <ian.warner@drykiss.com>
# @see    https://hellojason.net/blog/remove-unused-css-from-middleman-before-deploying/
#
# @todo Want to remove the data variables and set back to the data.example in the code
# @todo Set the syntax highlighter for kramdown
##

# Require
require "uglifier"
require "csv"

# Require football scripts
require "football/football"
require "football/matrix"
require "football/setting"
require "football/table"
require "football/fixture"

# Load football helpers
helpers FootballHelpers

# Data variables
set :dataConfig,    data.config
set :dataApple,     data.apple
set :dataGoogle,    data.google
set :dataMailChimp, data.mailChimp
set :dataNav,       data.navigation
set :dataSubNav,    data.subnavigation
set :version,       dataConfig.version

# Variables
set :relative_links,   true
# set :strip_index_file, false
set :syntaxScheme,     "ThankfulEyes"
set :path,             "assets"
set :css_dir,          "#{ path }/stylesheets"
set :js_dir,           "#{ path }/javascripts"
set :images_dir,       "#{ path }/images"
set :index_file,       "index.html"
set :fonts_dir,        "#{ path }/font"
set :haml,             { ugly: true, format: :html5 }
set :build_dir,        "www"
set :layout,           "_lib/sidebarLeft"
set :debug_assets,     true

# Syntax Highlighting
activate :syntax

# Time Zone
Time.zone = "Europe/London"

##
# Markdown engine and options
# auto_ids, footnote_nr, entity_output, toc_levels, smart_quotes, kramdown_default_lang, input, hard_wrap
# @see http://kramdown.gettalong.org/options.html
##
set :markdown_engine, :kramdown
set :markdown, toc_levels: "2", auto_id_prefix: "#"

##
# I18n
# @see http://www.rubydoc.info/github/svenfuchs/i18n/I18n
##
activate :i18n do | options |
    options.langs         = [ :en ]
    options.mount_at_root = :en
end

# Live reload
activate :livereload

# Global Layout Selection
page "atom.xml",     layout: false
page "channel.html", layout: false
page "config.xml",   layout: false
page "feed.xml",     layout: false
page "runner.html",  layout: false
page "sitemap.xml",  layout: false

# Remove 404 from directory indexes
page "/404.html", :directory_index => false

# Compass
compass_config do | config |
    config.output_style  = :compressed
    config.line_comments = false
end

# Sprockets
after_configuration do
    sprockets.append_path File.join( root, "bower_components" )
    sprockets.append_path File.join( root, "bower_components/bootstrap-sass-official/assets/javascripts/" )
    sprockets.append_path File.join( root, "bower_components/bootstrap-sass-official/assets/stylesheets/" )
    sprockets.append_path File.join( root, "bower_components/font-awesome/scss/" )
    sprockets.append_path File.join( root, "source/localizable/" )
    sprockets.append_path "/assets/font"
end

# BLOG
activate :blog do | blog |

    blog.name              = "portfolio"
    blog.prefix            = "docs"
    blog.default_extension = ".md"

    blog.permalink         = "{category}/{title}.html"
    blog.sources           = ":title.html"

    blog.layout            = "_library/article.layout"
    blog.summary_separator = /(READMORE)/
    blog.summary_length    = 250

    blog.calendar_template = "template/calendar.html"
    blog.year_link         = "/calendar/:year.html"
    blog.month_link        = "/calendar/:year/:month.html"
    blog.day_link          = "/calendar/:year/:month/:day.html"

    blog.tag_template      = "template/tag.html"
    blog.taglink           = "/tag/:tag.html"

    blog.paginate          = true
    blog.per_page          = 5
    blog.page_link         = "page/{num}"

end

# Middleman Deploy
activate :deploy do | deploy |
    deploy.method       = :git
    deploy.remote       = 'git@github.com:DryKISS/codeblender.net.git'
    deploy.build_before = false
end

# Create GZIP Content
helpers do

    def gzip_css_on_build( key, media = "screen" )
        o = stylesheet_link_tag( key, { :media => media } )
        o.sub!( ".css", ".css.gz" ) if build?
        o
    end

    def gzip_js_on_build( key )
        o = javascript_include_tag( key )
        o.sub!( ".js", ".js.gz" ) if build?
        o
    end

end

# Directory Indexes
# activate :directory_indexes

# Build-specific configuration
configure :build do

    # Use relative URLs
    activate :relative_assets

    # GZIP Files
    # activate :gzip

    # For example, change the Compass output style for deployment
    activate :minify_css, inline: true

    # Minimise JavaScript on build
    # @see https://github.com/crtvhd/middleboy
    activate :minify_javascript, inline: true, compressor: Uglifier.new( mangle: false, comments: :none )

    # Minimise HTML
    # https://github.com/middleman/middleman-minify-html
    activate :minify_html

    # Auto-generate multiple favicon versions
    activate :favicon_maker do | icon |

        # Templates
        icon.template_dir = File.join( root, 'source/assets/images/favicon/_template' )
        icon.output_dir   = File.join( root, 'www/assets/images/favicon' )

        # Icon
        icon.icons = {

            # High resolution icon
            "favicon_template_hires.png" => [
                { icon: "favicon-152x152.png" },
                { icon: "favicon-120x120.png" },
                { icon: "favicon-76x76.png"   },
                { icon: "favicon-60x60.png"   },
            ],

            # Low resolution icon
            "favicon_template_lores.png" => [
                { icon: "favicon-32x32.png" },
                { icon: "favicon-16x16.png" },
                { icon: "favicon.ico", size: "64x64,32x32,24x24,16x16" }
            ]
        }

    end

end


##
# Football proxy pages
##

# Fixtures pages
# Loop through the available season
( 1...12 ).each do | value |
    proxy "/season/#{ value }.html", "localizable/football/fixture/fixture_template.html", locals: { season: value }, ignore: true
end

# Create the table pages
# Loop through the defined divisions
( 1...3 ).each do | row |
    proxy "/division/#{ row }.html", "template/football/table_template.html", locals: { season: 11, division: row }, ignore: true
end

# Team pages
CSV.foreach( "csv/teams.csv", headers: true ) do | row |

    # Team slug
    team = row[ 2 ].strip.downcase.gsub( /[^a-z0-9\- ]/, ' ' ).gsub( / /, '-' )

    # Proxy team pages
    proxy "/team/#{ team }.html", "template/football/team.html", locals: { team: row }, ignore: true

    # Create a team iCal
    # Get the team Fixtures for the current season

    # Create a calendar with an event ( standard method )
    cal = Icalendar::Calendar.new

    # Timezone set up
    cal.timezone do | t |

        t.tzid = "Asia/Tokyo"

        t.standard do | s |
            s.tzoffsetfrom = "+0900"
            s.tzoffsetto   = "+0900"
            s.tzname       = "JST"
            s.dtstart      = "19701101T020000"
        end

    end

    # Loop through the fixtures and create the events
    cal.event do | e |
        e.dtstart  = DateTime.new( 2014, 9, 2, 19, 10, 0 )
        e.dtend    = DateTime.new( 2014, 9, 2, 20, 10, 0 )
        e.summary  = "$v['team_a'] $v['score_a']  v $v['score_b'] $v['team_b']"
        e.location = "$v['ground']"
        e.geo      = "37.386013,122.082932"
    end

    cal.append_custom_property( "X-WR-CALNAME", "#{team}" )
    cal.append_custom_property( "X-WR-CALDESC", "#{team}" )
    cal.append_custom_property( "X-WR-TIMEZONE", "Asia/Tokyo" )

    # Proxy Team Pages
    proxy "/calendar/#{ team }.ics", "template/football/calendar.html", locals: { data: cal.to_ical }, ignore: true

end