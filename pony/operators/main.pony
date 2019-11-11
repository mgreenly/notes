

actor Main
  new create(env: Env) =>

  // Any expression where more than one infix operator is used
  // must use parentheses to remove the ambiguity. If you fail
  // to do this the compiler will complain.

  // +	add()	Addition	
  // -	sub()	Subtraction	
  // *	mul()	Multiplication	
  // /	div()	Division	
  // %	rem()	Remainder	
  // %%	mod()	Modulo	Starting with version 0.26.1
  // <<	shl()	Left bit shift	
  // >>	shr()	Right bit shift	
  // and	op_and()	And, both bitwise and logical	
  // or	op_or()	Or, both bitwise and logical	
  // xor	op_xor()	Xor, both bitwise and logical	
  // ==	eq()	Equality	
  // !=	ne()	Non-equality	
  // <	lt()	Less than	
  // <=	le()	Less than or equal	
  // >=	ge()	Greater than or equal	
  // >	gt()	Greater than	
  // >~	gt_unsafe()	Unsafe greater than	
  // +~	add_unsafe()	Unsafe Addition	
  // -~	sub_unsafe()	Unsafe Subtraction	
  // *~	mul_unsafe()	Unsafe Multiplication	
  // /~	div_unsafe()	Unsafe Division	
  // %~	rem_unsafe()	Unsafe Remainder	
  // %%~	mod_unsafe()	Unsafe Modulo	Starting with version 0.26.1
  // <<~	shl_unsafe()	Unsafe left bit shift	
  // >>~	shr_unsafe()	Unsafe right bit shift	
  // ==~	eq_unsafe()	Unsafe equality	
  // !=~	ne_unsafe()	Unsafe non-equality	
  // <~	lt_unsafe()	Unsafe less than	
  // <=~	le_unsafe()	Unsafe less than or equal	
  // >=~	ge_unsafe()	Unsafe greater than or equal	
  // +?	add_partial()?	Partial Addition	
  // -?	sub_partial()?	Partial Subtraction	
  // *?	mul_partial()?	Partial Multiplication	
  // /?	div_partial()?	Partial Division	
  // %?	rem_partial()?	Partial Remainder	
  // %%?	mod_partial()?	Partial Modulo


  // unary operators
  // unary operators always bind stronger than any infix operators:

  // -	neg()	Arithmetic negation
  // not	op_not()	Not, both bitwise and logical
  // -~	neg_unsafe()	Unsafe arithmetic negation

    env.out.print("done")
