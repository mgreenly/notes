actor Person
  var env: Env

  new create(env': Env) =>
    env = env'

  be greet(count: String) =>
    env.out.print("nm count: " + count)

actor Main
  new create(env: Env) =>
    var nm: Person = Person.create(env)
    var i: I64 = 0
    while i < 100 do
      nm.greet(i.string())
      i = i + 1
    end
