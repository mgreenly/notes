

actor Main
  new create(env: Env) =>

    let b1 = true
    let b2 = false
    let b3: Bool = true
    let b4: Bool = false

    // unsigned integer values
    let uval1: U8 = 0
    let uval2: U16 = 0
    let uval3: U32 = 0
    let uval4: U64 = 0
    let uval5: U128 = 0
    let uval6: USize = 0
    let uval7: ULong = 0

    // signed integer values
    let ival1: I8 = 0
    let ival2: I16 = 0
    let ival3: I32 = 0
    let ival4: I64 = 0
    let ival5: I128 = 0
    let ival6: ISize = 0
    let ival7: ILong = 0

    // floating point values
    let fval1: F32 = 0.0
    let fval2: F64 = 0.0

    // characters
    let c1: U8 = 'A'
    let c2: U8 = '\x41'
    let c3: U32 = 'A'
    let c4: U64 = 'ABCD' // 0x41424344

    // strings
    let s1 = "hello"
    let s2 = "example of: '\x41' 2 digit unicode"
    let s3 = "example of: '\u019B' 4 digit unicode"
    let s4 = "example of: '\U00019B' 6 digit unicode"

    let s5 = """
             this is a
             multiline
             string
             """

    // escape sequences: \a, \b, \e, \f, \n, \r, \t, \v, \\, \0, \"

    env.out.print(s1)
    env.out.print(s2)
    env.out.print(s3)
    env.out.print(s4)
    env.out.print(s5)
    env.out.write(s5)


    

    env.out.print("done")
