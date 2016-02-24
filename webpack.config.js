var webpack = require( 'webpack' );
var Clean   = require( 'clean-webpack-plugin' );

module.exports = {

    entry : {
        site : './source/javascripts/body.js'
    },

    resolve : {
        root : __dirname + '/source/javascripts',
    },

    output: {
        path     : __dirname + '/.tmp/dist',
        filename : 'javascripts/[ name ].js',
    },

    module : {
        loaders : [{
            test   : /\.coffee$/,
            loader : 'coffee-loader'
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
