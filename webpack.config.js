var webpack = require( 'webpack' );
var Clean   = require( 'clean-webpack-plugin' );

module.exports = {

    entry : {
        site : './source/javascripts/body.coffee'
    },

    resolve : {
        root : __dirname + '/source/javascripts',
    },

    output: {
        path     : __dirname + '/.tmp/dist',
        filename : 'javascripts/body.js',
    },

    module : {
        loaders : [{
            test   : /source\/javascripts\/.*\.coffee$/,
            exclude: /node_modules|\.tmp|vendor/,
            loader : "coffee-loader"
        },
        {
            test   : /\.scss$/,
            loaders : ["style", "css", "sass"]
        }]
    },

    node : {
        console : true,
    },

    plugins : [
        new Clean( [ '.tmp' ] ),
            new webpack.ProvidePlugin( {
                $               : "jquery",
                jQuery          : "jquery",
                "window.jQuery" : "jquery"
            } )
    ]
};
