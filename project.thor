##
# Project Thor File
#
# @author Ian Warner <ian.warner@drykiss.com>
# @see    http://whatisthor.com/
##
class Project < Thor

    ##
    # Set-up
    ##
    desc "links", "links"
    def links

        system( "clear" )

        say( "\n\t Create Symlinks\n\t" )

        # CodeBlender Examples
        system( "rm -R source/localizable/codeblender" )
        system( "ln -s /var/www/Library/middleman/_library-codeblender source/localizable/codeblender")

        # JavaScript Library
        system( "rm -R source/assets/javascripts/_library-js")
        system( "ln -s /var/www/Library/middleman/_library-js source/assets/javascripts")

        # CSS Library
        system( "rm -R source/assets/stylesheets/_library-scss")
        system( "ln -s /var/www/Library/middleman/_library-scss source/assets/stylesheets/")

        # Font Library
        system( "rm -R source/assets/font")
        system( "ln -s /var/www/Library/middleman/_library-font source/assets/font")

        # Layouts Library
        system( "rm -R source/layouts/_library-layouts")
        system( "ln -s /var/www/Library/middleman/_library-layouts source/layouts")

        # Partials Library
        system( "rm -R source/partial/_library-partials")
        system( "ln -s /var/www/Library/middleman/_library-partials source/partial")

        # Helpers Library
        system( "rm -R helpers")
        system( "ln -s /var/www/Library/middleman/_library-helpers helpers")

        # Lib Library
        system( "rm -R lib")
        system( "ln -s /var/www/Library/middleman/_library-lib lib")

        # Humans.txt
        system( "rm source/humans.txt")
        system( "ln -s /var/www/Library/middleman/source/humans.txt source")

        # Robots.txt
        system( "rm source/robots.txt")
        system( "ln -s /var/www/Library/middleman/source/robots.txt source")

        # TODO.md
        system("rm todo.md")
        system("ln -s /var/www/Library/middleman/TODO.md .")

        # Gemfile
        system( "rm GEMFILE")
        system( "ln -s /var/www/Library/middleman/Gemfile .")

        say("\n")

    end

    ##
    # Middleman Build
    ##
    desc "build", "build"
    def build

        system("clear")

        say("\n\t Middleman Build Clean\n\t")
        system("bundle exec middleman build --clean")

        say("\n\t Middleman Deploy\n\t")
        system("bundle exec middleman deploy")

        say("\n")

    end

    ##
    # PhoneGap Build via Zip
    ##
    desc "pgBuildZip", "Create a PhoneGap Build Via Zip"
    def pgBuildZip

        system( "clear" )
        say( "\n\tCreating Project\n\t" )

        say( "\n\tRemove Build Folder\n\t" )
        system( "sudo rm -r www" )

        say( "\n\tMiddleman Build\n\t" )
        system( "bundle exec middleman build --clean" )

        # Remove Project.zip if one exists
        say( "\n\tRemoving project.zip file" )
        system( "rm project.zip" )

        # Create Project.zip - Exclude Files
        say( "\n\tCreating project.zip file\n\n" )
        system( "cd www && zip -r ../project.zip . -x '*.DS_Store' -x runner.html -x /spec/\*" )

        # Upload Project.zip
        say( "\n\tUploading File to Adobe PhoneGap Build" )
        system( "curl -X PUT -F file=@project.zip https://build.phonegap.com/api/v1/apps/695388?auth_token=S8sucJkHDvg3pP1EiQmp" )

    end

end