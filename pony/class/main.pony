
class Person
  let fName: String           // fields of the class must appear before methods
  let lName: String
  var score: U64

  new create(fName': String, lName': String) =>
    fName = fName'
    lName = lName'
    score = 0

  fun greeting(other: String) =>


actor Main
  new create(env: Env) =>
    let person: Person = Person("Fred", "Johnson")
    env.out.print("done")
