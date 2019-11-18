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

  // if a class is passed as a parameter it must be iso but we can consume an iso and turn it
  // into anything.  In this case we consume it and turn it into a ref.  Inside of this actor
  // we have a ref cap for mob and can do anything we want with it.
  new create(main': Main, mob': Mob iso) =>
    main = main'
    mob = consume mob'

  be tick() =>
    mob.move(1,1)
    main.render(mob.freeze())



actor Main
  var env: Env

  new create(env': Env) =>
    // save env for later
    env = env'

    // by default a variable referencing a class will have `ref` cap.
    // So this will not work.  We need an iso cap mob to use as a 
    // param
    //
    //     var mob1: Mob = Mob.create(0, 0)
    //     var engine = Engine.create(mob1)
    //


    // a ref cap can be turned into any cap with recover.  Since
    // Mob.create returns a ref cap we use recover to turn that
    // into iso then use it as a param
    var mob2: Mob iso = recover iso Mob.create(0, 0) end

    var engine = Engine.create(this, consume mob2)

    engine.tick()
    engine.tick()
    engine.tick()
    engine.tick()

  // render receives read only val copies of mobs to output
  be render(mob: Mob val) =>
    env.out.print(mob.xpos.string() + ", " + mob.ypos.string())
