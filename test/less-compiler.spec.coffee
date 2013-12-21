chai    = require 'chai'
fibrous = require 'fibrous'

# explicitly use compiled version
less   = require '../less-compiler.js'
expect = chai.expect

SOURCE = """
.body {
  h1 {
    font-family: Arial;
  }
}
"""

describe 'less-compiler', ->
  describe '::fromSource', ->
    it 'compiles from source', fibrous ->
      expect(less.sync.fromSource SOURCE).to.be.ok

    it 'compiles with source maps', fibrous ->
      actual = less.sync.fromSource SOURCE, sourceMap: yes
      expect(actual.indexOf '*# sourceMappingURL=').to.be.above -1

  describe '::fromFile', ->
    it 'compiles from file', fibrous ->
      expect(less.sync.fromFile "#{__dirname}/fixture.less").to.be.ok

    it 'compiles from file with source maps', fibrous ->
      actual = less.sync.fromFile "#{__dirname}/fixture.less", sourceMap: yes
      expect(actual.indexOf '*# sourceMappingURL=').to.be.above -1
