

actor Main
  new create(env: Env) =>

    // printing an integer
    let foo: I64  = 1
    env.out.print(foo.string())

    // printing string
    let bar: String = "bingo"
    env.out.print(bar)

    // building string
    let baz: String = bar + " " + foo.string()
    env.out.print(baz)

    // done
    env.out.print("done")
