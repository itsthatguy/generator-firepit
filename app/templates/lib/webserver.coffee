http      = require('http')
express   = require('express')
path      = require('path')
favicon   = require('serve-favicon')
findPort  = require('find-port')
colors    = require('colors')
basicAuth = require('basic-auth-connect')
fs        = require('fs')
yaml      = require('js-yaml')
argv      = require('yargs').argv
mapper    = require('./mapper')

# Function to load files from our data folder
getDataFile = (file) ->
  try
    filepath = path.join(basePath, 'data', file)
    doc = yaml.safeLoad(fs.readFileSync(filepath, 'utf8')) or {}
  catch err
    console.log(err)

app           = express()
webserver     = http.createServer(app)
basePath      = path.join(__dirname, '..')
generatedPath = path.join(basePath, '.generated')
assetsPath    = path.join(generatedPath, 'assets')
vendorPath    = path.join(basePath, 'bower_components')
faviconPath   = path.join(basePath, 'app', 'favicon.ico')

# Build our map of files
filetree = mapper.buildTree(generatedPath)

# Get our data file
config       = getDataFile('config.yaml')

# Use Basic Auth?
if config.username? || config.password?
  app.use(basicAuth(config.username, config.password)) if process.env.DYNO?


defaults =
  host: 'http://localhost'
  port: 3002

server = (options = {}) ->
  port = process.env.PORT || 3002
  port = argv.port || options.port || process.env.PORT || defaults.port
  host = argv.host || options.host || process.env.HOST || defaults.host

  env = process.env.NODE_ENV

  # Find an available port
  if port > 3002
    webserver.listen(port)
  else
    findPort port, port + 100, (ports) ->
      webserver.listen(ports[0])

  # Notify the console that we're connected and on what port
  webserver.on 'listening', ->
    address = webserver.address()
    console.log "[Firepit] Server running at http://#{address.address}:#{address.port}".green


  # Configure the express server
  app.engine('html', require('hbs').__express)
  app.set('view engine', 'html')
  app.use(favicon(faviconPath))
  app.use('/assets', express.static(assetsPath))
  app.use('/vendor', express.static(vendorPath))

  # Routes
  app.get '/', (req, res) ->
    res.render(generatedPath + '/index.html', {data: config})

  app.get '*', (req, res) ->
    filepath = mapper.getPath(req.originalUrl, filetree)

    res.render(filepath)

# Start the server if run from CLI with the --start flag
# or if started from `gulp server`
if argv.start || process.env.GULP
  console.log "Ye want to start the server, eh?!"
  server()

module.exports = server
