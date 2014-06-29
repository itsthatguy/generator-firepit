
http    = require('http')
express = require('express')
path    = require('path')


app = express()
webserver = http.createServer(app)
basePath = path.join(__dirname)

app.engine('html', require('ejs').renderFile)

app.use('/assets', express.static(basePath + '/.generated/'))
app.use('/vendor', express.static(basePath + '/bower_components/'))

port = process.env.PORT || 3002
webserver.listen(port)

app.get '/', (req, res) -> res.render (basePath + "/.generated/index.html")
app.get /^\/(\w+)(?:\.)?(\w+)?/, (req, res) ->
  path = req.params[0]
  ext  = req.params[1] ? "html"
  res.render(basePath + "/.generated/#{path}.#{ext}")

module.exports = webserver
