https://www.fpcomplete.com/blog/2017/01/green-threads-are-like-garbage-collection


what does it mean for go's memory management to be value oriented instead of reference oriented?
    
    * it means you can control the shape of a structure in memory
    * this should help with ffi to c
    * allows interior pointers ? but what good is that?
    ? can this be done with Boehm GC? seems like it is possible





rust

  async fn           <- this returns a future.  it's suspended when you create it and you have to
                     <- call await to get the value.  interestingly they call await inside the
                     <- function

  await future


  async / yield / await


