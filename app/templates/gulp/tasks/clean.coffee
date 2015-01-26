del = require('del')
paths = require('../paths')

gulp.task 'clean', -> del(paths.clean)
