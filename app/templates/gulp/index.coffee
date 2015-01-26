global.gulp    = require("gulp")
global.gutil   = require("gulp-util")
global.plumber = require("gulp-plumber")
runSequence    = require("run-sequence")

paths        = require("./paths")

assetsTask = require("./tasks/assets")
cleanTask  = require("./tasks/clean")
cssTask    = require("./tasks/css")
ejsTask    = require("./tasks/ejs")
jadeTask   = require("./tasks/jade")
jsTask     = require("./tasks/js")
serverTask = require("./tasks/server")
testTask   = require("./tasks/test")
watchTask  = require("./tasks/watch")

gulp.task "default", (callback) ->
  runSequence "clean", "css", "js", "assets", "ejs", "jade", callback
