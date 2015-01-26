paths = require('../paths')
serverFile = path.join(paths.BASE_LIB_PATH, 'webserver')

coffee = require('coffee-script/register')
server = require(serverFile)

# Server
gulp.task 'server', ['watch'], -> server({port: 3002})
