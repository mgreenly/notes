"""

  methods can have 0 or more params
  methods can have 0 or 1 return values

  methods with no params still have () in def


      fun name(var-name: var-type,...): return-type =>
        BODY


  notice there's no end



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
