

actor Main
  new create(env: Env) =>

    var s1: String = "Hello"                // define's a mutable variable
    let s2: String = "Hello"                // define's an immutable variable

    // In either case the name must start with a lower case letter
    // and the name is only valid in the scope it's defined in.

    var s3: String                          // You don't have to assign when declaring
    s3 = "Hello Again"                      // a var but you must assign before using it
                                            // You can't do this with let


    env.out.print("done")
