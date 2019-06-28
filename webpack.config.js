/**
 * Webpack
 *
 * @usage
 * ./node_modules/webpack/bin/webpack.js --progress --profile --json > stats.json
 *
 * @see https://github.com/rossta/rossta.github.com
 */
const Webpack = require('webpack')
const Clean = require('clean-webpack-plugin')
const ExtractTextPlugin = require('extract-text-webpack-plugin')
const Path = require('path')
const Fs = require('fs')

const extractSass = new ExtractTextPlugin({
  filename: 'assets/stylesheets/all.bundle.css',
  // disable: process.env.NODE_ENV === 'development',
  allChunks: true
})

// Exports
module.exports = {
  cache: true,

  entry: {
    body: [
      Path.join(__dirname, '/source/assets/javascripts/_body.js')
    ]
  },

  resolve: {
    alias: {
      // Assets
      js: Path.join(__dirname, '/source/assets/javascripts'),
      css: Path.join(__dirname, '/source/assets/stylesheets'),
      source: Path.join(__dirname, '/source/modules'),

      // Partials
      atom: Path.join(__dirname, '/source/partials/atom'),
      molecule: Path.join(__dirname, '/source/partials/molecule'),
      organism: Path.join(__dirname, '/source/partials/organism'),
      social: Path.join(__dirname, '/source/partials/social'),
      template: Path.join(__dirname, '/source/partials/template')
    }
  },

  output: {
    path: Path.join(__dirname, '/.tmp'),
    filename: 'assets/javascripts/[name].bundle.js'
  },

  module: {

    rules: [

      // Babel
      {
        test: /\.js$/,
        exclude: /(node_modules|bower_components)/,
        include: [
          Path.resolve(__dirname, 'source/modules/search')
        ],
        use: {
          loader: 'babel-loader',
          options: {
            presets: [
              ['env', {
                'targets': {
                  'browsers': ['last 2 versions']
                },
                'debug': false
              }]
            ]
          }
        }
      },

      // Coffee
      {
        test: /\.coffee$/,
        exclude: /(node_modules|bower_components)/,
        include: [
          Path.resolve(__dirname, 'source/assets/javascripts/_lib'),
          Path.resolve(__dirname, 'source/modules/admin'),
          Path.resolve(__dirname, 'source/modules/blog'),
          Path.resolve(__dirname, 'source/modules/corporate-competition'),
          Path.resolve(__dirname, 'source/modules/goldcard'),
          Path.resolve(__dirname, 'source/modules/heineken'),
          Path.resolve(__dirname, 'source/modules/olapic'),
          Path.resolve(__dirname, 'source/partials/atom'),
          Path.resolve(__dirname, 'source/partials/social')
        ],
        use: ['coffee-loader']
      },

      // SCSS
      // @see https://github.com/webpack-contrib/sass-loader
      // @see http://eng.localytics.com/faster-sass-builds-with-webpack/
      {
        test: /\.scss$/,
        exclude: /(node_modules|bower_components)/,
        include: [
          Path.resolve(__dirname, 'source/assets/stylesheets')
        ],
        use: extractSass.extract({
          use: [{
            loader: 'css-loader'
          },
          {
            loader: 'sass-loader'
          }],

          // use style-loader in development
          fallback: 'style-loader'
        })
      },

      // Fonts
      {
        test: /\.(eot|svg|ttf|woff|woff2)$/,
        exclude: /(bower_components)/,
        include: [
          Path.resolve(__dirname, 'node_modules/font-awesome/fonts')
        ],
        use: 'file-loader?name=/assets/fonts/[name].[ext]'
      }
    ]
  },

  plugins: [

    new Clean(['.tmp']),

    extractSass,

    new Webpack.ProvidePlugin({
      $: 'jquery',
      jQuery: 'jquery',
      'window.jQuery': 'jquery'
    })

  ]
}
