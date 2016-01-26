// gulpfile.js

var gulp  = require( 'gulp' );       // core gulp
var uncss = require( 'gulp-uncss' ); // removes unused css
var csso  = require( 'gulp-csso' );  // minify css

gulp.task( 'uncss', function() {

    return gulp.src('www/assets/stylesheets/**/*.css')
        .pipe(uncss({html: ['www/**/*.html']}))
        .pipe(csso())
        .pipe(gulp.dest('./www/assets/stylesheets'))
});

// Scan site, remove unused css, minify css, gzip css
gulp.task( 'buildcss', [ 'uncss' ] );