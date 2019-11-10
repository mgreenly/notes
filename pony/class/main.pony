
class Person
  let fName: String
  let lName: String
  var score: U64

  new create(fName': String, lName': String) =>
    fName = fName'
    lName = lName'
    score = 0


actor Main
  new create(env: Env) =>
    let person: Person = Person("Fred", "Johnson")
    env.out.print("done")
