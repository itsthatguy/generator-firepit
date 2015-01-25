ejs = require("gulp-ejs")
paths = require('../paths')

# EJS
gulp.task 'ejs', ->
  gulp.src(paths.input.ejs)
    .pipe(plumber())
    .pipe(ejs()
      .on('error', gutil.log)
      .on('error', gutil.beep))
    .pipe(gulp.dest(paths.output.ejs))
