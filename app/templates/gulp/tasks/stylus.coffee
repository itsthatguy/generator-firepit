minifycss  = require('gulp-minify-css')
rename     = require('gulp-rename')
sourcemaps = require('gulp-sourcemaps')
stylus     = require('gulp-stylus')

# Stylus
# Get and render all .styl files recursively
gulp.task 'stylus', ->
  gulp.src(config.stylus.src, {base: config.BASE_APP_PATH})
    .pipe(plumber())
    .pipe(sourcemaps.init({loadMaps: true}))
    .pipe(stylus())
    .pipe(sourcemaps.write('./'))
    .pipe(gulp.dest(config.stylus.dest))

  return gulp.src(config.stylus.src, {base: config.BASE_APP_PATH})
    .pipe(plumber())
    .pipe(sourcemaps.init({loadMaps: true}))
    .pipe(stylus())
    .pipe(rename({suffix: '.min'}))
    .pipe(minifycss())
    .pipe(sourcemaps.write('./'))
    .pipe(gulp.dest(config.stylus.dest))
