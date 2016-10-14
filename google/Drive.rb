##
# Authorise and administer a Google Drive account
#
# @author Ian Warner <ian.warner@drykiss.com>
# @see    https://developers.google.com/drive/v3/web/manage-downloads
# @see    https://developers.google.com/drive/v3/web/quickstart/ruby
##

# Require
require "google/apis/drive_v3"
require "googleauth"
require "googleauth/stores/file_token_store"
require "fileutils"

OOB_URI             = "urn:ietf:wg:oauth:2.0:oob"
APPLICATION_NAME    = "Drive API Ruby Quickstart"
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

# List the 10 most recently modified files.
# children.list files.list with ?q='parent_id'+in+parents
response = service.list_files( page_size: 10, q: "'0BwDBWlxBkJ6kOUZwblhwbjlSWnc' in parents", fields: 'nextPageToken, files( id, name )' )

puts "Files:"
puts 'No files found' if response.files.empty?

# Get the folders from the top level ID
response.files.each do | file |

    # Print out top language folders
    puts "#{ file.name } (#{ file.id })"

    # Loop through each language folder

    # Get the categories under each language

    # Find posts that have changed since last update

    # Download posts

    # Scan for images and download - or use from Google directly?

    # Optimise images

    # Store images

end
