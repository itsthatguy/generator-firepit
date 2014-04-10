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
    return this.prompt(this.prompts, (function(props) {
      this.props = props;
      return done();
    }).bind(this));
  },
  projectfiles: function() {
    this.template('_README.md', 'README.md');
    this.template('_Gulpfile.js', 'Gulpfile.js');
    this.template('_package.json', 'package.json');
    this.template('_bower.json', 'bower.json');
    this.directory('app/', 'app/');
    this.template('_index.html', 'app/index.html');
    this.copy('.gitignore', '.gitignore');
    this.copy('Procfile', 'Procfile');
    this.copy('start.js', 'start.js');
    this.copy('postinstall.js', 'postinstall.js');
    return this.copy('app.coffee', 'app.coffee');
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
      return this.log(chalk.magenta("\n# Awesome. Everything generated just fine!\n\n\t[Getting Started]\n\t* Running the server:    npm start\n\t* View in browser:       http://localhost:3002/"));
    });
  }
});
