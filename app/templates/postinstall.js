var path = require('path');
var sys = require('sys');
var exec = require('child_process').exec;

function echo(error, stdout, stderr) {
  sys.puts(stdout);
}

basedir = path.join(__dirname, "node_modules", ".bin");
exec(path.join(basedir, "bower install"), echo);
exec(path.join(basedir, "gulp"), echo);
