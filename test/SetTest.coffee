chai = require 'chai'
should = chai.should()
expect = chai.expect
Set = require '../src/Set'

describe 'Set', ->

  describe 'empty set', ->
    set = new Set()

    it 'should not have any member', ->
      set.match(1).should.not.be.ok

  describe 'single element', ->
    set = new Set(1)

    it 'should have 1 as member', ->
      set.match(1).should.be.ok

    it 'should not have 0 as member', ->
      set.match(0).should.not.be.ok

  describe 'multiple elements', ->

    set = new Set(1,2)

    it 'should have 1 as member', ->
      set.match(1).should.be.ok

    it 'should have 2 as member', ->
      set.match(2).should.be.ok

    it 'should not have 3 as member', ->
      set.match(3).should.not.be.ok

  describe 'union', ->

    s1 = new Set((x) -> x > 0)
    s2 = new Set((x) -> x < 0)

    c1 = new Set((x) -> 'A' < x.slice(0,1) < 'E')
    c2 = new Set((x) -> x is 'Ruben')

    it 'should contain elements of both', ->
      s1.union(s2)(1).should.be.ok
      s1.union(s2)(-1).should.be.ok

    it 'should contain element of both with strings', ->
      c1.union(c2)('Bartolomeo').should.be.ok
      c1.union(c2)('Ruben').should.be.ok

    it 'does not contain elements from outside the set', ->
      s1.union(s2)(0).should.not.be.ok
      c1.union(c2)('Noe').should.not.be.ok

  describe 'intersect', ->

    s1 = new Set((x) -> x >= -10)
    s2 = new Set((x) -> x <= 10)

    it 'should contain elements from the intersection', ->
      s1.intersect(s1)(0).should.be.ok

    it 'should not contain elements from outside the intersection', ->
      s1.intersect(s2)(-11).should.not.be.ok

  describe 'next', ->

    s = new Set(1,2,3).step((x) => x + 1)

    it 'should predict 2 from 1', ->
      s.next(1).should.equal 2

    it 'should return undefined at 3', ->
      should.not.exist(s.next(3))

  describe.skip 'map', ->

    s = new Set('Red','Blue','Green')

    it 'should map lower case colors after map', ->
      s1 = s.map((x) -> x.toLowerCase())
      s1.match('red').should.be.ok
