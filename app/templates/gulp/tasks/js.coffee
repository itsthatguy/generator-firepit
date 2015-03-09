browserify = require("browserify")
buffer     = require("vinyl-buffer")
rename     = require("gulp-rename")
source     = require("vinyl-source-stream")
sourcemaps = require("gulp-sourcemaps")
uglify     = require("gulp-uglify")

# Task
gulp.task "js", ->
  jsStream = browserify(config.js.src, {
    extensions: [".coffee"]
    debug: true
  }).transform("coffeeify")
    .bundle()

  # standard code
  jsStream
    .pipe(plumber())
    .pipe(source(config.js.src))
    .pipe(buffer())
    .pipe(sourcemaps.init({loadMaps: true}))
    .pipe(rename("app.js"))
    .pipe(sourcemaps.write("./"))
    .pipe(gulp.dest(config.js.dest))

  # minified code
  jsStream
    .pipe(plumber())
    .pipe(source(config.js.src))
    .pipe(buffer())
    .pipe(sourcemaps.init({loadMaps: true}))
    .pipe(uglify({ compress: { negate_iife: false }}))
    .pipe(rename("app.min.js"))
    .pipe(sourcemaps.write("./"))
    .pipe(gulp.dest(config.js.dest))

  return jsStream
