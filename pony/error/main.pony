"""

  `error` raises an error

  a method that raises an error must be marked as partial with '?'

  class constructors and methods can be partial

  actor constructors and behaviors can not be partial


  The `then` section is like ruby's `ensure`.  When no error occurs
  `then` is executed after the last line of `try`.  When an error does
  occur `then` is executed after the last line of `else`.

  try
    // code
  else
    // code
  then
    // code
  end


"""
actor Main
  new create(env: Env) =>
    var x: I64
    x = try
      zero()?
    else
      3
    end
    env.out.print(x.string())

    var y: Stringable
    y = try
      zero()?
    end
    env.out.print(y.string())


      

  fun zero(): I64 ? =>
    if true then error end
    0
