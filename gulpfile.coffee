require 'coffee-script/register'
gulp = require 'gulp'
mocha = require 'gulp-mocha'
watch = require 'gulp-watch'

path =
  test: './test/*.coffee'
  src: './src/**/*.coffee'

gulp.task 'test', ->
  gulp.src path.test
  .pipe mocha
    reporter: 'min'
    compilers: 'coffee:coffee-script/register'

gulp.task 'watch', ->
  gulp.watch [path.test, path.src], ['test']
