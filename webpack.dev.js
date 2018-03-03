const merge = require('webpack-merge');
const CSSOptions = { sourceMap: true }
const common = require('./webpack.common.js');

module.exports = merge(common(CSSOptions), {
  devtool: 'cheap-source-map',
});
