gulp = require 'gulp'
coffee = require 'gulp-coffee'
sass = require 'gulp-sass'

gulp.task 'sass', ->
  gulp.src './assets/**/*.scss'
    .pipe sass().on('error', sass.logError)
    .pipe gulp.dest './public'

gulp.task 'coffee', ->
  gulp.src './assets/**/*.coffee'
    .pipe coffee()
    .pipe gulp.dest './public'

gulp.task 'watch', ->
  gulp.watch './assets/**/*.scss', ['sass']
  gulp.watch './assets/**/*.coffee', ['coffee']

gulp.task 'default', ['watch', 'sass', 'coffee']
