##
# PhoneGap
# Specific task running for developing within the PhoneGap framework. Notable
# difference over Cordova is the use of the Phonegap build service.
#
# @usage  $ thor list
# @author Ian Warner <ian.warner@drykiss.com>
# @see    https://build.phonegap.com/
##
class Phonegap < Thor

    ##
    # Phonegap build variables
    ##
    @@phoneGapToken = ""
    @@phoneGapAppID = ""
    @@phoneGapUser  = ""
    @@phoneGapPass  = ""

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
        system( "phonegap remote login -u #{@@phoneUser} -p #{@@phonePass}" )

        # Build
        say( "\n\tBuild\n\n" )
        system( "phonegap remote build ios" )

    end

end