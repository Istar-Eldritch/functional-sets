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
  constructor: (@e) ->
    if not (@e instanceof Function)
      @e = _.reduce arguments,(mem, elem) ->
        (x) -> mem(x,elem) or x is elem
       ,(x,e) -> x is e

  ###
    This function checks if the element x is member of this set.
    TODO: Feature to allow this function to check for subsets.
  ###
  match: (x) ->
    @e(x)

  ###
    Creates a second set resulting from the union of the two sets implied.
    The union set matches elements from both sets.
  ###
  union: (s) ->
    f = @e
    (x) -> f(x) or s.match(x)

  ###
    Creates a second set resulting from the intersection of the two sets implied.
    The new set matches elements that are members of both sets at same time.
  ###
  intersect: (s) ->
    f = @e
    (x) -> f(x) and s.match(x)
