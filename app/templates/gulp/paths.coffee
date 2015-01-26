global.path = require("path")

paths = {}
paths.BASE_APP_PATH       = path.join(__dirname, '..', 'app')
paths.BASE_LIB_PATH       = path.join(__dirname, '..', 'lib')
paths.BASE_GENERATED_PATH = path.join(__dirname, '..', '.generated')

paths.input =
  css    : path.join(paths.BASE_APP_PATH, "css", "main.styl")
  js     :
    vendor : []
    src    : path.join(paths.BASE_APP_PATH, "js", "app.coffee")
  ejs    : path.join(paths.BASE_APP_PATH, "**", "*.ejs")
  jade   : path.join(paths.BASE_APP_PATH, "**", "*.jade")
  assets : [
    path.join(paths.BASE_APP_PATH, "img", "**", "*")
    path.join(paths.BASE_APP_PATH, "fonts", "**", "*")
    path.join(paths.BASE_APP_PATH, "**", "*.html")
  ]
  test   : []

paths.output =
  css    : path.join(paths.BASE_GENERATED_PATH, "css")
  js     : path.join(paths.BASE_GENERATED_PATH, "js")
  ejs    : paths.BASE_GENERATED_PATH
  jade   : paths.BASE_GENERATED_PATH
  assets : paths.BASE_GENERATED_PATH

paths.clean = path.join(paths.BASE_GENERATED_PATH, "**", "*")

paths.watch =
  css    : path.join(paths.BASE_APP_PATH, "css", "**", "*.styl*")
  js     : path.join(paths.BASE_APP_PATH, "js", "**", "*.coffee")
  ejs    : paths.input.ejs
  jade   : paths.input.jade
  assets : paths.input.assets

module.exports = paths
