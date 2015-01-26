paths = require('../paths')

gulp.task 'test', ->
  # Be sure to return the stream
  gulp.src(paths.input.test)
    .pipe(plumber())
    .pipe(karma(
      configFile: 'karma.conf.js',
      action: 'run' ))
    .on 'error', (err) -> throw err
