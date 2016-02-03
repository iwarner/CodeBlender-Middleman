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
gulp.task 'uncss', ->

    # Locate css and run commands
    gulp.src( 'www/assets/stylesheets/**/*.css' )
        .pipe( uncss( html: [ 'www/**/*.html' ] ) )
        .pipe( csso() )
        .pipe gulp.dest( './www/assets/stylesheets' )

# Scan site, remove unused css, minify css, gzip css
gulp.task 'uncss', [ 'uncss' ]

# // var gulp  = require( 'gulp' );       // core gulp
# // var uncss = require( 'gulp-uncss' ); // removes unused css
# // var csso  = require( 'gulp-csso' );  // minify css

# // gulp.task( 'uncss', function() {

# //     return gulp.src('www/assets/stylesheets/**/*.css')
# //         .pipe(uncss({html: ['www/**/*.html']}))
# //         .pipe(csso())
# //         .pipe(gulp.dest('./www/assets/stylesheets'))
# // });

# // // Scan site, remove unused css, minify css, gzip css
# // gulp.task( 'buildcss', [ 'uncss' ] );