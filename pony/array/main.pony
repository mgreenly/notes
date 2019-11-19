

actor Main
  new create(env: Env) =>
    let ary1 = [ "foo"; "bar" ]                        // implicit homogeneous array
    let ary2: Array[String] ref = [ "foo"; "bar" ]     // explicit homogeneous array
    let ary3 = [ U64(42); "foo" ]                      // implicit union type array
    let ary4: Array[(U64|String)] ref = [ 42; "foo" ]  // explicit union type array
    let ary5: Array[String] val = [ "foo"; "bar" ]     // immutable array
    let ary6 = [ as Stringable: "foo"; "bar" ]         // coerce literal array's type

    // when you construct the array it creates new references to the elements
    // of that array.  That means the elements need to be of a type that can
    // have new references created, ref or val.

    try
      env.out.print(ary1(0)?)                          // you reference an array with: array(index)
      env.out.print(ary1(1)?)                          // it's zero based and may fail so must be in try
    end

    // push()
    // pop()
    // update()
    // insert()
    // delete()

    env.out.print("----")

    for name in ary1.values() do
      env.out.print(name)
    end

    env.out.print("done")
