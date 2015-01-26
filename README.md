# functional-sets
A implementation of mathematical sets the functional way using CoffeeScript

[![Build Status](https://drone.io/github.com/Istar-Eldritch/functional-sets/status.png)](https://drone.io/github.com/Istar-Eldritch/functional-sets/latest)

---
## Creating sets.

### Extensional definition

`The number one, two and three {1,2,3}`

To create a set of this type just create a new instance of the set and pass the
elements as parameters of it's constructor.

CS:
```
f3 = new Set 1,2,3
```

JS:
```
var f3 = new Set(1,2,3);
```


### Intensional definition
`All natural numbers or ℕ`

You can currently create a set of elements by creating a set with a function that
gets an element as parameter and returns a boolean. This function will be used to
check the membership of the element to the set.

CS:
```
N = new Set (x) -> x > 0
```

JS:
```
var N = new Set(function(x){
  return x > 0;
});
```

---

## Working with sets

### Union

The union of two sets returns a second set which elements are all the members that
are contained in the sets involved in it's creation.

CS:
```
odd = new Set (x) -> x % 2 != 0
one = new Set 1
u = odd.union one

u.match 1 # this is true
u.match 2 # this is true
u.match 3 # this is false
```

JS:
```
var odd = new Set(function(x){
  return x % 2 !== 0;
});
var one = new Set(1);
var u = odd.union(one);

u.match(1) # this is true
u.match(2) # this is true
u.match(3) # this is false
```

### Intersection

The intersection return a set that holds as members the elements that are members
of both involved in it's creation.

CS:
```
odd = new Set (x) -> x % 2 != 0
onetwo = new Set 1,2
u = odd.intersect onetwo

i.match 1 # this is true
i.match 2 # this is true
i.match 3 # this is false
i.match 4 # this is false
```

JS:
```
var odd = new Set(function(x){
  return x % 2 !== 0;
  });
var onetwo = new Set(1,2);
var i = odd.intersect(onetwo);

i.match(1) # this is true
i.match(2) # this is true
i.match(3) # this is false
i.match(4) # this is false
```
---
Note that we are using numeric types here, but you can use whatever thing you want. Even
complex objects. :bowtie:
