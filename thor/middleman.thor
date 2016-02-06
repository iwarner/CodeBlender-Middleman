##
# Middleman Thor file
# Provides specific tasks in the development life cycle of a middleman project
#
# @usage  $ thor list
# @author Ian Warner <ian.warner@drykiss.com>
# @see    http://whatisthor.com/
#
# @todo   Provide a way to compile a CSV into the translated yaml files
##

require 'csv'
require 'yaml'
require 'open-uri'

class Middleman < Thor

    ##
    # Variable
    ##
    @@googleLocaleKey = "1Z2VSgyUsSoGo6pqNL5ZxQT6SBjKXQEnvPha-EYeH3SQ"

    ##
    # Middleman build and deploy
    #
    # @usage $ thor middleman:deploy
    #
    # @todo  Increment the version number if deployed
    ##
    desc "deploy", "Middleman build and deploy"
    def deploy

        # Clear
        system( "clear" )

        # Load the config File
        config = YAML::load_file( "../data/config.yaml" )

        # Increment version

        # Build
        say( "\n\t Middleman build\n\t" )
        system( "bundle exec middleman build --clean" )

        # UnCSS
        say( "\n\t UnCSS\n\t" )
        system( "gulp buildCSS" )

        # Deploy
        say( "\n\t Middleman deploy\n\t" )
        system( "bundle exec middleman deploy" )

    end

    ##
    # Middleman package
    # Zips up the middleman build folder, assumes this to be www
    #
    # @usage $ thor middleman:package
    #
    # @todo  Get the project name from the config and create here
    ##
    desc "package", "Create a Zip file of the Build"
    def package

        # Load the config File
        config = YAML::load_file( "../data/config.yaml" )

        # Get the version
        version = config[ :version ]

        # Variables
        fileName = "middleman-v" + version

        # Clear
        system( "clear" )

        # Build Middleman
        say( "\n\t Middleman build and clean\n\t" )
        system( "bundle exec middleman build --clean" )

        # Zip up the build folder
        say( "\n\t Zip the build folder\n\t" )
        system( "cd www && zip -r ../#{ fileName }.zip . -x '*.DS_Store'" )

    end

    ##
    # Middleman symbolic link set up
    # Use this on secondary projects to provide the code CodeBlender helpers
    #
    # @usage $ thor middleman:symlink
    # Do not run this on the codeblender project as it will remove the folders
    #
    # @todo Place the path into a global variable in this script
    # @todo Need to run a check to make sure this is not on the CodeBlender project
    ##
    desc "symlink", "Symlink library elements into the project"
    def symlink

        # Variable
        path = "/var/www/codeblender.net/www/"

        system( "clear" )

        say( "\n\t Create symbolic link\n\t" )

        # Layout
        system( "rm -R ../source/layouts/_library")
        system( "ln -s #{ path }source/layouts/_library ../source/layouts")

        # Partial
        system( "rm -R ../source/partial/_library")
        system( "ln -s #{ path }source/localizable ../source/partial/_library")

        # Helper
        system( "rm -R ../helpers")
        system( "ln -s #{ path }helpers/ ../helpers")

        # Gemfile
        system( "rm ../Gemfile")
        system( "ln -s #{ path }Gemfile ../")

    end

    ##
    # Middleman locale file creation from Google key
    #
    # @usage $ thor middleman:locale
    # @see   https://gist.github.com/dhlavaty/6121814
    # @see   http://commandercoriander.net/blog/2013/06/22/a-quick-path-from-csv-to-yaml/
    #
    # @todo  Increment the version number if deployed
    ##
    desc "locale", "Middleman locale creation"
    def locale

        # Clear
        system( "clear" )

        # Backup the current files

        # URL
        url = "https://docs.google.com/spreadsheets/d/#{ @@googleLocaleKey }/export?format=csv&id=#{ @@googleLocaleKey }"

        # Download and iterate through the CSV
        CSV.new( open( url ), headers: true ).each do | line |

            puts "#{ line[ 0 ] } : #{ line[ 1 ] }"

            # # Ignore blank, if first column is empty
            # next if line[ 0 ].nil?

            # # Strip strings
            # line[ 0 ] = line[ 0 ].strip

            # # Check if first character is a hash
            # next if line[ 0 ][ 0, 1 ] == "#"

            # # Puts line
            # # puts line[ 0 ].force_encoding( 'utf-8' )
            # # puts line[ 1 ].force_encoding( 'utf-8' )
            # # puts line[ 2 ].force_encoding( 'utf-8' )

        end

        # Read CSV
        data = CSV.parse( open( url ), headers: true )

        # Change to column mode, filter by column name and change back to default mode of operation
        data.by_col!.each do | col_name, col_values |

            # Create the filename we will use all but the first column for locale creation
            puts filename = col_name.scan(/\(([^\)]+)\)/).last.first + ".yml"
            puts col_values

        end

        # puts data

        # YAML creation
        # File.open( 'weather_data.yml', 'w' ) { | f | f.write( data.to_yaml ) }

    end

    ##
    # Create a new Blog Post
    #
    # @usage $ thor middleman:blogPost
    ##
    desc "blogPost", "Create a New Blog Post"
    method_option :editor, :default => "subl"
    def blogPost( title, date = Time.now.strftime( '%Y-%m-%d' ) )

        path     = "source/games/"
        title    = title
        filename = path + "#{ date }-#{ title.to_url }.html.haml"

        if File.exist?(filename)
            abort( "#{ filename } already exists!" )
        end

        FileUtils.mkdir path + "#{ date }-#{ title.to_url }"

        puts "Creating new post: #{ filename }"

        open( filename, 'w' ) do | post |

            post.puts "---"
            post.puts "title       : \"#{ title.gsub( /&/, '&amp;' ) }\""
            post.puts "category    :"
            post.puts "subcategory :"
            post.puts "data        :"
            post.puts "developer   :"
            post.puts "publisher   :"
            post.puts "released    :"
            post.puts "platforms   :"
            post.puts "perspective :"
            post.puts "tags        :"
            post.puts "---"
            post.puts ""
            post.puts "%h1"
            post.puts "    = data.page.title"

        end

        system( options[ :editor ], filename )

    end

    ##
    # Open Server
    #
    # @usage $ thor middleman:openServer
    #
    # @todo Check that this still works and provide instructions
    ##
    desc "openServer", "Open Server"
    def openServer

        system( "clear" )
        say( "\n\tOpening Server\n\t" )

        require 'Launchy'

        file = File.expand_path( '~/middleman-server.yaml', __FILE__ )

        begin

            port = Psych.load_file( file ).fetch( :port )
            $stderr.puts %( Reading server-config file "#{ file }". )

        rescue

            $stderr.puts %( Creating server-config file "#{ file }". )
            port = ( 1_024..65_535 ).to_a.sample
            File.write( file, Psych.dump( port: port ) )

        end

        Launchy.open "http://localhost:#{ port }"
        system( "bundle exec middleman server -p #{ port }" )

    end

end