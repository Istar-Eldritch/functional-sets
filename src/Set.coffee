_ = require 'underscore'

###
  A implementation of mathematical sets the functional way.

  @Auhor: Ruben Paz (Istar-Eldritch)
###
module.exports = class Set

  ###
    The constructor of a set takes an element that might be a whatever amount of
    literals.
    If the element is a function it has to take an element of the set and return
    a boolean if the set contains the element.
    (x):Boolean -> f(x)
  ###
  constructor: (@match) ->
    if not (@match instanceof Function)
      @match = _.reduce arguments,(mem, elem) ->
        (x) -> mem(x,elem) or x is elem
       ,(x,e) -> x is e

  ###
    @match
    This function checks if the element x is member of this set.
    TODO: Feature to allow this function to check for subsets.
  ###

  ###
    Creates a second set resulting from the union of the two sets implied.
    The union set matches elements from both sets.
  ###
  union: (s) ->
    f = @match
    (x) -> f(x) or s.match(x)

  ###
    Creates a second set resulting from the intersection of the two sets implied.
    The new set matches elements that are members of both sets at same time.
  ###
  intersect: (s) ->
    f = @match
    (x) -> f(x) and s.match(x)

  ###
    Returns a set which step is the function given.
    The parameter should be a function that calculates the next element given the
    previous element. This is useful in predictable algorithms.
  ###
  step: (n) ->
    f = @match
    @next = (x) ->
      r = n(x)
      return if f(r) then r else undefined
    return this
