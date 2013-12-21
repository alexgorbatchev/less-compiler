# less-compiler

A handy [LESS](http://lesscss.org/) compiler from a series of compilers that have the same signature.

[![Dependency status](https://david-dm.org/alexgorbatchev/less-compiler.png)](https://david-dm.org/alexgorbatchev/less-compiler)
[![Build Status](https://travis-ci.org/alexgorbatchev/less-compiler.png)](https://travis-ci.org/alexgorbatchev/less-compiler)

## Support

Please help me spend more time developing and maintaining awesome modules like this by donating!

The absolute best thing to do is to sign up with [Gittip](http://gittip.com) if you haven't already and donate just $1 a week. That is roughly a cup of coffee per month. Also, please do donate to many other amazing open source projects!

[![Gittip](http://img.shields.io/gittip/alexgorbatchev.png)](https://www.gittip.com/alexgorbatchev/)
[![PayPayl donate button](http://img.shields.io/paypal/donate.png?color=yellow)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=PSDPM9268P8RW "Donate once-off to this project using Paypal")

## Installation

    npm install less-compiler

## Usage Example

    var less = require('less-compiler');

    var opts = {
      sourceMap: true
    };

    less.fromSource('.body{.h1{font-family:Arial}}', opts, function(err, css) {
      console.log(css);
    });

    less.fromFile('./main.less', opts, function(err, css) {
      console.log(css);
    });

## Testing

    npm test

## Other modules

* [jade-compiler](https://github.com/alexgorbatchev/jade-compiler)
* [stylus-compiler](https://github.com/alexgorbatchev/stylus-compiler)
* [coffee-compiler](https://github.com/alexgorbatchev/coffee-compiler)

## License

The MIT License (MIT)

Copyright (c) 2013-2014 Alex Gorbatchev

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
