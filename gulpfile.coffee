##
# Gulpfile
#
# @usage  gulp uncss
# @author Ian Warner <ian.warner@drykiss.com>
##

# Require gulp
gulp = require 'gulp'

# Core gulp
uncss = require 'gulp-uncss'

# Remove unused css
csso = require 'gulp-csso'

# Minify css
gulp.task 'buildCSS', ->

    # Locate css and run commands
    gulp.src( 'www/assets/stylesheets/**/*.css' )
        .pipe uncss( html : [ 'www/**/*.html' ], ignore : [ '/fa-/', '/ui-grid/' ] )
        .pipe csso()
        .pipe gulp.dest( './www/assets/stylesheets' )

# Scan site, remove unused css, minify css, gzip css
gulp.task 'uncss', [ 'uncss' ]
