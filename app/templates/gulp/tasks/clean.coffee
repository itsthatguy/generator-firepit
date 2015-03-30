del = require('del')

gulp.task 'clean', -> del.sync(config.clean)
