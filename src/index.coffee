'use strict'
util   = require('util')
path   = require('path')
yeoman = require('yeoman-generator')
chalk  = require('chalk')
fs     = require('fs')

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
      default: path.basename(process.cwd())

    @prompts.push
      name: 'packages'
      type: 'checkbox'
      message: 'Select starter packages?'
      choices: [
        "jquery"
        "handlebars"
        "ember"
      ]
      default: ["jquery"]
      filter: (input) ->

        dependencies =
          "ember": "handlebars"

        foundKey = {}
        foundValue = {}
        for choice, i in input
          foundKey[choice] = dependencies[choice]?
          foundValue[choice] = dependencies[choice] != choice

        for key, value of dependencies
          if foundKey[key] and not foundValue[value]
            input.push value
        return input


    @prompt @prompts, ((props) ->
      @props = props
      done()
    ).bind(@)


  projectfiles: ->
    @packagesPaths = {
      "jquery"     : "/jquery/dist/jquery.min.js"
      "ember"      : "/ember/ember.js"
      "handlebars" : "/handlebars/handlebars.js"
    }

    bowerPackageList = {
      "ember": '"ember": "~1.5.0"'
      "jquery": '"jquery": "~2.1.0"'
      "handlebars": '"handlebars": "~1.3.0"'
    }

    @bowerPackages = ""

    for key, value of @props.packages
      comma = if (parseInt(key) == @props.packages.length-1) then '' else ',\n    '
      @bowerPackages += bowerPackageList[value] + comma

    # Root App files
    @template('_README.md', 'README.md')
    @template('_Gulpfile.js', 'Gulpfile.js')
    @template('_Gulpfile.coffee', 'Gulpfile.coffee')
    @template('_package.json', 'package.json')
    @template('_bower.json', 'bower.json')
    @copy('_.gitignore', '.gitignore')
    @copy('_.env', '.env')
    @copy('Procfile', 'Procfile')
    @copy('start.coffee', 'start.coffee')
    @copy('nodemon.json', 'nodemon.json')
    @mkdir('data/')
    @copy('data/config.yaml', 'data/config.yaml')
    @mkdir('lib/')
    @copy('app.coffee', 'app.coffee')
    @copy('lib/webserver.coffee', 'lib/webserver.coffee')
    @copy('editorconfig', '.editorconfig')
    @copy('jshintrc', '.jshintrc')

    # Front-end app files
    @mkdir('app/')
    @mkdir('app/css/')
    @mkdir('app/js/')
    @mkdir('app/img/')
    @mkdir('app/fonts/')
    @copy('app/favicon.ico', 'app/favicon.ico')
    @template('app/_index.html', 'app/index.html')
    @template('app/css/_main.styl', 'app/css/main.styl')
    @template('app/js/_app.coffee', 'app/js/app.coffee')

  end: ->
    @options['callback'] = => @emit('dependenciesInstalled')
    @installDependencies(@options)

    @.on 'dependenciesInstalled', ->
      @log chalk.green("\n# Awesome. Everything generated just fine!\n\n\
        \t[Getting Started]\n\
        \t* Running the server:    npm start\n\
        \t* View in browser:       http://localhost:3002/")
