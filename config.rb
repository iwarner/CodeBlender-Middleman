##
# Middleman Configuration File
#
# @author Ian Warner <ian.warner@drykiss.com>
# @see    http://middlemanapp.com/
##

##
# Better errors
##
require "better_errors"

# Require football scripts
require "football/football"
require "football/matrix"
require "football/setting"
require "football/table"
require "football/fixture"

# Load football helpers
helpers FootballHelpers

# Autoprefixer
# activate :autoprefixer, browsers: [
#   "last 2 versions"
# ]

# Syntax
# @see https://github.com/middleman/middleman-syntax
# :line_numbers => true
activate :syntax

# Levenshtein distance function:
# activate :similar # , :algorithm => :levenshtein by default.

# Variables
config[ :layout ]          = "sidebarLeft"
config[ :publishCalendar ] = true
config[ :haml ]            = { ugly: true, format: :html5 }

# Assets
config[ :css_dir ]    = "assets/stylesheets"
config[ :js_dir ]     = "assets/javascripts"
config[ :images_dir ] = "assets/images"

# Markdown engine and options
# auto_ids, footnote_nr, entity_output, toc_levels, smart_quotes, kramdown_default_lang, input, hard_wrap
# @see http://kramdown.gettalong.org/options.html
set :markdown_engine, :kramdown
set :markdown, toc_levels: "1,2"

# Time Zone
Time.zone = "Europe/London"

mount   = :en
locales = [ :en ]

# I18n
# @see https://middlemanapp.com/advanced/localization/
# @see http://www.rubydoc.info/github/svenfuchs/i18n/I18n
activate :i18n do | i |
    i.locales       = locales
    i.mount_at_root = mount
end

##
# External pipeline - Webpack
# ENV[ 'WEBPACK_ENV' ] ||= ( build? ? 'build' : 'development' )
##
activate :external_pipeline do | i |
    i.name                         = :webpack
    i.command                      = build? ? './node_modules/webpack/bin/webpack.js --bail -p' : './node_modules/webpack/bin/webpack.js --watch'
    i.source                       = ".tmp"
    i.latency                      = 1
    i.disable_background_execution = false
end

# Blog
# Template files cannot be within a folder path with a _ i.e. _codeBlender/template
# @see https://elenichappen.svbtle.com/getting-tags-to-work-with-middlemans-blog-gem
activate :blog do | blog |

    blog.name              = "docs"
    blog.prefix            = "docs"
    blog.default_extension = ".md"

    blog.permalink         = "{category}/{title}.html"
    blog.sources           = ":title.html"

    blog.layout            = "articleThree"
    blog.summary_separator = /(READMORE)/
    blog.summary_length    = 250

    blog.calendar_template = "template/blog-calendar/blog-calendar.html"
    blog.year_link         = "/calendar/:year.html"
    blog.month_link        = "/calendar/:year/:month.html"
    blog.day_link          = "/calendar/:year/:month/:day.html"

    blog.tag_template      = "template/blog-tag/blog-tag.html"
    blog.taglink           = "/tag/:tag.html"

    blog.paginate          = true
    blog.per_page          = 5
    blog.page_link         = "page/{num}"

    # Custom collections
    blog.custom_collections = {

        # Category
        category: {
            link:     '/category/{category}.html',
            template: 'template/blog-tag/blog-tag.html'
        },

        # Author
        author: {
            link:     '/author/{author}.html',
            template: 'template/blog-tag/blog-tag.html'
        }

    }

end

# Blog : Portfolio
# @see https://elenichappen.svbtle.com/getting-tags-to-work-with-middlemans-blog-gem
activate :blog do | blog |

    blog.name              = "portfolio"
    blog.prefix            = "portfolio"
    blog.default_extension = ".haml"

    blog.permalink         = "{title}.html"
    blog.sources           = ":title.html"

    blog.layout            = "portfolio"
    blog.summary_separator = /(READMORE)/
    blog.summary_length    = 250

    blog.calendar_template = "template/blog-calendar/blog-calendar.html"
    blog.year_link         = "/calendar/:year.html"
    blog.month_link        = "/calendar/:year/:month.html"
    blog.day_link          = "/calendar/:year/:month/:day.html"

    blog.tag_template      = "template/blog-tag/blog-tag.html"
    blog.taglink           = "/tag/:tag.html"

    blog.paginate          = true
    blog.per_page          = 5
    blog.page_link         = "page/{num}"

    # Custom collections
    blog.custom_collections = {

        # Category
        category: {
            link:     '/category/{category}.html',
            template: 'template/blog-tag/blog-tag.html'
        },

        # Author
        author: {
            link:     '/author/{author}.html',
            template: 'template/blog-tag/blog-tag.html'
        }

    }

end

