//     root: (AmbientAuth val | None val)            # https://stdlib.ponylang.io/builtin-AmbientAuth/ 
//    input: InputStream tag                         # stdin
//      out: OutputStream tag                        # stdout
//      err: OutputStream tag                        # stderr
//     args: Array[String val] val                   # command line args
//     vars: Array[String val] val                   # environment vars
// exitcode: {(I32) val}                             #

actor Main
  new create(env: Env) =>
    for value in env.args.slice(1).values() do
      env.out.print(value)
    end

    for value in env.vars.slice(1).values() do
      env.out.print(value)
    end

    env.out.print("done")
