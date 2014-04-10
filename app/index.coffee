'use strict'
util = require('util')
path = require('path')
yeoman = require('yeoman-generator')
chalk = require('chalk')
fs = require('fs')


module.exports = FirepitGenerator = yeoman.generators.Base.extend

  init: ->
    @prompts = []


  askFor: ->
    done = @async()

    @log chalk.magenta("You're using the fantastic Firepit generator.")

    @prompts.push
      name: 'name'
      type: 'input'
      message: 'What is the name of your project?'
      default: 'Firepit'

    @prompt @prompts, ((props) ->
      @props = props
      done()
    ).bind(@)


  projectfiles: ->
    @template('_README.md', 'README.md')
    @template('_Gulpfile.js', 'Gulpfile.js')
    @template('_package.json', 'package.json')
    @template('_bower.json', 'bower.json')
    @directory('app/', 'app/')
    @template('_index.html', 'app/index.html')
    @copy('.gitignore', '.gitignore')
    @copy('Procfile', 'Procfile')
    @copy('start.js', 'start.js')
    @copy('postinstall.js', 'postinstall.js')
    @copy('app.coffee', 'app.coffee')

  dependencies: ->
    @.on 'end', ->
      @installDependencies
        callback: => @emit('dependenciesInstalled')

    @.on 'dependenciesInstalled', ->
      @log chalk.magenta("\n# Awesome. Everything generated just fine!\n\n\
        \t[Getting Started]\n\
        \t* Running the server:    npm start\n\
        \t* View in browser:       http://localhost:3002/")
