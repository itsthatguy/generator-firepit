gulp.task 'test', ->
  # Be sure to return the stream
  gulp.src(config.test.src)
    .pipe(plumber())
    .pipe(karma(
      configFile: 'karma.conf.js',
      action: 'run' ))
    .on 'error', (err) -> throw err
