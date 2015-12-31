gulp       = require 'gulp'
plumber    = require 'gulp-plumber'
coffee     = require 'gulp-coffee'
sass       = require 'gulp-sass'
sourcemaps = require 'gulp-sourcemaps'
uglify     = require 'gulp-uglify'
concat     = require 'gulp-concat'
jade       = require 'gulp-jade'
handlebars = require 'gulp-handlebars'
wrap = require 'gulp-wrap'
declare = require 'gulp-declare'

vendorJs = [
  'bower_components/jquery/dist/jquery.min.js',
  'bower_components/bootstrap-sass/assets/javascripts/bootstrap.min.js',
  'bower_components/handlebars/handlebars.runtime.min.js'
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
    .pipe sourcemaps.init
      loadMaps: true
    .pipe concat 'js/vendor.js'
    .pipe sourcemaps.write('.')
    .pipe gulp.dest './public'

gulp.task 'jade', ->
  gulp.src './assets/templates/**/*.jade'
    .pipe plumber()
    .pipe jade()
    .pipe handlebars
      handlebars: require("handlebars")
    .pipe wrap("Handlebars.template(<%= contents %>)")
    .pipe declare
      namespace: "FS.templates"
      noRedeclare: true
    .pipe concat "js/templates.js"
    .pipe gulp.dest './public'

gulp.task 'watch', ->
  gulp.watch './assets/css/**/*.scss', ['sass']
  gulp.watch './assets/js/**/*.coffee', ['coffee']
  gulp.watch './assets/templates/**/*.jade', ['jade']

gulp.task 'default', ['watch', 'sass', 'coffee', 'jade']
