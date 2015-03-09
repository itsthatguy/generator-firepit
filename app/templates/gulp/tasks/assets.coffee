# Static Assets
gulp.task "assets", ->
  gulp.src(config.assets.src, {base: config.BASE_APP_PATH})
    .pipe(plumber())
    .pipe(gulp.dest(config.assets.dest))
