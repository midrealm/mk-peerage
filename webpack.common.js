// Import external libraries
const path = require('path')
const webpack = require("webpack");
const ExtractTextPlugin = require("extract-text-webpack-plugin")
//const CSSOptions = {sourceMap: true } //defined in prod and dev configs

// Define our compiled asset files

module.exports = function(CSSOptions){
  return {
    // Remove this if you are not using Docker ?? Do I need this??? 
    watchOptions: {
      aggregateTimeout: 300,
      poll: 1000,
      ignored: /node_modules/
    },
  
    // Define our asset directory
    context: path.join(__dirname, '/app/assets'),
  
    // What js / CSS files should we read from and generate starting in context
    entry: {
      application: ['./javascripts/application.js', 
        './stylesheets/application.scss'
      ]
    },
  
    // Define where to save assets to
    output: {
      path: path.join(__dirname, '/public'),
      filename: 'javascripts/application.js' 
    },
    devtool: 'source-map',
    // Define how different file types should be transpiled
    module: {
      rules: [
        {
          test: /\.css$/,
          use: ExtractTextPlugin.extract({ 
            fallback: 'style-loader',
            use: [
              { loader: 'css-loader', options: CSSOptions } 
            ]
          })
        },
        {
          test: /\.(scss|sass)$/,
          use: ExtractTextPlugin.extract({ 
            fallback: 'style-loader',
            use: [
              { loader: 'css-loader', options: CSSOptions }, 
              { loader: 'sass-loader', options: CSSOptions }
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
      // Define where to save the CSS file
      new ExtractTextPlugin('stylesheets/application.css'),
    ],
  }
}
