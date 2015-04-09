nodemon = require("gulp-nodemon")
run     = require('run-command')
argv    = require('yargs')
  .help("h")
  .alias("h", "help")
  .usage('gulp server [option]')
  .option('p', {
    alias: ['production']
    describe: "Run the server in Production"
  })
  .option('d', {
    alias: ['dev', 'develop', 'development']
    describe: "Run the server in Development"
  }).argv

nodemonConfig = require(path.join(config.ROOT_PATH, 'nodemon.json'))
nodemonConfig.env.GULP = true

# Server
gulp.task 'server', ->
  # Development
  if argv.development
    console.log("=> Running the server in Development")
    return nodemon(nodemonConfig)
      .on('start', ['default', 'watch'])

  # Production
  else if argv.production
    console.log("=> Running the server in Production")
    return runSequence(['bower', 'default'], ->
      nodemon(nodemonConfig)
    )

  else
    console.log("=> Running the server, alone...")
    return nodemon(nodemonConfig)

