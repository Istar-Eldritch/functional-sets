chai = require 'chai'
chai.should()
expect = chai.expect
Set = require '../src/Set'

describe 'Set', ->

	describe 'one', ->

		set = undefined

		before ->
			set = Set.one(1)

		it 'should construct a set', ->
			should.exist set

		it 'should hold 1', ->
			set(1).should.be.ok
			set(0).should.be.not.ok

	describe 'union', ->

		s1 = (x) -> x > 0
		s2 = (x) -> x < 0

		c1 = (e) -> 'A' < e.slice(0,1) < 'E'
		c2 = (e) -> e is 'Ruben'

		it 'should contain elements of both', ->
			Set.union(s1, s2)(1).should.be.ok
			Set.union(s1, s2)(-1).should.be.ok

		it 'should contain element of both with strings', ->
			Set.union(c1, c2)('Bartolomeo').should.be.ok
			Set.union(c2, s2)(-1).should.be.ok

		it 'does not contain elements from outside the set', ->
			Set.union(s1, s2)(0).should.not.be.ok
			Set.union(c1, c2)('Noe').should.not.be.ok

	describe 'intersect', ->

		s1 = (x) -> x >= -10
		s2 = (x) -> x <= 10

		it 'should contain elements from the intersection', ->
			Set.intersect(s1,s2)(0).should.be.ok

		it 'should not contain elements from outside the intersection', ->
			Set.intersect(s1, s2)(-11).should.be.not.ok 