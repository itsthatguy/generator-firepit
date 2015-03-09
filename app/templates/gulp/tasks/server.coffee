nodemon = require("gulp-nodemon")

cfg = require(path.join(config.ROOT_PATH, 'nodemon.json'))

cfg.env.GULP = true

# Server
gulp.task 'server', ['watch'], -> nodemon(cfg)
