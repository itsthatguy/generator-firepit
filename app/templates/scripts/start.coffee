run    = require('run-command')
dotenv = require('dotenv').load()

env = process.env.NODE_ENV || "production"

console.log("[NODE_ENV] " + env)

if env == "production"
  run "bower install", ->
    run "gulp", ->
      run "coffee lib/webserver.coffee --start"
else if env == "development"
  run "gulp server"
else
  console.log "I have no idea what environment this is..."
