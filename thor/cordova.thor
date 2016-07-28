##
# Cordova
# Specific task running for developing within the Cordova framework.
#
# @usage  $ thor list
# @author Ian Warner <ian.warner@drykiss.com>
# @see    https://cordova.apache.org/docs/en/latest/guide/cli/
##
class Cordova < Thor

    ##
    # Variable
    ##
    @@androidReleaseAlias = "CircusStreet"
    @@androidReleasePath  = "../platforms/android/build/outputs/apk/android-release-unsigned.apk"

    ##
    # Android application signing
    #
    # You'll first be prompted to create a password for the keystore.
    # Then, answer the rest of the questions, when it's done, you should have a
    # file called my-release-key.keystore created in the working directory.
    #
    # @todo check if Keystore file exists first
    ##
    desc "androidRelease", "Cordova Android release"
    def androidRelease

        # Clear
        system( "clear" )

        # Create a release version
        # Stored in platforms/android/build/outputs/apk/android-release-unsigned.apk
        say( "\n\t Android release\n\t" )
        system( "cordova build android --release" )

        # Keytool certificate generation
        # Do not lose this file as it will stop updates
        say( "\n\t Keytool certificate creation\n\t" )
        system( "keytool -genkey -v -keystore ../my-release-key.keystore -alias #{@@androidReleaseAlias} -keyalg RSA -keysize 2048 -validity 10000" )

        # Sign application
        say( "\n\t Sign application\n\t" )
        system( "jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore ../my-release-key.keystore #{@@androidReleasePath} #{@@androidReleaseAlias}" )

        # Align application
        say( "\n\t Align application\n\t" )
        system( "zipalign -v 4 #{@@androidReleasePath} #{@@androidReleaseAlias}.apk" )

    end

    ##
    # Cordova build
    ##
    desc "build", "Cordova Build"
    def build

        system( "clear" )

        # Middleman build
        say( "\n\t Middleman Build Clean\n\t" )
        system( "bundle exec middleman build --clean" )

        # Cordova build
        say( "\n\t Cordova Build\n\t" )
        system( "cordova build" )

        # Cordova Emulate iOS
        say( "\n\t Cordova Build\n\t" )
        system( "cordova emulate ios" )

    end

    ##
    # Cordova Reset
    ##
    desc "reset", "Cordova reset"
    def reset

        # Messages
        system( "clear" )
        say( "\n\t Cordova Reset\n\t" )

        # Remove platforms
        system( "cordova platform remove ios     --save" )
        system( "cordova platform remove android --save" )

    end

    ##
    # Cordova emulate IOS
    #
    # @todo Does Run auto build?
    # @todo Allow the choice of a platform - android or ios
    # @todo Allow emulation of certain device : cordova emulate ios --target="iPhone-6s"
    ##
    desc "emulateIos", "Cordova emulate iOS"
    def emulateIos

        # Messages
        system( "clear" )
        say( "\n\t Cordova build and emulate iOS\n\t" )

        # Middleman build
        system( "sudo bundle exec middleman build --clean" )

        # Delete some files
        system( "sudo rm -r www/spec" )
        system( "sudo rm -r www/runner.html" )
        system( "sudo rm -r www/plugins" )
        system( "sudo rm    www/phonegap.js" )
        system( "sudo rm    www/cordova.js" )
        system( "sudo rm    www/cordova_plugins.js" )

        # Cordova build and emulate
        system( "cordova build ios && cordova run ios --emulator" )

    end

end
