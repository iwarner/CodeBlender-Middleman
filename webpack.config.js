/**
 * Webpack
 *
 * @see https://github.com/rossta/rossta.github.com
 */
var webpack           = require( 'webpack' );
var clean             = require( 'clean-webpack-plugin' );
var ExtractTextPlugin = require( 'extract-text-webpack-plugin' );

// {
//   test: /\.scss$/,
//   loader: ExtractTextPlugin.extract('css!postcss!sass?precision=10'),
// }

module.exports = {

    entry : {
        body : [
            'source/assets/stylesheets/_all.css.scss',
            'source/assets/javascripts/_body.js.coffee'
        ]
    },

    resolve : {
        root  : __dirname,
        alias : {
            js       : 'source/assets/javascripts',
            lib      : 'source/assets/javascripts/_lib',
            css      : 'source/assets/stylesheets',
            atom     : 'source/atom',
            football : 'source/football',
            molecule : 'source/molecule',
            organism : 'source/organism',
            social   : 'source/social',
            template : 'source/template',
        }
    },

    output: {
        path     : __dirname + '/.tmp',
        filename : 'assets/javascripts/[name].bundle.js'
    },

    module : {

        loaders : [

            // Coffee
            {
                test    : /.*\.coffee$/,
                exclude : /node_modules|bower_components/,
                loader  : "coffee-loader"
            },

            // SCSS
            {
                test   : /.*\.scss$/,
                loader : ExtractTextPlugin.extract(
                    "style", "css!sass"
                )
            },

            // SWF
            {
                test   : /\.swf$/,
                loader : "file-loader?name=assets/swf/[name].[ext]"
            },

            // Load vanilla CSS
            {
                test   : /.*\.css$/,
                loader : "style!css"
            },

            // Woff fonts
            {
                test   : /\.woff2?(\?v=[0-9]\.[0-9]\.[0-9])?$/,
                loader : 'url-loader'
            },

            // TTF, EOT fonts and SVG
            {
                test   : /\.(ttf|eot|svg)(\?[\s\S]+)?$/,
                loader : 'file-loader?name=assets/fonts/[hash].[ext]'
            }

        ]
    },

    sassLoader : {
        indentedSyntax : true,
        precision      : 8,
    },

    scssLoader : {
        indentedSyntax : false,
        precision      : 8,
    },

    node : {
        console : true,
    },

    plugins : [

        new clean( [ '.tmp' ] ),

        new ExtractTextPlugin( 'assets/stylesheets/all.bundle.css' ),

        new webpack.ProvidePlugin( {
            $               : "jquery",
            jQuery          : "jquery",
            "window.jQuery" : "jquery"
        } )

    ]
};
