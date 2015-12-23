plumber = require 'gulp-plumber'
gulp = require 'gulp'
coffee = require 'gulp-coffee'
sass = require 'gulp-sass'
sourcemaps = require 'gulp-sourcemaps'
uglify = require 'gulp-uglify'
concat = require 'gulp-concat'

vendorJs = [
  'bower_components/jquery/dist/jquery.min.js',
  'bower_components/bootstrap-sass/assets/javascripts/bootstrap.min.js'
]

gulp.task 'sass', ->
  gulp.src './assets/**/*.scss'
    .pipe plumber()
    .pipe sass()
    .pipe gulp.dest './public'

gulp.task 'coffee', ->
  gulp.src './assets/**/*.coffee'
    .pipe plumber()
    .pipe sourcemaps.init()
    .pipe coffee
      bare: true
    .pipe uglify()
    .pipe concat 'js/main.js'
    .pipe sourcemaps.write('.')
    .pipe gulp.dest './public'

gulp.task 'vendor', ->
  gulp.src vendorJs
    .pipe plumber()
    .pipe sourcemaps.init()
    .pipe uglify()
    .pipe concat 'js/vendor.js'
    .pipe sourcemaps.write('.')
    .pipe gulp.dest './public'

gulp.task 'watch', ->
  gulp.watch './assets/**/*.scss', ['sass']
  gulp.watch './assets/**/*.coffee', ['js']

gulp.task 'default', ['watch', 'sass', 'coffee']
