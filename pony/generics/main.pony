"""
  the syntax is

       name: constrataint referenceCapability

       A: Any val

             name is: A
       constraint is: Any
           refcap is: val


       The constraint is a type expression or 'Any' for anything.

       refcap is any specific cap or one of the generic caps

       generic    specific
       ----------------------
       #read      ref, val box
       #send      iso, val tag
       #share     val tag, 
       #any       iso, trn, ref, val, box, tag
       #alias     ref, val, box, tag

"""
class Foo[T: Any val]
  var _value: T
  new create(_value': T) => _value = _value'
  fun get(): T => _value
  fun ref set(_value': T): T => _value = _value'


actor Main
  new create(env: Env) =>
    let x = Foo[String]("Bingo")
    env.out.print("done")
