module.exports = {
  plugins: [
    require('postcss-font-magician'),
    require('postcss-preset-env')({stage: 1}),
    require('postcss-fail-on-warn'),
  ]
}
