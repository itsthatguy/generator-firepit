ejs = require("gulp-ejs")

# EJS
gulp.task 'ejs', ->
  gulp.src(config.ejs.src)
    .pipe(plumber())
    .pipe(ejs())
    .pipe(gulp.dest(config.ejs.dest))
