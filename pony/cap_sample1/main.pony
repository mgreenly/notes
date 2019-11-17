"""
"""
class Mob
  var _xpos: I64
  var _ypos: I64

  // by default this is a `ref` cap
  new create(xpos: I64, ypos: I64) =>
    _xpos = xpos
    _ypos = ypos

  fun ref move(x: I64, y: I64) =>                            // don't fully understand why this ref is neededG?
    _xpos = _xpos + x
    _ypos = _ypos + y

  fun fields(): (I64, I64) =>
    (_xpos, _ypos)


actor Other
  var main: Main
  var mob: Mob iso

  // if a class is going to be passed it must be iso as param and then
  // the param must be consumed to assign it to a field
  new create(main': Main, mob': Mob iso) =>
    main = main'
    mob = consume mob'

  be tick() =>
    mob.move(1,1)

  be report() =>
    (var x, var y) = mob.fields()
    var str = x.string() + ", " + y.string()
    main.say(str)


actor Main
  var env: Env

  new create(env': Env) =>
    // save env for later
    env = env'

    // by default a variable referencing a class will have `ref` cap
    var mob1: Mob = Mob.create(0, 0)
    // a ref cap can be turned into any other type of cap with recover
    var mob2: Mob iso = recover iso Mob.create(0, 0) end


    // this will not work
    // mob1 is `Mob ref` but Mob.create needs a `Mob iso`
    //
    //    var other = Other.create(mob1)

    // We can how ever create one in line if necessary and it's perfectly fine to send mob2 because
    var other1 = Other.create(this, recover iso Mob.create(0, 0) end)
    // This works because mob2 is alredy iso
    var other2 = Other.create(this, consume mob2)

    other1.report()
    other2.tick()
    other2.report()


  be say(message: String) =>
    env.out.print(message)
