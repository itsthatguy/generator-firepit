jade = require("gulp-jade")

# Jade
gulp.task "jade", ->
  gulp.src(config.jade.src)
    .pipe(plumber())
    .pipe(jade(pretty: true))
    .pipe gulp.dest(config.jade.dest)
