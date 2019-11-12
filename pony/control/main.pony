//
// if `condition` then        # conditions must always evaluate to a Bool
// elseif `condition` then
// else
// end
//
// while `condition` do
// else                       # the else clause executes if the condition is never true
// end
//
// for `thing` in `iterator`
// else
// end
//
// repeat
// else
// until condition end
//
// break                      # exits the inner most loop

// continue                   # skips to next iteration of the loop.  If the current iteration
//                            # is the last iteration of the loop it will execute the else clause
//                            # if one exists.




actor Main
  new create(env: Env) =>

    var i: I64 = 42

    if false then                          // the condition must always evaluate to Bool
      env.out.print("can't get here")      // the keyword then must follow the condition
    else
      env.out.print("but I will get here")
    end

    if i > 10 then                       // the condition must always evaluate to Bool
      env.out.print("i > 10")
    end

    if i < 2 then                       // elseif is supported
      env.out.print("i < 2")
    elseif i == 2 then
      env.out.print("i == 2")
    elseif i > 2 then
      env.out.print("i > 2")
    end

    let i2: I64 = if i == 42 then 1 else 2 end         // contiditons are expressions that return values


    var x1: (String | Bool) =                           // if the then and else return different types 
      if true then                                 // the result is a union type
        "Hello"
      else
        false
      end

    var x2: (String | None) =                           // if you don't have an else then it's a union type
      if false  then                                 // with None
        "Hello"
      end

    env.out.print("done")
