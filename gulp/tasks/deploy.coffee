gulp   = require 'gulp'
deploy = require 'gulp-gh-pages'

module.exports = ->
  gulp.src('./dist/**/*')
  .pipe deploy()

