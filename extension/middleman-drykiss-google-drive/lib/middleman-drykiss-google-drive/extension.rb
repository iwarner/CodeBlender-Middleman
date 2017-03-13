##
# Google Drive
#
# @author Ian Warner <ian.warner@drykiss.com>
##

# Require
require "middleman-core"
require "google-drive"

##
# Middleman
##
module Middleman

    ##
    # Google Drive
    ##
    class DryKISSGoogleDrive < ::Middleman::Extension

        # Options
        option :destination, false, "Folder to store the blog files"
        option :docFolder,   false, "Default Google Drive folder to collect documents"
        option :sheetID,     false, "Gather translation file from sheet ID"

        ##
        # Initialize
        ##
        # def initialize( app, options_hash={}, &block )

        #     # Call super to build options from the options_hash
        #     super

        #     # Begin
        #     begin

        #         # Register Google drive authentication
        #         @googleDrive = ::GoogleDrive.new

        #         # Handle options
        #         # handle_option( options.folder, :xlsx )
        #         # handle_option( options.locale, :txt )

        #         # Register app instance
        #         # @app = app.inst

        #         # Create cache folder
        #         # @cache_dir = File.join( @app.root, 'google_drive_cache' )
        #         # Dir.mkdir( @cache_dir ) unless Dir.exist?( @cache_dir )

        #         # rescue Faraday::ConnectionFailed => ex
        #         #   puts "== Can't connect to Google (#{ex.message})"

        #     end

        # end

        ##
        # After configuration
        # Process the creation of the documents required
        ##
        def after_configuration

            puts "HERE"
            raise "Google After Configuration"

            @app = app

            if @app.config[ :mode ] === :config

                @googleDrive = ::GoogleDrive.new

                # List files
                @googleDrive.listFile( @app.root, options.destination, options.docFolder )

            end

        end

        ##
        # before_build ⇒ Object
        # Respond to the before_build event.
        # Middleman after configuration hook
        # Process the creation of the documents required
        ##
        # def before_build( builder, option )

        #     puts builder
        #     puts option

        # end

        # ##
        # # Handle options
        # ##
        # def handle_option( option, type )

        #     if option.is_a? Hash
        #         option.each do |name, key|
        #             store_data(name, load_doc(key.to_s, type))
        #         end
        #     elsif type == :xlsx
        #         load_doc(option.to_s, type).each do |name, sheet|
        #             store_data(name, sheet)
        #         end
        #     else
        #         store_data( 'doc', load_doc( option.to_s, type ) )
        #     end

        # end

        # ##
        # # Load
        # ##
        # def load_doc(key, type)
        # filename = data_path("#{key}.#{type}")
        # doc = @drive.find(key)
        # puts <<-MSG
        # == Loading data from Google Doc "#{doc['title']}"
        # ==   #{doc['alternateLink']}
        # MSG

        # case type.to_sym
        # when :xlsx
        # if @drive.server?
        # filename = @drive.export_to_file(key, :xlsx)
        # else
        # @drive.export_to_file(key, :xlsx, filename)
        # end
        # ret = @drive.prepare_spreadsheet(filename)
        # File.unlink(filename) if @drive.server?
        # when :archieml
        # if @drive.server?
        # ret = Archieml.load(@drive.export(key, :txt))
        # else
        # @drive.export_to_file(key, :txt, filename)
        # ret = Archieml.load(File.read(filename))
        # end
        # else
        # if @drive.server?
        # ret = @drive.export(key, type)
        # else
        # @drive.export_to_file(key, type, filename)
        # ret = File.read(filename)
        # end
        # end
        # return ret
        # rescue ::Faraday::ConnectionFailed => exc
        # puts "== FAILED to load Google Doc \"#{exc.message}\""
        # return load_local_copy(filename)
        # rescue ::GoogleDrive::GoogleDriveError => exc
        # puts "== FAILED to load Google Doc \"#{exc.message}\""
        # unless @drive.server?
        # puts <<-MSG
        # Could not load the Google Doc.
        # Things to check:
        # - Make sure the Google Doc key is correct
        # - Make sure you're logging in with the correct account
        # - Make sure you have access to the document
        # MSG
        # @drive.clear_auth
        # end
        # return load_local_copy(filename)
        # end

        # def load_local_copy(filename)
        # if File.exist? filename
        # puts '== Loading Google Doc from local cache'
        # type = File.extname(filename).gsub('.','').to_sym
        # case type
        # when :xlsx
        # return @drive.prepare_spreadsheet(filename)
        # when :archieml
        # return Archieml.load(File.read(filename))
        # else
        # return File.read(filename)
        # end
        # else
        # puts '== No local copy of Google Doc'
        # return nil
        # end
        # end

        # def data_path(basename)
        # File.join(@cache_dir, basename)
        # end

        # def store_data(key, data)
        # @app.data.store(key, data)
        # end

    end

end
