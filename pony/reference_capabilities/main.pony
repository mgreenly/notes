"""

  +--------------------------------------------
  | cap            | this   | same   | other  |
  +--------------------------------------------
  | iso            | +r/+w  | -r/-w  | -r/-w  |  *default mutable
  +--------------------------------------------
  | trn            | +r/+w  | +r/-w  | -r/-w  |
  +--------------------------------------------
  | ref            | +r/+w  | +r/+w  | -r/-w  |
  +--------------------------------------------
  | val            | +r/-w  | +r/-w  | +r/-w  |  *default immutable
  +--------------------------------------------
  | box            | +r/-w  | +r/+w  | +r/-w  |
  +--------------------------------------------
  | tag            | -r/-w  | -r/-w  | -r/-w  |
  +--------------------------------------------


  var b: Foo iso = consume a

    the var `a` is not usable after that line.


  recover val `expresssions` end

    can turn a mutable ref cap into any ref camp; iso, trn, ref can become anything.
    can turn an immutable ref cap into an immutable or opaque ref cap; val or box can become val, box, or tag.

    Inside the recover expression, your code only has access to sendable values from the enclosing
    lexical scope; iso, val and tag.


  iso = references to isolated data structures.  No other variable can access the data from any actor even the one that created it.
  val = immutagble data structures - does this only apply to structs?

  ref = reference, a read/write reference to data.  Multiple variables can point to it.  You can't share with other threads.
  box = reference to data you can only read
  trn = transition - data you want to write to while also holding box variables to them

  tag = can't read or write the data but you can store and compare them


  MUTABLE

    ISO
    TRN   - no other variables can be used by any actor to write to this but the same actor can use other variables to read it.
    REF   - no other variables can be used by aother actors to read or write to this object.  The same actor can read and write.

  IMMUTABLE

    val and box are immutable reference caps.  They allow reading the data but not writing to it.

  OPAQUE

    Only `tag` is opaque.  You can neither read nor write.


  val and box are immutable refernce caps.  They can read the data but not write to it.


  An actor constructor always returns `tag`.  Makes sense the only thing you can do to it is send it a message.



  var foo: String val = "Hello"                                   # val is the default type for string





"""
actor Main
  new create(env: Env) =>
    env.out.print("done")
