watch = require("gulp-watch")

# Watch
gulp.task "watch", ["default"], ->
  watch(config.css.watch,      -> gulp.start("css"))
  watch(config.js.watch,       -> gulp.start("js"))
  watch(config.jsVendor.watch, -> gulp.start("jsVendor"))
  watch(config.assets.watch,   -> gulp.start("assets"))
  watch(config.ejs.watch,      -> gulp.start("ejs"))
  watch(config.jade.watch,     -> gulp.start("jade"))

  setupLiveReload() if process.env.NODE_ENV == "development"

setupLiveReload = ->
  findPort   = require("find-port")
  livereload = require("gulp-livereload")

  server = livereload()

  findPort [35729], (ports) ->
    unless ports.length > 0
      gutil.log "[LiveReload] Can't start LiveReload => ALREADY RUNNING".red
    else
      server = livereload.listen(silent: true)
      if server
        msg = "[LiveReload] Now listening on port: " + server.port
        gutil.log msg.green
        livereload.changed()
      gulp.watch(path.join(config.BASE_GENERATED_PATH, "**"))
        .on("error", gutil.log)
        .on("error", gutil.beep)
        .on("change", livereload.changed)
    return
