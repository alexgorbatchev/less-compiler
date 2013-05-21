path = require 'path'
fs   = require 'fs'
less = require 'less'

module.exports = compiler =
  fromSource : (src, filename, debug, callback) ->
    parser = new less.Parser
      paths: [ path.dirname filename ],
      filename: filename,
      # optimization: options.optimization,
      # rootpath: options.rootpath,
      # relativeUrls: options.relativeUrls,
      # strictImports: options.strictImports,
      # dumpLineNumbers: options.dumpLineNumbers

    parser.parse src, (err, tree) ->
      css  = tree.toCSS compress: true
      callback err, css

  fromFile : (filepath, debug, callback) ->
    fs.readFile filepath, 'utf8', (err, src) ->
      return callback err if err?
      compiler.fromSource src, filepath, debug, callback
