'use strict';
var FirepitGenerator, chalk, fs, path, util, yeoman;

util = require('util');

path = require('path');

yeoman = require('yeoman-generator');

chalk = require('chalk');

fs = require('fs');

module.exports = FirepitGenerator = yeoman.generators.Base.extend({
  init: function() {
    return this.prompts = [];
  },
  askFor: function() {
    var done;
    done = this.async();
    this.log(chalk.magenta("You're using the fantastic Firepit generator."));
    this.prompts.push({
      name: 'name',
      type: 'input',
      message: 'What is the name of your project?',
      "default": 'Firepit'
    });
    this.prompts.push({
      name: 'packages',
      type: 'checkbox',
      message: 'Select starter packages?',
      choices: ["jquery", "ember", "handlebars"],
      "default": ["jquery"],
      filter: function(input) {
        var choice, dependencies, foundKey, foundValue, i, key, value, _i, _len;
        dependencies = {
          "ember": "handlebars"
        };
        foundKey = {};
        foundValue = {};
        for (i = _i = 0, _len = input.length; _i < _len; i = ++_i) {
          choice = input[i];
          foundKey[choice] = dependencies[choice] != null;
          foundValue[choice] = dependencies[choice] !== choice;
        }
        for (key in dependencies) {
          value = dependencies[key];
          if (foundKey[key] && !foundValue[value]) {
            input.push(value);
          }
        }
        return input;
      }
    });
    return this.prompt(this.prompts, (function(props) {
      this.props = props;
      return done();
    }).bind(this));
  },
  checkDependencies: function(obj, deps) {},
  projectfiles: function() {
    var bowerPackageList, comma, key, value, _ref;
    this.packagesPaths = {
      "jquery": "/jquery/dist/jquery.min.js",
      "ember": "/ember/ember.js",
      "handlebars": "/handlebars/handlebars.js"
    };
    bowerPackageList = {
      "ember": '"ember": "~1.5.0"',
      "jquery": '"jquery": "~2.1.0"',
      "handlebars": '"handlebars": "~1.3.0"'
    };
    this.bowerPackages = "";
    _ref = this.props.packages;
    for (key in _ref) {
      value = _ref[key];
      comma = parseInt(key) === this.props.packages.length - 1 ? '' : ',\n    ';
      this.bowerPackages += bowerPackageList[value] + comma;
    }
    this.template('_README.md', 'README.md');
    this.template('_Gulpfile.js', 'Gulpfile.js');
    this.template('_package.json', 'package.json');
    this.template('_bower.json', 'bower.json');
    this.copy('.gitignore', '.gitignore');
    this.copy('Procfile', 'Procfile');
    this.copy('start.js', 'start.js');
    this.copy('nodemon.js', 'nodemon.js');
    this.copy('postinstall.js', 'postinstall.js');
    this.copy('app.coffee', 'app.coffee');
    this.mkdir('app/');
    this.mkdir('app/css/');
    this.mkdir('app/js/');
    this.mkdir('app/img/');
    this.mkdir('app/fonts/');
    this.template('app/_index.html', 'app/index.html');
    this.template('app/css/_main.styl', 'app/css/main.styl');
    return this.template('app/js/_app.coffee', 'app/js/app.coffee');
  },
  dependencies: function() {
    this.on('end', function() {
      return this.installDependencies({
        callback: (function(_this) {
          return function() {
            return _this.emit('dependenciesInstalled');
          };
        })(this)
      });
    });
    return this.on('dependenciesInstalled', function() {
      return this.log(chalk.green("\n# Awesome. Everything generated just fine!\n\n\t[Getting Started]\n\t* Running the server:    npm start\n\t* View in browser:       http://localhost:3002/"));
    });
  }
});
