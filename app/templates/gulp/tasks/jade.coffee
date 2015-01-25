jade = require("gulp-jade")
paths = require('../paths')

# Jade
gulp.task "jade", ->
  gulp.src(paths.input.jade)
    .pipe(plumber())
    .pipe(jade(pretty: true))
    .pipe gulp.dest(paths.output.jade)
