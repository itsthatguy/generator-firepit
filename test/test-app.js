/*global describe, beforeEach, it*/
'use strict';

var path    = require('path');
var assert  = require('yeoman-generator').assert;
var helpers = require('yeoman-generator').test;
var os      = require('os');

describe('firepit:app', function() {

  before(function (done) {
    helpers.run(path.join(__dirname, '../app'))
    .inDir(path.join(os.tmpdir(), './temp-test'))
    .withOptions({
      'bower': false,
      'skipInstall': true
     })
    .on('end', done);
  });

  it('creates dotfiles', function() {
    assert.file([
      '.env',
      '.gitignore'
    ]);
  });

  it('creates general files', function() {
    assert.file([
      'bower.json',
      'package.json',
      'README.md',
      'Procfile'
    ]);
  });

  it('creates lib/webserver.coffee file', function() {
    assert.file([
      'lib/webserver.coffee'
    ]);
  });

  it('creates app/ files', function() {
    assert.file([
      'app/index.html',
      'app/assets/js/app.coffee',
      'app/assets/css/main.styl',
      'app/favicon.ico'
    ]);
  });

  it('creates data/config.yaml file', function() {
    assert.file([
      'data/config.yaml'
    ]);
  });

  it('creates scripts/ files', function() {
    assert.file([
      'scripts/install_dependencies.sh',
      'scripts/start.coffee',
      'scripts/postinstall.coffee'
    ]);
  });

  it('creates gulp files', function() {
    assert.file([
      'Gulpfile.js',
      'gulp/index.coffee',
      'gulp/config.coffee',
      'gulp/tasks/assets.coffee',
      'gulp/tasks/clean.coffee',
      'gulp/tasks/stylus.coffee',
      'gulp/tasks/ejs.coffee',
      'gulp/tasks/jade.coffee',
      'gulp/tasks/js.coffee',
      'gulp/tasks/js-vendor.coffee',
      'gulp/tasks/server.coffee',
      'gulp/tasks/test.coffee',
      'gulp/tasks/watch.coffee'
    ]);
  });

});
