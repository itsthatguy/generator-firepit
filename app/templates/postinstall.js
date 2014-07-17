#!/usr/bin/env node
var runCommand = require('run-command'),
    dotenv     = require('dotenv');

runCommand("bower", ['install']);
runCommand("gulp");
