/**
 * Webpack
 *
 * @see https://github.com/rossta/rossta.github.com
 */
var webpack           = require( 'webpack' );
var clean             = require( 'clean-webpack-plugin' );
var ExtractTextPlugin = require( 'extract-text-webpack-plugin' );
// var path              = require( 'path' );
// var glob              = require( 'glob' );
// var PurifyCSSPlugin   = require( 'purifycss-webpack' );

// {
//   test: /\.scss$/,
//   loader: ExtractTextPlugin.extract('css!postcss!sass?precision=10'),
// }

module.exports = {

    context: __dirname,

    entry : {
        body : [
            // vendor : [ "jquery", "bootstrap-sass" ],
            __dirname + '/source/assets/stylesheets/_all.css.scss',
            __dirname + '/source/assets/javascripts/_body.js.coffee'
        ]
    },

    resolve : {
        alias : {

            // Assets
            js       : __dirname + '/source/assets/javascripts',
            lib      : __dirname + '/source/assets/javascripts/_lib',
            css      : __dirname + '/source/assets/stylesheets',

            // Partials
            local    : __dirname + '/source/partial/_lib',
            atom     : __dirname + '/source/partial/_codeBlender/atom',
            molecule : __dirname + '/source/partial/_codeBlender/molecule',
            organism : __dirname + '/source/partial/_codeBlender/organism',
            social   : __dirname + '/source/partial/_codeBlender/social',
            source   : __dirname + '/source/',
            template : __dirname + '/source/partial/_codeBlender/template',

            // Bower
            countdown : __dirname + '/bower_components/kbwood_countdown/dist/js',

            // Codeblender
            cbatom     : __dirname + '/source/atom',
            cbfootball : __dirname + '/source/football',
            cbmolecule : __dirname + '/source/molecule',
            cborganism : __dirname + '/source/organism',
            cbsocial   : __dirname + '/source/social',
            cbtemplate : __dirname + '/source/template'

        }
    },

    output: {
        path     : __dirname + '/.tmp',
        filename : 'assets/javascripts/[name].bundle.js'
    },

    module : {

        loaders : [

            // // Babel
            // {
            //     test    : /\.js$/,
            //     exclude : /(node_modules|bower_components)/,
            //     loader     : 'babel-loader',
            //     options   : {
            //         presets: [ 'es2015' ]
            //     }
            // },

            // Coffee
            {
                test    : /.*\.coffee$/,
                exclude : /node_modules|\.tmp|vendor|bower_components/,
                loader  : "coffee-loader"
            },

            // SCSS
            {
                test   : /.*\.scss$/,
                loader : ExtractTextPlugin.extract({
                    fallback : "style-loader",
                    use      : "css-loader!sass-loader"
                })
            },

            // // SWF
            // {
            //     test    : /\.swf$/,
            //     // exclude : /node_modules|\.tmp|vendor|bower_components/,
            //     loader  : "file-loader?name=assets/swf/[name].[ext]"
            // },

            // // Load vanilla CSS
            // {
            //     test    : /.*\.css$/,
            //     // exclude : /node_modules|\.tmp|vendor|bower_components/,
            //     use  : "style-loader!css-loader"
            // },

            // Woff fonts
            {
                test    : /\.woff2?(\?v=[0-9]\.[0-9]\.[0-9])?$/,
                // exclude : /node_modules|\.tmp|vendor|bower_components/,
                use  : 'url-loader'
            },

            // TTF, EOT fonts and SVG
            {
                test    : /\.(ttf|eot|svg)(\?[\s\S]+)?$/,
                // exclude : /node_modules|\.tmp|vendor|bower_components/,
                use  : 'file-loader?name=assets/fonts/[hash].[ext]'
            }
        ]
    },

    node : {
        console : true,
    },

    plugins : [

        new clean( [ '.tmp' ] ),

        // new webpack.optimize.CommonsChunkPlugin( {
        //     name      : "vendor",
        //     minChunks : Infinity,
        // }),

        new ExtractTextPlugin( 'assets/stylesheets/all.bundle.css' ),

        // new PurifyCSSPlugin ( {
        //     // Give paths to parse for rules. These should be absolute!
        //     paths : glob.sync( 'build/*.html' ),
        // }),

        new webpack.ProvidePlugin( {
            $               : "jquery",
            jQuery          : "jquery",
            "window.jQuery" : "jquery"
        } )

    ]
};
