"""
"""
class Mob
  var xpos: I64
  var ypos: I64

  // by default this is a `ref` cap
  new create(xpos': I64, ypos': I64) =>
    xpos = xpos'
    ypos = ypos'

  fun ref move(x: I64, y: I64): None =>                        // don't fully understand why this ref is needed but
    xpos = xpos + x                                            // but seems that you need to mark methods that change
    ypos = ypos + y                                            // fields, at least when those fields are vals

  fun freeze(): Mob val =>                                     // this returns an immutable copy
    recover val Mob.create(xpos, ypos) end



actor Engine
  var main: Main
  var mob: Mob

  // if a class is going to be passed it must be iso as param and then
  // the param must be consumed to assign it to a field.  The field it's
  // assigned to can be any cap, in this case ref
  new create(main': Main, mob': Mob iso) =>
    main = main'
    mob = consume mob'

  // we have a ref copy of mob so we can manipulate it how ever we want
  be tick() =>
    mob.move(1,1)
    main.render(mob.freeze())



actor Main
  var env: Env

  new create(env': Env) =>
    // save env for later
    env = env'

    // by default a variable referencing a class will have `ref` cap
    var mob1: Mob = Mob.create(0, 0)
    // a ref cap can be turned into any engine type of cap with recover
    var mob2: Mob iso = recover iso Mob.create(0, 0) end


    // this will not work
    // mob1 is `Mob ref` but Mob.create needs a `Mob iso`
    //
    //    var engine = Engine.create(mob1)

    // This works because mob2 is iso
    var engine2 = Engine.create(this, consume mob2)

    engine2.tick()
    engine2.tick()
    engine2.tick()
    engine2.tick()

  // render receives read only val copies of mobs to output
  be render(mob: Mob val) =>
    env.out.print(mob.xpos.string() + ", " + mob.ypos.string())
