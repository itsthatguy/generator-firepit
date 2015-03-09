nodemon = require("gulp-nodemon")

nodemonConfig = require(path.join(config.ROOT_PATH, 'nodemon.json'))
nodemonConfig.env.GULP = true

# Server
gulp.task 'server', ['watch'], -> nodemon(nodemonConfig)
