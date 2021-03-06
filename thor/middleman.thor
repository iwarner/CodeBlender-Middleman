##
# Middleman Thor file
# Provides specific tasks in the development life cycle of a middleman project
#
# @usage  $ thor list
# @author Ian Warner <ian.warner@drykiss.com>
# @see    http://whatisthor.com/
##

# Require
require 'csv'
require 'open-uri'
require 'yaml'

##
# Middleman thor
##
class Middleman < Thor

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
        # config = YAML::load_file( "../data/config.yaml" )

        # Increment version

        # Delete build directory
        say( "\n\t Remove build folder\n\t" )
        system( "rm -rf ../build" )

        # Build
        say( "\n\t Middleman build\n\t" )
        system( "bundle exec middleman build --clean" )

        # UnCSS
        # say( "\n\t UnCSS\n\t" )
        # system( "gulp buildCSS" )

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
    # Middleman locale file creation from Google key
    #
    # @usage $ thor middleman:locale
    # cd thor && thor middleman:posts foodscene.deliveroo.com.sg 0BwDBWlxBkJ6kSEVoR0ZCYXRWQ2M
    ##
    desc "posts", "Middleman locale creation"
    def posts( destination, docFolder )

        # Clear
        system( "clear" )

        # Say
        say( "\n\t Middleman posts creation\n\t" )
        say( "\n\t#{ destination }\n\t" )
        say( "\n\t#{ docFolder }\n\t" )

    end

    ##
    # Middleman locale file creation from Google key
    #
    # @usage $ thor middleman:locale
    # cd thor && thor middleman:locale 1cnvfAqQDQgojbIF5V2TVRim10g4pV6x5yatcS9w-Xo8
    #
    # @see   https://gist.github.com/dhlavaty/6121814
    # @see   http://commandercoriander.net/blog/2013/06/22/a-quick-path-from-csv-to-yaml/
    # @see   https://github.com/avillafiorita/middleman-rakefile
    ##
    desc "locale", "Middleman locale creation"
    def locale( sheetID )

        # Clear
        system( "clear" )

        path = File.symlink?( __FILE__ ) ? File.readlink(__FILE__) : __FILE__
        path = File.symlink?( $0 ) ? File.readlink( $0 ) : $0
        path = File.dirname(Pathname.new(__FILE__).realpath)

        # Say
        say( "\n\t Middleman locale creation\n\t" )
        say( "\n\t#{ sheetID }\n\t" )
        say( "\n\t#{ Dir.pwd }\n\t" )
        say( "\n\t#{ path }\n\t" )
        say( "\n\t#{ File.symlink?( __dir__ ) }\n\t" )
        say( "\n\t#{ File.basename( __FILE__ ) }\n\t" )
        say( "\n\t#{ File.dirname(File.expand_path(__FILE__)) }\n\t" )

        # # CSV to YAML
        # # GCSVToYaml.new( sheetID ).parse
        # GCSVToYaml.new( sheetID ).parse
        # # GCSVToYaml.new( ARGV[ 0 ] || sheetID, ARGV[ 1 ] ).parse

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


##
# GCSVToYaml
# Google CSV to YAML
#
# @author Marek Piechocki <work@marek-piechocki.pl>
##
class GCSVToYaml

    attr_accessor :google_local_key, :hash_results, :destination_folder, :column_names

    ##
    # Initialize
    #
    # @param google_local_key
    # @param destination_folder
    ##
    def initialize( google_local_key, destination_folder = "../locales" )

        self.google_local_key = google_local_key

        # Create nested hashes for all non initialized keys
        self.hash_results = Hash.new { | hash, key | hash[ key ] = Hash.new( &hash.default_proc ) }

        # Destination folder or default to root
        self.destination_folder = destination_folder || './'

        # { column_index: value } - e.g. { 1: 'en', 2: 'fr' }
        self.column_names = {}

    end

    ##
    # Parse
    ##
    def parse

        # Step 1 - parse csv file
        CSV.new( open( google_csv_url ) ).each_with_index do | line, row_index |

            puts row_index

            # Parse header - search column names
            if row_index == 0

                line.each_with_index do | header_cell, column_index |

                    # Skip first column
                    next if column_index == 0
                        self.column_names[ column_index ] = header_cell.scan( /\(([^\)]+)\)/ ).last.first.strip
                    end

                next

            end

            # Ignore blank, if first column is empty
            next if line[ 0 ].nil?
            next if line[ 0 ].strip == ''

            # Check if first character is a hash
            next if line[ 0 ].strip[ 0, 1 ] == '#'

            line.each_with_index do | cell, column_index |

                # Skip first column - it's our key
                next if column_index == 0

                # add cell value to hash. e.g. key format: 'en.pagination.next'
                add_element_to_hash_results( "#{ column_names[ column_index ] }.#{ line[ 0 ].strip }", cell.to_s.strip )
            end

        end

        # Step 2 - generate yml files from hash
        column_names.values.each do | key |
            File.open( File.join( destination_folder, "#{ key }.yml" ), 'w' ) { | f | f.write( { "#{ key }" => hash_results[ key ] }.to_yaml ) }
        end

    end

    ##
    # Add element to hash
    ##
    def add_element_to_hash_results( key, value )

        collection_keys = key.split( '.' )
        key_for_value   = collection_keys.pop

        nested = collection_keys.inject( self.hash_results ) do | nested, collection_key |

            if is_array?( collection_key )

                array_key   = parse_array_key( collection_key )
                array_index = parse_array_index( collection_key )

                unless nested.has_key?( array_key )
                    nested[ array_key ] = Array.new
                end

                unless nested[ array_key ][ array_index ]
                    nested[ array_key ][ array_index ] = Hash.new { | hash, key | hash[ key ] = Hash.new( &hash.default_proc ) }
                end

                nested[ array_key ][ array_index ]

            else
                nested[ collection_key ]
            end

        end

        if is_array?( key_for_value )

            array_key   = parse_array_key(key_for_value)
            array_index = parse_array_index(key_for_value)

            unless nested.has_key?( array_key )
                nested[ array_key ] = Array.new
            end

            nested[ array_key ][ array_index ] = value.force_encoding( 'UTF-8' )

        else
            nested[ key_for_value ] = value.force_encoding( 'UTF-8' )
        end

    end

    ##
    # Is array
    ##
    def is_array?( string )
        string.scan( /\[\d+\]$/ ).first
    end

    ##
    # Parse array key
    ##
    def parse_array_key( string )
        string.gsub( /\[\d+\]$/, '' )
    end

    ##
    # Parse array index
    ##
    def parse_array_index( string )
        string.scan( /\[(\d+)\]$/ ).first.first.to_i
    end

    ##
    # Google URL
    # The sheet needs to be read only by everyone
    ##
    def google_csv_url
        "https://docs.google.com/spreadsheets/d/#{ google_local_key }/export?format=csv"
    end

end