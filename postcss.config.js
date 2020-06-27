module.exports = {
  plugins: [
    require('postcss-import'),
    require('postcss-font-magician'),
    require('postcss-preset-env')({stage: 0}),
    require('postcss-fail-on-warn'),
  ]
}
