##
# Project Thor file
# Provides specific tasks in the development life cycle of a middleman project
#
# @usage  $ thor list
# @author Ian Warner <ian.warner@drykiss.com>
# @see    http://whatisthor.com/
##
class Cordova < Thor

    ##
    # Variable
    ##
    @@phoneGapToken = ""
    @@phoneGapAppID = ""
    @@phoneGapUser  = ""
    @@phoneGapPass  = ""

    ##
    # Cordova emulate
    ##
    desc "emulate", "Cordova Build"
    def emulate

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
    # PhoneGap build via zip
    ##
    desc "package", "PhoneGap build Via Zip"
    def package

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
    # PhoneGap build remote
    # thor project:pgBuildRemote
    ##
    desc "deployRemote", "Create a PhoneGap Build Remote"
    def deployRemote

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
    desc "reset", "Reset PhoneGap"
    def reset

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

end