# Middleman Deploy
# @see https://github.com/middleman-contrib/middleman-deploy
activate :deploy do | deploy |
    deploy.deploy_method  = :git
    deploy.remote         = 'git@github.com:DryKISS/codeblender.net.git'
    deploy.build_before   = false
end

# Build-specific configuration
configure :build do

    # # "Ignore" JS so webpack has full control.
    # ignore { |path| path =~ /\/(.*)\.js$/ && $1 != 'site' }

    # # "Ignore" JS and CSS so webpack has full control.
    # ignore { |path| path =~ /\/(.*)\.js|css$/ && $1 != "all" && $1 != "vendor" }

    # Asset hash
    activate :asset_hash, :exts => %w(.js .css)

    # GZIP Files
    # @see https://middlemanapp.com/advanced/file_size_optimization/
    # activate :gzip

    # Use relative URLs
    # activate :relative_assets

    # For example, change the Compass output style for deployment
    # activate :minify_css, inline: true

    # Minimise JavaScript on build
    # @see https://github.com/crtvhd/middleboy
    # activate :minify_javascript
    # activate :minify_javascript, inline: true, compressor: Uglifier.new( mangle: false, comments: :none )

    # Minimise HTML
    # https://github.com/middleman/middleman-minify-html
    activate :minify_html do | html |
        html.remove_quotes = false
    end

    # Favicon
    # @see https://github.com/follmann/middleman-favicon-maker
    activate :favicon_maker do | f |

        # Template
        f.template_dir = File.join( root, 'source/assets/images/favicon' )
        f.output_dir   = File.join( root, 'build/assets/images/favicon' )

        # Icon
        f.icons = {

            # High resolution icon
            "favicon_template_hires.png" => [
                { icon: "favicon-152x152.png" },
                { icon: "favicon-120x120.png" },
                { icon: "favicon-76x76.png"   },
                { icon: "favicon-60x60.png"   },
                { icon: "favicon-32x32.png"   },
                { icon: "favicon-16x16.png"   },
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
# ( 1...12 ).each do | value |
#     proxy "/season/#{ value }.html", "localizable/football/fixture/fixture_template.html", locals: { season: value }, ignore: true
# end

# Create the table pages
# Loop through the defined divisions
# ( 1...3 ).each do | row |
#     proxy "/division/#{ row }.html", "template/football/table_template.html", locals: { season: 11, division: row }, ignore: true
# end

# Team pages
# CSV.foreach( "csv/teams.csv", headers: true ) do | row |

#     # Team slug
#     team = row[ 2 ].strip.downcase.gsub( /[^a-z0-9\- ]/, ' ' ).gsub( / /, '-' )

#     # Proxy team pages
#     proxy "/team/#{ team }.html", "template/football/team.html", locals: { team: row }, ignore: true

#     # Create a team iCal
#     # Get the team Fixtures for the current season

#     # Premier League site code

#     # BEGIN:VCALENDAR
#     # VERSION:2.0
#     # PRODID:jquery.icalendar
#     # METHOD:PUBLISH
#     # BEGIN:VEVENT
#     # UID:803414@premierleague.com
#     # DTSTAMP:20160209T232226Z
#     # TITLE:Sunderland v Manchester United
#     # DTSTART:20160213T124500Z
#     # DTEND:20160213T144500Z
#     # SUMMARY:Sunderland v Manchester United
#     # DESCRIPTION:Barclays Premier League
#     # END:VEVENT
#     # END:VCALENDAR

#     # Create a calendar with an event ( standard method )
#     cal = Icalendar::Calendar.new

#     # Timezone set up
#     cal.timezone do | t |

#         t.tzid = "Asia/Tokyo"

#         t.standard do | s |
#             s.tzoffsetfrom = "+0900"
#             s.tzoffsetto   = "+0900"
#             s.tzname       = "JST"
#             s.dtstart      = "19701101T020000"
#         end

#     end

#     # Loop through the fixtures and create the events
#     cal.event do | e |
#         e.dtstart  = DateTime.new( 2014, 9, 2, 19, 10, 0 )
#         e.dtend    = DateTime.new( 2014, 9, 2, 20, 10, 0 )
#         e.summary  = "$v['team_a'] $v['score_a']  v $v['score_b'] $v['team_b']"
#         e.location = "$v['ground']"
#         e.geo      = "37.386013,122.082932"
#     end

#     cal.append_custom_property( "X-WR-CALNAME", "#{ team }" )
#     cal.append_custom_property( "X-WR-CALDESC", "#{ team }" )
#     cal.append_custom_property( "X-WR-TIMEZONE", "Asia/Tokyo" )

#     # Proxy Team Pages
#     proxy "/calendar/#{ team }.ics", "template/football/calendar.html", locals: { data: cal.to_ical }, ignore: true

# end
