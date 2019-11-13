""" 
  methods can have 0 or more params
  methods can have 0 or 1 return values

  HOWTO DEFINE METHODS

  fun f() =>                                              # no args returns None
    {{BODY}}

  fun g(foo: Foo, bar: Bar, baz: Baz) Qux =>              # positional args
    {{BODY}}

  fun h(foo: Foo, bar: Bar = 0, baz: Baz = 0) Qux =>      # named with default args
    {{BODY}}


  HOWTO CALL METHODS

  f()                                                     # parens always required
  g(0, 1, 2)                                              # positional args (foo=0, bar=1, baz=2)
  h(0, 1)                                                 # positional with defaults (foo=0, bar=1, baz=0)
  h(where foo = 1, bar = 2, baz = 3)                      # named arguments; (foo=1, bar=2, baz=3)
  h(1, where bar = 3)                                     # you can mix them all; (foo=1, bar=3, baz=0)

"""
class Person
  let fName: String
  let lName: String
  var score: U64

  new create(fName': String, lName': String) =>
    fName = fName'
    lName = lName'
    score = 0

  fun greeting(): String =>
    "Hello, I'm " + fName + " " + lName + "."


actor Main
  new create(env: Env) =>
    let person: Person = Person("Fred", "Johnson")
    env.out.print(person.greeting())
    env.out.print("done")
