"""
  https://pzel.name/til/2019/04/06/Uses-for-traits-vs-type-aliases-in-Ponylang.html

  SUBTYPING

    * nominal         - provided by traits
    * structural      - provided by interfaces


  TRAITS

    must declare it's self as a thing to have that trait

  INTERFACE

    Just has to have the methods to belong to an interface

"""

trait Named
  fun name(): String => "undefined"

interface Ranked
  fun rank(): U64


class Person is (Named & Ranked)
  let fName: String
  let lName: String
  var score: U64

  new create(fName': String, lName': String) =>
    fName = fName'
    lName = lName'
    score = 0

  fun name(): String =>
    fName + " " + lName

  fun rank(): U64 =>
    score

actor Main
  new create(env: Env) =>
    let p1: Person = Person("Fred", "Johnson")
    env.out.print(p1.name())
