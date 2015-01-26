chai = require 'chai'
should = chai.should()
expect = chai.expect
Set = require '../src/Set'

describe 'Default Sets', ->

  describe 'EMPTY', ->

    it 'should exit', ->
      should.exist(Set.EMPTY)

    it 'should not contain anything', ->
      Set.EMPTY.match(0).should.not.be.ok
      Set.EMPTY.match('a').should.not.be.ok
      Set.EMPTY.match(22345).should.not.be.ok

  describe 'UNIVERSE', ->

    it 'should exist', ->
      should.exist(Set.UNIVERSE)

    it 'should contain everything', ->
      Set.UNIVERSE.match(0).should.be.ok
      Set.UNIVERSE.match('a').should.be.ok
      Set.UNIVERSE.match(22345).should.be.ok

  describe 'N', ->

    it 'should exist', ->
      should.exist Set.N

    it 'should be a number', ->
      Set.N.match('n').should.not.be.ok
      Set.N.match('0.5').should.not.be.ok

    it 'should contain positive integers', ->
      Set.N.match(0).should.be.ok
      Set.N.match(43452345234532).should.be.ok

    it 'should not contain decimals', ->
      Set.N.match(2.4).should.not.be.ok

    it 'should not contain negative', ->
      Set.N.match(-1).should.not.be.ok

  describe 'Z', ->

    it 'should exist', ->
      should.exist Set.Z

    it 'should be a number', ->
      Set.Z.match('n').should.not.be.ok
      Set.Z.match('0.5').should.not.be.ok

    it 'should contain integers', ->
      Set.Z.match(0).should.be.ok
      Set.Z.match(43452345234532).should.be.ok
      Set.Z.match(-23452345234).should.be.ok

    it 'should not contain decimals', ->
      Set.Z.match(2.4).should.not.be.ok
