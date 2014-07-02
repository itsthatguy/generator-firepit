
http    = require('http')
express = require('express')
path    = require('path')


app           = express()
webserver     = http.createServer(app)
basePath      = path.dirname(require.main.filename)
generatedPath = path.join(basePath, '.generated')
vendorPath    = path.join(basePath, 'bower_components')

app.engine('.html', require('ejs').__express)

app.use('/assets', express.static(generatedPath))
app.use('/vendor', express.static(vendorPath))

port = process.env.PORT || 3002
webserver.listen(port)

app.get '/', (req, res) -> res.render(generatedPath + '/index.html')
app.get /^\/(\w+)(?:\.)?(\w+)?/, (req, res) ->
  path = req.params[0]
  ext  = req.params[1] ? "html"
  res.render(generatedPath + "/#{path}.#{ext}")


module.exports = webserver
