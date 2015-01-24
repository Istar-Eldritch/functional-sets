require 'coffee-script/register'
gulp = require 'gulp'
mocha = require 'gulp-mocha'

path =
  test: './test/*.coffee'

gulp.task 'test', ->
  gulp.src path.test
  .pipe mocha
    reporter: 'min'
    compilers: 'coffee:coffee-script/register'
