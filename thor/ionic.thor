##
# Ionic Thor file
# Provides specific tasks in the development life cycle of a middleman project
#
# @usage  $ thor list
# @author Ian Warner <ian.warner@drykiss.com>
# @see    http://whatisthor.com/
##
class Ionic < Thor

    ##
    # Middleman build and Ionic deploy
    # - First, zip up the contents of your www directory.
    # - Then check to see if you have already hooked your app up to the Ionic.io platform.
    # - If we didn't find an existing app id, we generate a new app id / api key for you.
    # - We then create a new "version" of your app code with a unique identifier
    # and some meta-data like the note you provided.
    #
    # @todo Increment the version number if deployed
    ##
    desc "deploy", "Middleman Build and Deploy"
    def deploy

        # Increment Version

        # Middleman build
        say( "\n\t Middleman build\n\t" )
        system( "clear && bundle exec middleman build --clean" )

        # Ionic deploy
        say( "\n\t Ionic deploy\n\t" )
        system( "ionic upload --note 'Some details about this upload'" )
        #  ionic upload --note "new version" --deploy=production

    end

end