##
# Authorise and administer a Google Drive account to fetch Docs and spreadsheets
#
# @usage
# ruby -r "./google-drive.rb" -e "GoogleDrive.new"
# ruby -r "./google-drive.rb" -e "GoogleDrive.new.listFile"
# ruby -r "./google-drive.rb" -e "GoogleDrive.new.parseFile"
#
# @author   Ian Warner <ian.warner@drykiss.com>
# @category extension
#
# @see https://github.com/google/google-api-ruby-client
# @see https://developers.google.com/drive/v3/web/manage-downloads
# @see https://developers.google.com/drive/v3/web/quickstart/ruby
# @see https://developers.google.com/drive/v3/web/manage-changes
##

# Require
require "google/apis/drive_v3"
require "googleauth"
require "googleauth/stores/file_token_store"
require "fileutils"
require "nokogiri"
require "open-uri"
require_relative "instagram"
require_relative "image"

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
        @image           = ::Image.new

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
            spaces:    "drive",
            order_by:  "modifiedTime desc",
            q:         "mimeType='application/vnd.google-apps.document' and '#{ folderID }' in parents",
            fields:    'nextPageToken, files( mimeType, kind, id, name, createdTime, description, fileExtension )' )

        # No objects found
        puts 'No files found' if response.files.empty?

        # Get the objects from the top level folder ID
        response.files.each do | file |

            # Loop through each object and process either folder or file
            if file.mime_type == "application/vnd.google-apps.folder"

                # Debug
                puts "Folder"

            # File
            else

                # Export file
                html = exportFile( file )

                # Parse file
                parseFile( html, file, root, destination )

                # Debug
                puts "---------------------"
                # puts "Mime Type      : #{ file.mime_type }"
                puts "ID             : #{ file.id }"
                puts "Name           : #{ file.name }"
                # puts "Created        : #{ file.created_time }"
                # puts "Description    : #{ file.description }"
                # puts "File extension : #{ file.file_extension }"
                # puts "#{ file.to_yaml }"
                # puts html
                puts "---------------------\n"

            end

        end

    end

    ##
    # Frontmatter
    ##
    def frontMatter( doc, destination )

        # Get the first table and rows - exclude the first
        table = doc.xpath( "//table[ 1 ]/tbody/tr[ position() > 1 ]" )

        # Start the frontmatter
        fontmatter = "---\n"
        lastTD     = false

        # Loop through the table rows
        table.each do | tr |

            # Loop through the table cells
            tr.css( "td" ).each_with_index do | td, index |

                # Remove spaces
                text = td.text.gsub /\t/, ''
                text = td.text.gsub / /, ''
                text = text.strip

                # Tags is a special case - needs to be enclosed with []
                if lastTD == "tags" && index == 1

                    # Create the string for tags - strip and clean
                    fontmatter += "[#{ text }]: "

                # Category - make lower case
                # @todo remove all special characters from this
                elsif lastTD == "category" && index == 1

                    # Create the string for tags - strip and clean
                    fontmatter += "\"#{ text.downcase }\": "

                # Title - remove :
                elsif lastTD == "title" && index == 1

                    # Create the string for tags - strip and clean
                    fontmatter += "\"#{ text }\":".gsub ":", ""

                # # Type
                # elsif lastTD == "type" && index == 1

                #     # Create the string for tags - strip and clean
                #     fontmatter += "\"#{ text }\": "

                # Published - remove the quotes from here
                # Should always be true or false
                elsif lastTD == "published" && index == 1

                    # Default to false
                    if text != "true" && text != "false"
                        fontmatter += "false: "
                    else
                        fontmatter += "#{ text }: "
                    end

                # Description
                elsif lastTD == "description" && index == 1

                    # Create the string for tags - strip and clean
                    fontmatter += "\"#{ stripBadChars( text ) }\": "

                # Excerpt
                elsif lastTD == "excerpt" && index == 1

                    # Create the string for tags - strip and clean
                    fontmatter += "\"#{ stripBadChars( text ) }\": "

                else

                    # Create the string - strip and clean
                    fontmatter += "\"#{ text }\": "
                end

                lastTD = text

            end

            # Clean the last : and add newline
            fontmatter = fontmatter.chomp( ': ' ) + "\n"

        end

        ##
        # Featured image
        # The table will contain an image src for the featured image
        #
        # @todo this fails if there is no image element - fix this flag
        ##
        if ! doc.xpath( "//table[ 2 ]//img" ).empty?

            # Debug
            # puts "Found image", doc.xpath( "//table[ 2 ]//img" ).attr( "src" )

            # Process the image
            image = @image.process( doc.xpath( "//table[ 2 ]//img" ).attr( "src" ) )

            # New source
            source = "https://#{ destination }/assets/images/blogs/#{ destination }/#{ image }"

            # Add the image to the frontmatter
            fontmatter += "\"image\": \"#{ source }\"\n"

        end

        # Table
        # Remove the first and second tables
        doc.xpath( "//table[ 1 ]" ).remove
        doc.xpath( "//table[ 1 ]" ).remove

        # Heading
        # @todo Remove double quotes from the heading.text - replace with single quotes
        heading     = doc.xpath( "//h1[ 1 ]" )
        fontmatter += "\"heading\": \"#{ heading.text.strip }\"\n"
        heading.remove

        # End the frontmatter
        fontmatter += "---\n"

        # Debug
        # puts table
        # puts cellData
        # puts fontmatter

        return fontmatter

    end

    ##
    # Parse files retrieved
    #
    # @see https://www.googleapis.com/drive/v3/files/14U3UsdXzadILIJaPUxccYmVVTISq-BwbHIxG3arKZ24/export
    #
    # @todo Loop into this folder to extract any files within
    # @todo Get the categories under each language
    # @todo Create a hash of the files in the system and when they were created
    # @todo Check to see if the file has been updated since
    # @todo split out the process into different classes perhaps
    ##
    def parseFile( html = false, file = false, root = false, destination = false )

        # Open up file and analyse through NokiGiri
        if file

            doc = Nokogiri::HTML( html )

            # Save path
            savePath = "#{ root }/source/blogs/#{ destination }/#{ file.id }.html.haml"

        else

            # Test
            doc = Nokogiri::HTML( File.open( "../cache/01.html" ) ) do  | config |
                config.noblanks
            end

            # Save path
            savePath = "../cache/02.html"

        end

        # Remove empty H1 Heading
        doc.css( 'h1' ).each do | node |
            node.remove if node.inner_text == ''
        end

        # Front matter
        frontMatter = frontMatter( doc, destination )

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
        # @todo Add figure
        # html_body = Nokogiri::HTML::fragment(html)
        # nodes = html_body.xpath('.//img')
        # nodes.wrap('<figure class="center-image"> </figure>')
        # nodes.each do |img|
        #   img.xpath('.//@style').remove
        # end
        doc.css( "img" ).each do | image |

            image[ "alt" ]   = "Deliveroo"
            image[ "class" ] = "img-responsive"
            image.remove_attribute( "title" )

            # Process the image
            image = @image.process( image[ "src" ] )

            # New source
            source = "/assets/images/blogs/#{ destination }/#{ image }"
            image[ "src" ] = source

        end

        # Add class to tables
        doc.css( "table" ).each do | table |
            table[ "class" ] = "table table-condensed"
        end

        # Remove empty P
        doc.css( 'p' ).find_all{ | p | all_children_are_blank?( p ) }.each do | p |
            p.remove
        end

        # Get the body
        doc = doc.at( 'body' ).children.to_html

        ##
        # Instagram
        # @usage [[Instagram:BKpgoM9g5S2]]
        ##
        doc.scan(/(\[\[Instagram:(.*)\]\])/) do | w |

            if w

                f = Nokogiri::XML.fragment( w[ 1 ] )

                # Remove a tags if present
                f.css( 'a' ).each do | span |
                    span.swap( span.children )
                end

                # Debug
                # puts w[ 1 ]
                # puts w[ 0 ]
                # puts f

                # Get the embed
                embed = @instagram.embedCode( f )

                if embed
                    # Replace string
                    doc = doc.gsub /<p> * *#{Regexp.escape(w[0])} *<\/p>/, @instagram.embedCode( f )
                    # doc = doc.gsub /<p> *#{Regexp.escape(w[ 0 ])} *<\/p>/, "<div class=\"embedResponsive\"><iframe class=\"instagramEmbed\" src=\"//instagram.com/p/#{ w[ 1 ] }/embed/\" frameborder=\"0\" scrolling=\"no\" allowtransparency=\"true\"></iframe></div>"
                else
                    doc = doc.gsub /<p> * *#{Regexp.escape(w[0])} *<\/p>/, ""
                end

            end
        end

        ##
        # Pinterest
        # [[Pinterest:273101164879760145]]
        ##
        doc.scan(/(\[\[Pinterest:(.*)\]\])/) do | w |
            if w
                html = "<a data-pin-do=\"embedPin\" data-pin-width=\"large\" href=\"//www.pinterest.com/pin/#{ w[ 1 ] }/\"></a>"
                doc  = doc.gsub w[ 0 ], html
            end
        end

        ##
        # YouTube
        # [[YouTube:ofSLbuEomwg]]
        ##
        doc.scan(/(\[\[YouTube:(.*)\]\])/) do | w |
            if w
                html = "<iframe id=\"ytplayer\" type=\"text/html\" width=\"640\" height=\"360\" src=\"https://www.youtube.com/embed/#{ w[ 1 ] }?modestbranding=1\" frameborder=\"0\" allowfullscreen></iframe>"
                doc  = doc.gsub w[ 0 ], html
            end
        end

        ##
        # Facebook video
        # [[FacebookVideo:Deliveroo/videos/1165008793619139]]
        ##
        doc.scan(/(\[\[FacebookVideo:(.*)\]\])/) do | w |
            if w
                html = "<div class='fb-video' data-allowfullscreen='true' data-autoplay='true' data-href='https://www.facebook.com/#{ w[ 1] }' data-show-captions='true' data-width='877'></div>"
                doc  = doc.gsub w[ 0 ], html
            end
        end

        # Breaks
        doc = doc.gsub /\<br>    /, "\n    "
        doc = doc.gsub /\<br>/, "\n"

        # Paragraph
        doc = doc.gsub '<hr>', ""

        # Quotes
        doc = stripBadChars( doc )

        # # Save doc to destination with ID
        File.write( savePath, frontMatter + doc )

        # Debug
        # puts doc

    end

    ##
    # Generic function to replace MS word smart quotes and apostrophes
    ##
    def stripBadChars( doc )
        doc = doc.gsub /\u2018/, "'"
        doc = doc.gsub /[”“]/, '"'
        doc = doc.gsub /’/, "'"
        return doc
    end

    ##
    # @see http://stackoverflow.com/questions/7183299/removing-p-elements-with-no-text-with-nokogiri
    ##
    def is_blank?( node )
        ( node.text? && node.content.strip == '' ) || ( node.element? && node.name == 'br' )
    end

    ##
    #
    ##
    def all_children_are_blank?( node )
        node.children.all?{ | child | is_blank?( child ) }
    end

    ##
    # Export a given file to HTML
    # id = 1ztO0ZaIyji5B-ePCHAhPM2GSkVQEiJm3sQJ5AtvXrEs
    # https://docs.google.com/doc/d/1ztO0ZaIyji5B-ePCHAhPM2GSkVQEiJm3sQJ5AtvXrEs/export?format=html
    #
    # @usage
    # exportFile( file )
    #
    # @param file object Google file
    #
    # @see https://developers.google.com/drive/v3/web/manage-downloads
    ##
    def exportFile( file )

        # Download file
        # @service.get_file(file.id, download_dest: StringIO.new)

        # Export file
        dest = StringIO.new
        @service.export_file( file.id, 'text/html', download_dest: dest )

        # Return
        # STDOUT.write( dest.read )
        dest.string

    end

end
