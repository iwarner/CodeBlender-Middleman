/**
 * Webpack
 */
var webpack           = require( 'webpack' );
var clean             = require( 'clean-webpack-plugin' );
var ExtractTextPlugin = require( 'extract-text-webpack-plugin' );
var path              = require( 'path' );
// var bourbon           = require('node-bourbon').includePaths;

module.exports = {

    entry : {
        site : [
            // 'font-awesome-loader',
            // 'bootstrap-loader',
            'source/assets/stylesheets/all.css.scss',
            'source/assets/javascripts/body.js.coffee'
        ]
    },

    resolve : {
        root  : path.resolve( __dirname ),
        alias : {
            js       : 'source/assets/javascripts',
            lib      : 'source/assets/javascripts/_lib',
            css      : 'source/assets/stylesheets',
            atom     : 'source/atom',
            molecule : 'source/molecule',
            organism : 'source/organism',
            social   : 'source/social',
            template : 'source/template',
        }
    },

    output: {
        path     : __dirname + '/.tmp/dist',
        filename : 'assets/javascripts/body.js'
    },

    module : {

        loaders : [

            // Coffee
            {
                test   : /.*\.coffee$/,
                exclude: /node_modules|bower_components/,
                loader : "coffee-loader"
            },

            // SCSS
            {
                test   : /.*\.scss$/,
                loader : ExtractTextPlugin.extract(
                    "style", "css!sass"
                )
            },

            // Load vanilla CSS
            {
                test   : /.*\.css$/,
                loader : "style!css"
            },

            // Woff fonts
            {
                test   : /\.woff2?(\?v=[0-9]\.[0-9]\.[0-9])?$/,
                loader : 'url-loader',
            },

            // TTF, EOT fonts and SVG
            {
                test   : /\.(ttf|eot|svg)(\?[\s\S]+)?$/,
                loader : 'file-loader',
            }

        ]
    },


    node : {
        console : true,
    },

    plugins : [

        new clean( [ '.tmp' ] ),

        new ExtractTextPlugin( 'assets/stylesheets/all.css' ),

        new webpack.ProvidePlugin( {
            $               : "jquery",
            jQuery          : "jquery",
            "window.jQuery" : "jquery"
        } )

    ]
};
