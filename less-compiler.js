// Generated by CoffeeScript 1.6.3
var compiler, fs, less, path,
  __slice = [].slice;

path = require('path');

fs = require('fs');

less = require('less');

module.exports = compiler = {
  fromSource: function() {
    var callback, opts, parser, parserOpts, src, toCssOpts, _i;
    src = arguments[0], opts = 3 <= arguments.length ? __slice.call(arguments, 1, _i = arguments.length - 1) : (_i = 1, []), callback = arguments[_i++];
    opts = opts[0] || {};
    parserOpts = {};
    toCssOpts = {};
    parserOpts.filename = opts.filename || 'less-compiler';
    parserOpts.paths = opts.paths || [path.dirname(parserOpts.filename)];
    toCssOpts.cleancss = opts.cleancss;
    toCssOpts.compress = opts.compress;
    toCssOpts.ieCompat = opts.ieCompat;
    toCssOpts.maxLineLen = opts.maxLineLen;
    toCssOpts.outputSourceFiles = opts.outputSourceFiles;
    toCssOpts.silent = opts.silent;
    toCssOpts.sourceMap = opts.sourceMap;
    toCssOpts.sourceMapBasepath = opts.sourceMapBasepath;
    toCssOpts.sourceMapFilename = opts.sourceMapFilename;
    toCssOpts.sourceMapOutputFilename = opts.sourceMapOutputFilename;
    toCssOpts.sourceMapRootpath = opts.sourceMapRootpath || '';
    toCssOpts.sourceMapURL = opts.sourceMapURL;
    toCssOpts.strictMath = opts.strictMath;
    toCssOpts.strictUnits = opts.strictUnits;
    toCssOpts.verbose = opts.verbose;
    parser = new less.Parser(parserOpts);
    return parser.parse(src, function(err, tree) {
      var css;
      css = tree.toCSS(toCssOpts);
      return callback(err, css);
    });
  },
  fromFile: function() {
    var callback, filepath, opts, _i;
    filepath = arguments[0], opts = 3 <= arguments.length ? __slice.call(arguments, 1, _i = arguments.length - 1) : (_i = 1, []), callback = arguments[_i++];
    opts = opts[0] || {};
    if (opts.filepath == null) {
      opts.filepath = filepath;
    }
    return fs.readFile(filepath, 'utf8', function(err, src) {
      if (err != null) {
        return callback(err);
      }
      return compiler.fromSource(src, opts, callback);
    });
  }
};
