global.gulp    = require("gulp")
global.gutil   = require("gulp-util")
global.plumber = require("gulp-plumber")
global.path    = require("path")
global.config  = require("./config")
runSequence    = require("run-sequence")

assetsTask   = require("./tasks/assets")
cleanTask    = require("./tasks/clean")
cssTask      = require("./tasks/css")
ejsTask      = require("./tasks/ejs")
jadeTask     = require("./tasks/jade")
jsTask       = require("./tasks/js")
jsVendorTask = require("./tasks/js-vendor")
serverTask   = require("./tasks/server")
testTask     = require("./tasks/test")
watchTask    = require("./tasks/watch")

gulp.task "default", (callback) ->
  runSequence "clean", "css", "js", "jsVendor", "assets", "ejs", "jade", callback
