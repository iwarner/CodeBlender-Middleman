# Middleman Thor file
# Provides specific tasks in the development life cycle of a middleman project
#
# @usage
# $ thor list
#
# Install as global
# $ thor install   codeblender.thor
# $ thor update    codeblender.thor
# $ thor uninstall codeblender.thor
#
# @author Ian Warner <ian.warner@drykiss.com>
# @see    http://whatisthor.com/

# Middleman thor
class CodeBlender < Thor

  # Middleman symbolic link set up
  # Use this on secondary projects to provide the code CodeBlender helpers
  # Do not run this on the codeblender project as it will remove the folders
  #
  # @usage
  # $ thor code_blender:symlink
  #
  # @todo Place the path into a global variable in this script
  # @todo Need to run a check to make sure this is not on the CodeBlender project
  # @todo Need to make sure the partial folder exists - otherwise it errors
  desc "symlink", "Symlink library elements into the project"
  def symlink

    # Clear
    system( "clear" )

    # Paths
    codeblender = "/Users/ianwarner/DryKISS/c/codeblender.io/archive/middleman-haml/CodeBlender-Middleman/"
    directory   = Dir.pwd
    layout      = Dir.pwd + "/source/layouts/"
    partial     = Dir.pwd + "/source/partial/"

    say( "\n\t Create symbolic link\n\t" )

    # Layout
    system( "rm -R                                  #{ layout }_codeBlender" )
    system( "ln -s #{ codeblender }source/layouts/  #{ layout }_codeBlender" )

    # Partial
    system( "rm -R                                  #{ partial }_codeBlender" )
    system( "mkdir -p                               #{ partial }_codeBlender" )
    system( "ln -sf #{ codeblender }source/atom     #{ partial }_codeBlender" )
    system( "ln -sf #{ codeblender }source/football #{ partial }_codeBlender" )
    system( "ln -sf #{ codeblender }source/meta     #{ partial }_codeBlender" )
    system( "ln -sf #{ codeblender }source/molecule #{ partial }_codeBlender" )
    system( "ln -sf #{ codeblender }source/organism #{ partial }_codeBlender" )
    system( "ln -sf #{ codeblender }source/social   #{ partial }_codeBlender" )
    system( "ln -sf #{ codeblender }source/template #{ partial }_codeBlender" )

    # Thor
    system( "rm -R #{ directory }/thor" )
    system( "ln -s #{ codeblender }thor/ #{ directory }/thor" )

    # Helper
    system( "rm -R #{ directory }/helpers" )
    system( "ln -s #{ codeblender }helpers/ #{ directory }/helpers" )

    # Git attributes
    system( "rm #{ directory }/.gitattributes" )
    system( "ln -s #{ codeblender }.gitattributes #{ directory }" )

    # Git ignore
    system( "rm #{ directory }/.gitignore" )
    system( "ln -s #{ codeblender }.gitignore #{ directory }" )

    # Gemfile
    system( "rm #{ directory }/Gemfile" )
    system( "ln -s #{ codeblender }Gemfile #{ directory }" )

    # Webpack
    # system( "rm #{ directory }/webpack.config.js" )
    # system( "ln -s #{ codeblender }webpack.config.js #{ directory }" )

  end

end
