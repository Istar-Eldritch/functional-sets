# functional-sets
A implementation of mathematical sets the functional way using CoffeeScript

[![Build Status](https://drone.io/github.com/Istar-Eldritch/functional-sets/status.png)](https://drone.io/github.com/Istar-Eldritch/functional-sets/latest)

[CoffeeScript version of the documentation](README.md)

- [Creating Sets](#creating-sets)
  - [Extensional definition](#extensional-definition)
  - [Intensional definition](#intensional-definition)
- [Working With Sets](#working-with-sets)
  - [Union](#union)
  - [Intersection](#intersection)
  - [Disjoint](#disjoint)
  - [Chaining](#chaining)
- [TODO](#todo)

---
## Creating sets.

### Extensional definition

`The number one, two and three {1,2,3}`

To create a set of this type just create a new instance of the set and pass the
elements as parameters of it's constructor.

```js
var f3 = new Set(1,2,3);
```


### Intensional definition
`All natural numbers or ℕ`

You can currently create a set of elements by creating a set with a function that
gets an element as parameter and returns a boolean. This function will be used to
check the membership of the element to the set.

```js
var N = new Set(function(x){
  return x > 0;
});
```

---

## Working with sets

### Union

The union of two sets returns a second set which elements are all the members that
are contained in the sets involved in it's creation.

```js
var odd = new Set(function(x){
  return x % 2 !== 0;
});
var one = new Set(1);
var u = odd.union(one);

u.match(1) // this is true
u.match(2) // this is true
u.match(3) // this is false
```

### Intersection

The intersection return a set that holds as members the elements that are members
of both involved in it's creation.

```js
var odd = new Set(function(x){
  return x % 2 !== 0;
  });
var onetwo = new Set(1,2);
var i = odd.intersect(onetwo);

i.match(1) // this is true
i.match(2) // this is true
i.match(3) // this is false
i.match(4) // this is false
```

### Disjoint
The disjoint is a difference operator, [A - B] Returns a new set that contains
all elements in a but not in B.

```js
var odd = new Set(function(x){
  return x % 2 !== 0;
});
var two = new Set(2);
var d = odd.disjoint(onetwo);

d.match(4) // this is true
d.match(2) // this is false
```


### Chaining

Sets are intended as inmutable objects. That's the reason every funciton over sets
returns a new set in response. This allows for easy chaining.

```js
s = new Set(1).union(new Set(2)).intersect(new Set(3))
```

This is just an example, but you get the point.

---
Note that we are using numeric types here, but you can use whatever thing you want. Even
complex objects. :bowtie:

---

## TODO

- Set mapping
- Set limits
- Other set operations. (disjoint, relative complement)
