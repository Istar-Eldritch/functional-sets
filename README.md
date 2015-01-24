# functional-sets
A implementation of mathematical sets the functional way using CoffeeScript
![Codeship CI](https://codeship.com/projects/d409d640-85bc-0132-9d5b-76a8aba63565/status?branch=master)
---
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
Note that we are using numeric types here, but you can use whatever thing you want. Even
complex objects. :bowtie:
