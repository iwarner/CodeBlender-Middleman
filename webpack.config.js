/**
 * Webpack
 *
 * @see https://github.com/rossta/rossta.github.com
 */
const Webpack = require('webpack')
const Clean = require('clean-webpack-plugin')
const ExtractTextPlugin = require('extract-text-webpack-plugin')
const Path = require('path')

// Exports
module.exports = {

  context: __dirname,

  entry: {
    body: [
      Path.join(__dirname, '/source/assets/stylesheets/_all.css.scss'),
      Path.join(__dirname, '/source/assets/javascripts/_body.js.coffee')
    ]
  },

  resolve: {
    alias: {

      // Assets
      js: Path.join(__dirname, '/source/assets/javascripts'),
      lib: Path.join(__dirname, '/source/assets/javascripts/_lib'),
      css: Path.join(__dirname, '/source/assets/stylesheets'),

      // Partials
      local: Path.join(__dirname, '/source/partial/_lib'),
      atom: Path.join(__dirname, '/source/partial/_codeBlender/atom'),
      molecule: Path.join(__dirname, '/source/partial/_codeBlender/molecule'),
      organism: Path.join(__dirname, '/source/partial/_codeBlender/organism'),
      social: Path.join(__dirname, '/source/partial/_codeBlender/social'),
      source: Path.join(__dirname, '/source/modules'),
      template: Path.join(__dirname, '/source/partial/_codeBlender/template'),

      // Codeblender
      cbatom: Path.join(__dirname, '/source/atom'),
      cbfootball: Path.join(__dirname, '/source/football'),
      cbmolecule: Path.join(__dirname, '/source/molecule'),
      cborganism: Path.join(__dirname, '/source/organism'),
      cbsocial: Path.join(__dirname, '/source/social'),
      cbtemplate: Path.join(__dirname, '/source/template')

    }
  },

  output: {
    path: Path.join(__dirname, '/.tmp'),
    filename: 'assets/javascripts/[name].bundle.js'
  },

  module: {

    loaders: [

      // Coffee
      {
        test: /.*\.coffee$/,
        exclude: /node_modules|\.tmp|vendor|bower_components/,
        loader: 'coffee-loader'
      },

      // SCSS
      {
        test: /.*\.scss$/,
        loader: ExtractTextPlugin.extract({
          fallback: 'style-loader',
          use: 'css-loader!sass-loader'
        })
      },

      // Woff fonts
      {
        test: /\.woff2?(\?v=[0-9]\.[0-9]\.[0-9])?$/,
        // exclude : /node_modules|\.tmp|vendor|bower_components/,
        use: 'url-loader'
      },

      // TTF, EOT fonts and SVG
      {
        test: /\.(ttf|eot|svg)(\?[\s\S]+)?$/,
        // exclude : /node_modules|\.tmp|vendor|bower_components/,
        use: 'file-loader?name=/assets/fonts/[hash].[ext]'
      }
    ]
  },

  node: {
    console: true
  },

  plugins: [

    new Clean([ '.tmp' ]),

    new ExtractTextPlugin('assets/stylesheets/all.bundle.css'),

    new Webpack.ProvidePlugin({
      $: 'jquery',
      jQuery: 'jquery',
      'window.jQuery': 'jquery'
    })

  ]
}
