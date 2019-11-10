

actor Main
  new create(env: Env) =>

    let a1: Array[I64] = [ 1; 2; 3]         // separated by ;

    env.out.print("done")
