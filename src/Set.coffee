_ = require 'underscore'

module.exports =
  class Set extends Function

    @one: (e) -> (x) -> e is x

    @empty: -> false

    @union: (s1, s2) -> (x) -> s1(x) or s2(x)

    @intersect: (s1, s2) -> (x) -> s1(x) and s2(x)
