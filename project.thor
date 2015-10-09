##
# Project Thor File
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class Project < Thor

    ##
    # Variables
    ##
    @@phoneGapToken = ""
    @@phoneGapAppID = ""
    @@phoneGapUser  = ""
    @@phoneGapPass  = ""

    ##
    # Middleman Build and Deploy
    # @todo Increment the version number if deployed
    ##
    desc "middlemanDeploy", "Middleman Build and Deploy"
    def middlemanDeploy

        system( "clear" )

        # Load the Config File
        config = YAML::load_file( "data/config.yaml" )

        # Increment Version

        # Build
        say( "\n\t Middleman Build\n\t" )
        system( "bundle exec middleman build" )

        # Deploy
        say( "\n\t Middleman Deploy\n\t" )
        system( "bundle exec middleman deploy" )

    end

    ##
    # Middleman Package
    # @usage thor project:middlemanPackage
    ##
    desc "middlemanPackage", "Create a Zip file of the Build"
    def middlemanPackage

        # Load the Config File
        config = YAML::load_file( "data/config.yaml" )

        # Get the version
        version = config[ :version ]

        # Variables
        fileName = "vme-gwp-proto-v" + version

        # Clear
        system( "clear" )

        # Build Middleman
        say( "\n\t Middleman Build Clean\n\t" )
        system( "bundle exec middleman build --clean" )

        # Zip up the build folder
        say( "\n\t Zip the build folder\n\t" )
        system( "cd www && zip -r ../#{ fileName }.zip . -x '*.DS_Store'" )

    end

    ##
    # Middleman SymLinks
    ##
    desc "middlemanSymLinks", "Symlink Library elements into the project"
    def middlemanSymLinks

        # Variables
        path = "/var/www/codeblender.net/www/"

        system( "clear" )

        say( "\n\t Create Symlinks\n\t" )

        # JavaScript
        system( "rm -R source/assets/javascripts/_library")
        system( "ln -s #{ path }source/assets/javascripts/_library source/assets/javascripts")

        # Layouts
        system( "rm -R source/layouts/_library")
        system( "ln -s #{ path }source/layouts/_library source/layouts")

        # Partial
        system( "rm -R source/partial/_library")
        system( "ln -s #{ path }source/partial/_library source/partial")

        # Helpers
        system( "rm -R helpers")
        system( "ln -s #{ path }helpers/ helpers")

        # Lib
        system( "rm -R lib")
        system( "ln -s #{ path }lib/ lib")

        # Humans.txt
        system( "rm source/humans.txt")
        system( "ln -s #{ path }source/humans.txt source")

        # Robots.txt
        system( "rm source/robots.txt")
        system( "ln -s #{ path }source/robots.txt source")

        # Gemfile
        system( "rm GEMFILE")
        system( "ln -s #{ path }Gemfile .")

    end

    ##
    # Node Webkit Build
    ##
    desc "webkitBuild", "Node WebKit Desktop Build"
    def webkitBuild

        system( "clear" )

        say("\n\t Middleman Build Clean\n\t")
        system("bundle exec middleman build --clean")

        say( "\n\tMove into Build Folder : www and Create Zip\n\t" )
        system( "cd www && pwd && zip -r app.nw *" )

    end

    ##
    # Cordova Build
    ##
    desc "cordovaBuild", "Cordova Build"
    def cordovaBuild

        system("clear")

        # Middleman Build
        say( "\n\t Middleman Build Clean\n\t" )
        system( "bundle exec middleman build --clean" )

        # Cordova Build
        say( "\n\t Cordova Build\n\t" )
        system( "cordova build" )

        # Cordova Emulate iOS
        say( "\n\t Cordova Build\n\t" )
        system( "cordova emulate ios" )

    end

    ##
    # PhoneGap Build via Zip
    ##
    desc "phoneGapBuildZip", "PhoneGap Build Via Zip"
    def phoneGapBuildZip

        system( "clear" )
        say( "\n\tCreating Project\n\t" )

        say( "\n\tRemove Build Folder\n\t" )
        system( "sudo rm -r build" )

        say( "\n\tMiddleman Build\n\t" )
        system( "bundle exec middleman build --clean" )

        # Remove Project.zip if one exists
        say( "\n\tRemoving project.zip file" )
        system( "rm project.zip" )

        # Create Project.zip - Exclude Files
        # -x /plugins/\* -x cordova.js -x cordova_plugins.js
        say( "\n\tCreating project.zip file\n\n" )
        system( "cd build && zip -r ../project.zip . -x '*.DS_Store' -x runner.html -x /spec/\*" )

        # Upload Project.zip
        say( "\n\tUploading File to Adobe PhoneGap Build" )
        system( "curl -X PUT -F file=@project.zip https://build.phonegap.com/api/v1/apps/#{@@phoneAppID}?auth_token=#{@@phoneGapToken}" )

    end

    ##
    # PhoneGap Build Remote
    # thor project:pgBuildRemote
    ##
    desc "phoneGapBuildRemote", "Create a PhoneGap Build Remote"
    def phoneGapBuildRemote

        system( "clear" )
        say( "\n\PhoneGap Build Remote\n\t" )

        say( "\n\tMiddleman Build\n\t" )
        system( "bundle exec middleman build --clean" )

        # Login
        say( "\n\tLogin\n\n" )
        system( "phonegap remote login -u iwarner@triangle-solutions.com -p tri_adobe=15" )

        # Build
        say( "\n\tBuild\n\n" )
        system( "phonegap remote build ios" )

    end

    ##
    # PhoneGap Reset
    ##
    desc "phoneGapReset", "Reset PhoneGap"
    def phoneGapReset

        # Messages
        system( "clear" )
        say( "\n\t PhoneGap Reset\n\t" )

        # Remove iOS Platform
        system( "cd platforms && rm -r ios" )

        system( "phonegap local plugin remove org.apache.cordova.device" )
        system( "phonegap local plugin add org.apache.cordova.device" )

        system( "phonegap local plugin remove org.apache.cordova.dialogs" )
        system( "phonegap local plugin add org.apache.cordova.dialogs" )

        system( "phonegap local plugin remove org.apache.cordova.geolocation" )
        system( "phonegap local plugin add org.apache.cordova.geolocation" )

        system( "phonegap local plugin remove org.apache.cordova.vibration" )
        system( "phonegap local plugin add org.apache.cordova.vibration" )

        system( "phonegap local build ios" )
        system( "phonegap local run ios --emulator" )

    end

    ##
    # PhoneGap Emulate IOS
    ##
    desc "phoneGapEmulateIos", "Emulate IOS"
    def phoneGapEmulateIos

        # Messages
        system( "clear" )
        say( "\n\t PhoneGap Build and Emulate IOS\n\t" )

        # Build Middleman
        system( "sudo bundle exec middleman build --clean" )

        # Delete some files
        system( "sudo rm -r www/spec" )
        system( "sudo rm -r www/runner.html" )
        system( "sudo rm -r www/plugins" )
        system( "sudo rm    www/phonegap.js" )
        system( "sudo rm    www/cordova.js" )
        system( "sudo rm    www/cordova_plugins.js" )

        # PhoneGap Build and Emulate
        system( "phonegap build ios && phonegap run ios --emulator" )

    end

    ##
    # Create a new Blog Post
    #
    # Usage
    # thor project:post
    ##
    desc "blogPost", "Create a New Blog Post"
    method_option :editor, :default => "subl"
    def blogPost(title, date = Time.now.strftime('%Y-%m-%d'))

        path     = "source/games/"
        title    = title
        filename = path + "#{date}-#{title.to_url}.html.haml"

        if File.exist?(filename)
            abort("#{filename} already exists!")
        end

        FileUtils.mkdir path + "#{date}-#{title.to_url}"

        puts "Creating new post: #{filename}"

        open(filename, 'w') do |post|

            post.puts "---"
            post.puts "title       : \"#{title.gsub(/&/,'&amp;')}\""
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

        system(options[:editor], filename)

    end

    ##
    # Open Server
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