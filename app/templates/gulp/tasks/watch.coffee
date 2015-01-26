watch = require("gulp-watch")
paths = require("../paths")

# Watch
gulp.task "watch", ["default"], ->
  watch(paths.watch.css,    -> gulp.start("css"))
  watch(paths.watch.js,     -> gulp.start("js"))
  watch(paths.watch.assets, -> gulp.start("assets"))
  watch(paths.watch.ejs,    -> gulp.start("ejs"))
  watch(paths.watch.jade,   -> gulp.start("jade"))

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
      gulp.watch(path.join(paths.BASE_GENERATED_PATH, "**"))
        .on("error", gutil.log)
        .on("error", gutil.beep)
        .on("change", livereload.changed)
    return
