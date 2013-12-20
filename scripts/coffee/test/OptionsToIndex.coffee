require './_prepare'

OptionsToIndex = mod 'OptionsToIndex'

describe 'construcstor'

it "should work", ->

	new OptionsToIndex a: null

it "should throw if called without args", ->

	(-> new OptionsToIndex).should.throw()

describe 'situations'

it 'a: null, b:null - 1', ->

	o = new OptionsToIndex

		a: null

		b: null

	o.getIndex(a: yes, b: no).should.equal 1

it 'a: null, b:null - 2', ->

	o = new OptionsToIndex

		a: null

		b: null

	o.getIndex(a: yes, b: yes).should.equal 11

it 'a: null, b:null - 3', ->

	o = new OptionsToIndex

		a: null

		b: null

	o.getIndex(a: no, b: yes).should.equal 10

it 'a: null, b:null - 4', ->

	o = new OptionsToIndex

		a: null

		b: null

	o.getIndex(a: no).should.equal 0

it 'a: [1, 2, 3], b: null, c: [5, 6] - 1', ->

	o = new OptionsToIndex

		a: [1, 2, 3]

		b: null

		c: [5, 6]

	o.getIndex(a: no).should.equal 0

it 'a: [1, 2, 3], b: null, c: [5, 6] - 2', ->

	o = new OptionsToIndex

		a: [1, 2, 3]

		b: null

		c: [5, 6]

	o.getIndex(a: yes).should.equal 0

it 'a: [1, 2, 3], b: null, c: [5, 6] - 3', ->

	o = new OptionsToIndex

		a: [1, 2, 3]

		b: null

		c: [5, 6]

	o.getIndex(a: 3).should.equal 2

it 'a: [1, 2, 3], b: null, c: [5, 6] - 4', ->

	o = new OptionsToIndex

		a: [1, 2, 3]

		b: null

		c: [5, 6]

	o.getIndex(a: 3, b: yes).should.equal 12

it 'a: [1, 2, 3], b: null, c: [5, 6] - 5', ->

	o = new OptionsToIndex

		a: [1, 2, 3]

		b: null

		c: [5, 6]

	o.getIndex(a: 3, b: yes, c: 6).should.equal 112