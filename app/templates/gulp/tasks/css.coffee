minifycss  = require('gulp-minify-css')
rename     = require('gulp-rename')
sourcemaps = require('gulp-sourcemaps')
stylus     = require('gulp-stylus')

paths  = require('../paths')

# Stylus
# Get and render all .styl files recursively
gulp.task 'css', ->
  gulp.src(paths.input.css)
    .pipe(plumber())
    .pipe(sourcemaps.init({loadMaps: true}))
    .pipe(stylus()
      .on('error', gutil.log)
      .on('error', gutil.beep))
    .pipe(sourcemaps.write('./'))
    .pipe(gulp.dest(paths.output.css))

  return gulp.src(paths.input.css)
    .pipe(plumber())
    .pipe(sourcemaps.init({loadMaps: true}))
    .pipe(stylus()
      .on('error', gutil.log)
      .on('error', gutil.beep))
    .pipe(rename({suffix: '.min'}))
    .pipe(minifycss()
      .on('error', gutil.log)
      .on('error', gutil.beep))
    .pipe(sourcemaps.write('./'))
    .pipe(gulp.dest(paths.output.css))
