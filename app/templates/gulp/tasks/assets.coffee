paths = require("../paths")

# Static Assets
gulp.task "assets", ->
  gulp.src(paths.input.assets, {base: paths.BASE_APP_PATH})
    .pipe(plumber())
    .pipe(gulp.dest(paths.output.assets))
