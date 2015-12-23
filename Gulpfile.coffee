plumber = require 'gulp-plumber'
gulp = require 'gulp'
coffee = require 'gulp-coffee'
sass = require 'gulp-sass'
sourcemaps = require 'gulp-sourcemaps'
uglify = require 'gulp-uglify'
concat = require 'gulp-concat'
jade = require 'gulp-jade'
handlebars = require 'gulp-handlebars'

vendorJs = [
  'bower_components/jquery/dist/jquery.js',
  'bower_components/bootstrap-sass/assets/javascripts/bootstrap.js',
  'bower_components/handlebars/lib/handlebars.js'
]

gulp.task 'sass', ->
  gulp.src './assets/css/main.scss'
    .pipe plumber()
    .pipe sass()
    .pipe gulp.dest './public/css'

gulp.task 'coffee', ->
  gulp.src './assets/js/**/*.coffee'
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

gulp.task 'jade', ->
  gulp.src './assets/templates/**/*.jade'
    .pipe plumber()
    .pipe jade()
    .pipe handlebars()
    .pipe concat 'templates/all.js'
    .pipe gulp.dest './public'


gulp.task 'watch', ->
  gulp.watch './assets/css/**/*.scss', ['sass']
  gulp.watch './assets/js/**/*.coffee', ['coffee']
  gulp.watch './assets/templates/**/*.jade', ['jade']

gulp.task 'default', ['watch', 'sass', 'coffee', 'jade']
