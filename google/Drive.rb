##
# Authorise and administer a Google Drive account
#
# @usage
# ruby Drive.rb
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

OOB_URI             = "urn:ietf:wg:oauth:2.0:oob"
APPLICATION_NAME    = "CodeBlender"
CLIENT_SECRETS_PATH = "client_secret.json"
CREDENTIALS_PATH    = File.join( Dir.home, '.credentials', "drive-ruby-quickstart.yaml" )
SCOPE               = Google::Apis::DriveV3::AUTH_DRIVE

##
# Ensure valid credentials, either by restoring from the saved credentials
# files or initiating an OAuth2 authorization. If authorization is required,
# the user's default browser will be launched to approve the request.
#
# @return [Google::Auth::UserRefreshCredentials] OAuth2 credentials
##
def authorize

    FileUtils.mkdir_p( File.dirname( CREDENTIALS_PATH ) )

    client_id   = Google::Auth::ClientId.from_file( CLIENT_SECRETS_PATH )
    token_store = Google::Auth::Stores::FileTokenStore.new( file: CREDENTIALS_PATH )
    authorizer  = Google::Auth::UserAuthorizer.new( client_id, SCOPE, token_store )
    user_id     = "default"
    credentials = authorizer.get_credentials( user_id )

    if credentials.nil?
        url = authorizer.get_authorization_url( base_url: OOB_URI )

        puts "Open the following URL in the browser and enter the resulting code after authorization"
        puts url

        code        = gets
        credentials = authorizer.get_and_store_credentials_from_code( user_id: user_id, code: code, base_url: OOB_URI )
    end

    credentials

end

# Initialize the API
service                                 = Google::Apis::DriveV3::DriveService.new
service.client_options.application_name = APPLICATION_NAME
service.authorization                   = authorize

##
# Get files based in a certain folder
#
# page_size = number of files to obtain
# q         = Query to perform
#
# CodeBlender Blog folder = 0BwDBWlxBkJ6kaE85ek11cnJWQlU
# Deliveroo Blog folder   = 0BwDBWlxBkJ6kbVJwUVliZ213Rjg
##
response = service.list_files( page_size: 100, q: "'0BwDBWlxBkJ6kaE85ek11cnJWQlU' in parents",
    fields: 'nextPageToken, files( mimeType, kind, id, name, createdTime, description, fileExtension )' )

# Tasks
# Check that the empty folder works
# Should exit the script and inform

# No objects found
puts 'No files found' if response.files.empty?

# Google path
googlePath = "https://docs.google.com/doc/d/"

# Tasks
# Find posts that have changed since last update

# Get the objects from the top level folder ID
response.files.each do | file |

    # Loop through each object and process either folder or file
    if file.mime_type == "application/vnd.google-apps.folder"

        # Tasks
        # Loop into this folder to extract any files within
        # Get the categories under each language

        # Debug
        puts "Folder"

    # File
    else

        # Tasks
        # Create a hash of the files in the system and when they were created
            # Check to see if the file has been updated since
        # https://www.googleapis.com/drive/v3/files/1ztO0ZaIyji5B-ePCHAhPM2GSkVQEiJm3sQJ5AtvXrEs/export

        # Save path
        getPath  = "#{ googlePath }#{ file.id }/export?format=html"
        savePath = "../source/blog/#{ file.id }.html.haml"

        # Open string
        doc = StringIO.new

        # Download document
        # id = 1ztO0ZaIyji5B-ePCHAhPM2GSkVQEiJm3sQJ5AtvXrEs
        # https://docs.google.com/doc/d/1ztO0ZaIyji5B-ePCHAhPM2GSkVQEiJm3sQJ5AtvXrEs/export?format=html
        # @see https://developers.google.com/drive/v3/web/manage-downloads
        service.export_file( file.id, 'text/html', download_dest: doc )

        # Open up file and analyse through NokiGiri
        doc = Nokogiri::HTML( doc.string )

        # Remove DIVs
        doc.search( 'div' ).remove

        # Get the body
        doc = doc.at( 'body' ).children

        # Remove style and id attributes
        doc.xpath( '//@style', '//@id' ).remove

        # Remove the span
        doc.css( 'span' ).each do | span |
            span.swap( span.children )
        end

        # Links
        # Change Google URLs into correct ones
        doc.css( "a" ).each do | link |
            if link[ "href" ].to_s != ""
                link[ "href" ] = link[ "href" ][ /\=(.*?)&/, 1 ]
            end
        end

        # Remove empty links
        doc = doc.to_s.gsub! '<a></a>', ''

        # Breaks
        doc = doc.to_s.gsub /\<br>    /, "\n    "
        doc = doc.to_s.gsub /\<br>/, "\n"

        # Front matter
        doc = doc.to_s.gsub! '---</p>', "\n---\n"

        # Quotes
        doc = doc.to_s.gsub! '’', "'"

        # Table
        doc = doc.to_s.gsub! '<table', '<table class="table table-condensed"'

        # Images
        # Add the figure and caption around an image
        # Optimise images
        # Store images
        doc = doc.to_s.gsub! 'alt=""', 'alt="Deliveroo" class="img-responsive"'

        # Save doc
        File.write( savePath, doc )

        # Debug
        puts doc
        puts "File"

    end

    # Debug
    # puts "---------------------"
    # puts "Mime Type      : #{ file.mime_type }"
    # puts "ID             : #{ file.id }"
    # puts "Name           : #{ file.name }"
    # puts "Created        : #{ file.created_time }"
    # puts "Description    : #{ file.description }"
    # puts "File extension : #{ file.fileExtension }"
    # puts "#{ file.to_yaml }"

end
