const merge = require('webpack-merge');
const UglifyJSPlugin = require('uglifyjs-webpack-plugin')
const CSSOptions = { sourceMap: true, minimize: true } 
const common = require('./webpack.common.js');

module.exports = merge(common(CSSOptions), {
  devtool: 'source-map',
  plugins: [
    new UglifyJSPlugin({ sourceMap: true })
  ]
});
