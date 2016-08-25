/**
 * Webpack
 */
var webpack           = require( 'webpack' );
var clean             = require( 'clean-webpack-plugin' );
var ExtractTextPlugin = require( 'extract-text-webpack-plugin' );
var path              = require( 'path' );
var bourbon           = require('node-bourbon').includePaths;

module.exports = {

    entry : {
        site : [
            'source/assets/javascripts/body.coffee',
            'source/assets/stylesheets/all.scss',
            'bootstrap-loader'
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
            {
                test   : /.*\.coffee$/,
                exclude: /node_modules|bower_components/,
                loader : "coffee-loader"
            },
            {
                test   : /.*\.scss$/,
                loader : ExtractTextPlugin.extract(
                    "style", "css!sass?includePaths[]=" + bourbon
                    // "style", "css!sass?sourceMap&includePaths[]=" + __dirname + "/node_modules"
                )
            },
            {
                // Load vanilla CSS
                test : /\.css$/, loader : "style!css"
            },
            {
                test   : /\.woff(2)?(\?v=[0-9]\.[0-9]\.[0-9])?$/,
                loader : "url-loader?limit=10000&mimetype=application/font-woff"
            },
            {
                test   : /\.(ttf|eot|svg)(\?v=[0-9]\.[0-9]\.[0-9])?$/,
                loader : "file-loader"
            }
        ]
    },


    node : {
        console : true,
    },

    plugins : [
        new clean( [ '.tmp' ] ),
        new ExtractTextPlugin( "assets/stylesheets/all.css" ),
        new webpack.ProvidePlugin( {
            $               : "jquery",
            jQuery          : "jquery",
            "window.jQuery" : "jquery"
        } )
    ]
};
