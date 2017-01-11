##
# Authorise and administer a Google Drive account to fetch Docs and spreadsheets
#
# @usage
# ruby -r "./google-drive.rb" -e "GoogleDrive.new.listFile"
# ruby -r "./google-drive.rb" -e "GoogleDrive.new.parseFile"
#
# @author   Ian Warner <ian.warner@drykiss.com>
# @category extension
#
# @see https://developers.google.com/drive/v3/web/manage-downloads
# @see https://developers.google.com/drive/v3/web/quickstart/ruby
##

# Require
require "google/apis/drive_v3"
require "googleauth"
require "googleauth/stores/file_token_store"
require "fileutils"
require "nokogiri"
require "open-uri"
require_relative "instagram"

##
# Convenience wrapper for Google Drive
#
# You can override the location of the client secrets and oauth2 JSON files with
# the environment variables `GOOGLE_CLIENT_SECRETS` and `GOOGLE_DRIVE_OAUTH`.
#
# If you plan to run Middleman on a server, you can use Google's server to server
# authentication. This will kick in if you define the environment variables
# `GOOGLE_OAUTH_PERSON`, `GOOGLE_OAUTH_ISSUER` and either `GOOGLE_OAUTH_KEYFILE`
# or `GOOGLE_OAUTH_PRIVATE_KEY`.
##
class GoogleDrive

    ##
    # Constructor. Loads all parameters from environment variables.
    ##
    def initialize

        # Constants
        @oob             = "urn:ietf:wg:oauth:2.0:oob"
        @applicationName = "CodeBlender"
        @scope           = Google::Apis::DriveV3::AUTH_DRIVE
        @instagram       = ::Instagram.new

        # Credentials
        @clientSecret = File.join( Dir.home, '.google_credential', "client_secret.json" )
        @credentials  = File.join( Dir.home, '.google_credential', "drive_oauth2.yaml" )

        # Authorise and initialize the API
        @service                                 = Google::Apis::DriveV3::DriveService.new
        @service.client_options.application_name = @applicationName
        @service.authorization                   = authorize

    end

    ##
    # Ensure valid credentials, either by restoring from the saved credentials
    # files or initiating an OAuth2 authorization. If authorization is required,
    # the user's default browser will be launched to approve the request.
    #
    # @return [Google::Auth::UserRefreshCredentials] OAuth2 credentials
    ##
    def authorize

        # Options
        client_id   = Google::Auth::ClientId.from_file( @clientSecret )
        token_store = Google::Auth::Stores::FileTokenStore.new( file: @credentials )
        authorizer  = Google::Auth::UserAuthorizer.new( client_id, @scope, token_store )
        user_id     = "default"
        credentials = authorizer.get_credentials( user_id )

        if credentials.nil?

            # Authorise return URL
            url = authorizer.get_authorization_url( base_url: @oob )

            # Output for user to follow
            puts "Open the following URL in the browser and enter the resulting code after authorization"
            puts url

            # Credentials from code
            credentials = authorizer.get_and_store_credentials_from_code( user_id: user_id, code: gets, base_url: @oob )

        end

        # Return credentials
        credentials

    end

    ##
    # List files based in a certain folder
    #
    # page_size = number of files to obtain
    # q         = Query to perform
    #
    # CodeBlender folder = 0BwDBWlxBkJ6kaE85ek11cnJWQlU
    # Deliveroo folder   = 0BwDBWlxBkJ6kbVJwUVliZ213Rjg
    #
    # Newsroom
    # folderID   = "0BwDBWlxBkJ6keHNZX3laaW9RdG8"
    # blogFolder = "localizable/newsroom"
    #
    # # blog.deliveroo.co.uk
    # folderID   = "0BwDBWlxBkJ6kc2tSZ0tISXZEUHM"
    # blogFolder = "localizable/blog.deliveroo.co.uk"
    #
    # @todo Check that the empty folder works
    # @todo Should exit the script and inform
    # @todo Find posts that have changed since last update
    ##
    def listFile( root, destination, folderID = "0BwDBWlxBkJ6kaE85ek11cnJWQlU" )

        # List files
        response = @service.list_files(
            page_size: 100,
            q:         "'#{ folderID }' in parents",
            fields:    'nextPageToken, files( mimeType, kind, id, name, createdTime, description, fileExtension )' )

        # No objects found
        puts 'No files found' if response.files.empty?

        # Get the objects from the top level folder ID
        response.files.each do | file |

            # Loop through each object and process either folder or file
            if file.mime_type == "application/vnd.google-apps.folder"

                # Debug
                puts "Folder"

                # Parse the folders if required

            # File
            else

                # Export file
                html = exportFile( file )

                # Parse file
                parseFile( html, file, root, destination )

                # Debug
                # puts "---------------------"
                # puts "Mime Type      : #{ file.mime_type }"
                # puts "ID             : #{ file.id }"
                # puts "Name           : #{ file.name }"
                # puts "Created        : #{ file.created_time }"
                # puts "Description    : #{ file.description }"
                # puts "File extension : #{ file.file_extension }"
                # puts "#{ file.to_yaml }"
                # puts "---------------------"

            end

        end

    end

    ##
    # Parse files retrieved
    #
    # @see https://www.googleapis.com/drive/v3/files/1ztO0ZaIyji5B-ePCHAhPM2GSkVQEiJm3sQJ5AtvXrEs/export
    #
    # @todo Loop into this folder to extract any files within
    # @todo Get the categories under each language
    # @todo Create a hash of the files in the system and when they were created
    # @todo Check to see if the file has been updated since
    # @todo split out the process into different classes perhaps
    ##
    def parseFile( html, file = false, root, destination )

        # Save path
        savePath = "#{ root }/source/localizable/blogs/#{ destination }/#{ file.id }.html.haml"

        # Open up file and analyse through NokiGiri
        if file

            doc = Nokogiri::HTML( html )

        else

            # Test
            doc = Nokogiri::HTML( File.open( "../cache/01.html" ) ) do  | config |
                config.noblanks
            end

        end

        # Featured image
        # The first table will contain an image src for the featured image
        img = doc.xpath( "//table//img" ).first

        # Remove the first table that contains the featured image
        doc.xpath( "//table[1]" ).remove

        # Remove DIVs
        doc.xpath( '//div' ).remove

        # Remove style, class and id attributes
        doc.xpath( '//@style', '//@id', '//@class' ).remove

        # Remove spans
        doc.css( 'span' ).each do | span |
            span.swap( span.children )
        end

        # Links
        # Change Google URLs into correct ones
        # Remove a link if it is empty
        doc.css( "a" ).each do | link |
            if link[ "href" ].to_s != ""
                link[ "href" ] = link[ "href" ][ /\=(.*?)&/, 1 ]
            else
                link.remove
            end
        end

        # Images
        # Add the figure and caption around an image
        # Optimise images
        # Store images
        doc.css( "img" ).each do | image |
            image[ "alt" ]   = "Deliveroo"
            image[ "class" ] = "img-responsive"
            image.remove_attribute( "title" )
        end

        # Table
        # Remove featured image table
        doc.css( "table" ).each do | table |
            table[ "class" ] = "table table-condensed"
        end

        # Title
        title = doc.xpath( '//h1' ).first

        # Get the body
        doc = doc.at( 'body' ).children.to_html

        # Instagram
        # [[Instagram:BKpgoM9g5S2]]
        doc.scan(/(\[\[Instagram:(.*)\]\])/) do | w |
            if w
                doc = doc.gsub w[ 0 ], @instagram.embedCode( w[ 1 ].to_s )
            end
        end

        # Pinterest
        # [[Pinterest:273101164879760145]]
        doc.scan(/(\[\[Pinterest:(.*)\]\])/) do | w |
            if w
                html = "<a data-pin-do=\"embedPin\" data-pin-width=\"large\" href=\"//www.pinterest.com/pin/#{ w[ 1 ] }/\"></a>"
                doc  = doc.gsub w[ 0 ], html
            end
        end

        # YouTube
        # [[YouTube:ofSLbuEomwg]]
        doc.scan(/(\[\[YouTube:(.*)\]\])/) do | w |
            if w
                html = "<iframe id=\"ytplayer\" type=\"text/html\" width=\"640\" height=\"360\" src=\"https://www.youtube.com/embed/#{ w[ 1 ] }?modestbranding=1\" frameborder=\"0\" allowfullscreen></iframe>"
                doc  = doc.gsub w[ 0 ], html
            end
        end

        # Facebook video
        # [[FacebookVideo:Deliveroo/videos/1165008793619139]]
        doc.scan(/(\[\[FacebookVideo:(.*)\]\])/) do | w |
            if w
                html = "<div class='fb-video' data-allowfullscreen='true' data-autoplay='true' data-href='https://www.facebook.com/#{ w[ 1] }' data-show-captions='true' data-width='877'></div>"
                doc  = doc.gsub w[ 0 ], html
            end
        end

        # Need to append the meta image for this also
        # doc = doc.gsub 'meta:', "title: \"#{ title.text }\"\nmeta:\n    image: \"#{ img.attr( "src" ) }\""

        # Breaks
        doc = doc.gsub /\<br>    /, "\n    "
        doc = doc.gsub /\<br>/, "\n"

        # Front matter
        doc = doc.gsub '---</p>', "\n---\n"
        doc = doc.gsub '<p>---', "---\n"
        doc = doc.gsub '<p></p>', ""

        # Quotes
        doc = doc.gsub '’', "'"

        # Save doc to destination with ID
        File.write( savePath, doc )

        # Debug
        # puts doc

    end

    ##
    # Export a given file to HTML
    # id = 1ztO0ZaIyji5B-ePCHAhPM2GSkVQEiJm3sQJ5AtvXrEs
    # https://docs.google.com/doc/d/1ztO0ZaIyji5B-ePCHAhPM2GSkVQEiJm3sQJ5AtvXrEs/export?format=html
    #
    # @usage
    # exportFile( file )
    #
    # @see https://developers.google.com/drive/v3/web/manage-downloads
    ##
    def exportFile( file )

        # Google path
        googlePath = "https://docs.google.com/doc/d/"

        # Google path
        getPath = "#{ googlePath }#{ file.id }/export?format=html"

        # Open string
        doc = StringIO.new

        # Export file
        @service.export_file( file.id, 'text/html', download_dest: doc )

        # Return
        doc.string

    end

end
