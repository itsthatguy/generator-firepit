path      = require('path')
fs        = require('fs')

mapper =
  buildTree: (filepath, obj) ->
    obj = obj || {}
    files = fs.readdirSync(filepath)
    for file in files
      target = filepath + '/' + file

      stats = fs.statSync(target)
      if (stats.isFile())
        obj[path.parse(file).name] = target
      else if (stats.isDirectory())
        obj[file] = {}
        this.buildTree(target, obj[file])

    return obj

  getPath: (filepath, tree) ->
    filepath = filepath.replace(/(^\/|\/$)/g, '')
    split = filepath.split(path.sep)

    map = tree
    map = map[item] for item in split

    if typeof map == 'object'
      map = map['index']

    return map

module.exports = mapper
