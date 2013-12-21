path = require 'path'
fs   = require 'fs'
less = require 'less'

module.exports = compiler =
  fromSource: (src, opts..., callback) ->
    opts       = opts[0] or {}
    parserOpts = {}
    toCssOpts  = {}

    parserOpts.filename = opts.filename or 'less-compiler'
    parserOpts.paths    = opts.paths or [path.dirname parserOpts.filename]

    # toCssOpts.writeSourceMap          = opts
    toCssOpts.cleancss                = opts.cleancss
    toCssOpts.compress                = opts.compress
    toCssOpts.ieCompat                = opts.ieCompat
    toCssOpts.maxLineLen              = opts.maxLineLen
    toCssOpts.outputSourceFiles       = opts.outputSourceFiles
    toCssOpts.silent                  = opts.silent
    toCssOpts.sourceMap               = opts.sourceMap
    toCssOpts.sourceMapBasepath       = opts.sourceMapBasepath
    toCssOpts.sourceMapFilename       = opts.sourceMapFilename
    toCssOpts.sourceMapOutputFilename = opts.sourceMapOutputFilename
    toCssOpts.sourceMapRootpath       = opts.sourceMapRootpath || ''
    toCssOpts.sourceMapURL            = opts.sourceMapURL
    toCssOpts.strictMath              = opts.strictMath
    toCssOpts.strictUnits             = opts.strictUnits
    toCssOpts.verbose                 = opts.verbose

    # optimization: options.optimization,
    # rootpath: options.rootpath,
    # relativeUrls: options.relativeUrls,
    # strictImports: options.strictImports,
    # dumpLineNumbers: options.dumpLineNumbers

    parser = new less.Parser parserOpts

    parser.parse src, (err, tree) ->
      css  = tree.toCSS toCssOpts
      callback err, css

  fromFile: (filepath, opts..., callback) ->
    opts          = opts[0] or {}
    opts.filename ?= filepath

    fs.readFile filepath, 'utf8', (err, src) ->
      return callback err if err?
      compiler.fromSource src, opts, callback
