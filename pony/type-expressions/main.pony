"""

  TUPLES

    var x: (String, U64) = ("hi", 100)                       # create it

    (var s, var i) = x                                       # destructure it

    x._1                                                     # direct acess
    x._2

    x = ("bingo", x._2)                                      # can't change so copy/modify


  UNIONS

    var x: (String | None) = None


  INTERSECTIONS

    var x: (Fooable & Barable)

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
