

actor Main
  new create(env: Env) =>

    // single line comment

    /*
       multiline comment 
    */

    "unassigned string litterals also seem to be comments"

    """
    including multiline ones
    """


    env.out.print("done")
