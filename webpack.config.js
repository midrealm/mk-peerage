// Import external libraries
const path = require('path')
const webpack = require("webpack");
const ExtractTextPlugin = require("extract-text-webpack-plugin")

// Define our compiled asset files
const jsOutputTemplate = 'javascripts/application.js'

const extractCSS = new ExtractTextPlugin('stylesheets/application.css');

module.exports = {
  // Remove this if you are not using Docker
  watchOptions: {
    aggregateTimeout: 300,
    poll: 1000,
    ignored: /node_modules/
  },

  // Define our asset directory
  context: path.join(__dirname, '/app/assets'),

  // What js / CSS files should we read from and generate
  entry: {
    application: ['./javascripts/application.js', 
      './stylesheets/application.scss'
    ]
  },

  // Define where to save assets to
  output: {
    path: path.join(__dirname, '/public'),
    filename: jsOutputTemplate
  },
  devtool: 'source-map',
  // Define how different file types should be transpiled
  module: {
    rules: [
      {
        test: /\.css$/,
        use: extractCSS.extract({ 
          fallback: 'style-loader',
          use: [
            { loader: 'css-loader', options: { sourceMap: true } } 
          ]
        })
      },
      {
        test: /\.(scss|sass)$/,
        use: extractCSS.extract({ 
          fallback: 'style-loader',
          use: [
            { loader: 'css-loader', options: { sourceMap: true } }, 
            { loader: 'sass-loader', options: { sourceMap: true } }
          ]
        })
        
      },
    ], 
    loaders: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        loader: 'babel-loader',
        query: {
          presets: ['es2015']
        }
      },
    ]
  },
  plugins: [
    new webpack.ProvidePlugin({
      $: 'jquery',
      jQuery: 'jquery',
      'window.jQuery': 'jquery',
    }),
    extractCSS, // Define where to save the CSS file
  ],
}
