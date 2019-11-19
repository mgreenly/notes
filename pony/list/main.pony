use "collections"


actor Main
  new create(env: Env) =>

    // create empty list
    let list1 = List[String]()

    list1.push("A single String")

    env.out.print("A new empty list has " + list1.size().string() + " nodes.") // 0

    env.out.print("done")
