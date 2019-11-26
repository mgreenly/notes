# Pony

  * [website]( https://www.ponylang.io/)
  * [installation](https://github.com/ponylang/ponyc/blob/master/README.md#installation)
  * [pony-vim-syntax](https://github.com/dleonard0/pony-vim-syntax)
  * [videos](https://www.youtube.com/playlist?list=PLfHYba8zC7hQmDRUcYfJolL2WpUFO8XWC)
  * [stdlib](https://stdlib.ponylang.io/)
  * [pony cheat sheet](https://www.ponylang.io/media/cheatsheet/pony-cheat-sheet.pdf)
  * [playground](https://playground.ponylang.io/)
  * [c-ffi](https://avranju.gitbooks.io/pony-tutorial/c-ffi/calling-c.html)


## Installing on Debian

```
git clone https://github.com/ponylang/ponyc.git
git checkout tags/{{version}}
cd ponyc
make default_pic=true
sudo make install
```

### The language

Things I did in order.

  1. Figure out [hello-world](https://github.com/mgreenly/notes/blob/master/pony/hello/main.pony).
  1. Figure out [comments](https://github.com/mgreenly/notes/blob/master/pony/comments/main.pony).
  1. Figure out [variables](https://github.com/mgreenly/notes/blob/master/pony/variables/main.pony).
  1. Figure out [simple litteral types](https://github.com/mgreenly/notes/blob/master/pony/litterals/main.pony).
  1. Figure out [compound litteral types](https://github.com/mgreenly/notes/blob/master/pony/compound/main.pony).
  1. Figure out [printing/building simple strings](https://github.com/mgreenly/notes/blob/master/pony/printing/main.pony).
  1. Figure out [control](https://github.com/mgreenly/notes/blob/master/pony/control/main.pony)
  1. Figure out [variables](https://github.com/mgreenly/notes/blob/master/pony/variables/main.pony)
  1. Figure out [class](https://github.com/mgreenly/notes/blob/master/pony/class/main.pony).
  1. Figure out [methods](https://github.com/mgreenly/notes/blob/master/pony/methods/main.pony)
  1. Figure out [subtyping](https://github.com/mgreenly/notes/blob/master/pony/subtyping/main.pony)
  1. Figure out [type-expressions](https://github.com/mgreenly/notes/blob/master/pony/type-expressions/main.pony)

### Style

  variables seem to be snakecase
  classes/actors seem to be upper camel case
  seems to be 2space indent


### Reference Capabilities

```
with   read write send  alias          recover    consume
------------------------------------------------------
iso     +    +    +     tag            tag        tag, ref, trn
trn     +    +    -     tag, box       tag        tag, ref
ref     +    +    -     tag, box, ref  tag        tag
val     +    -    +     tag, box, val  tag, box   tag, box
box     +    -    -     tag, box       tag        tag
tag     -    -    +     tag            tag        tag
```


  1. use tag if you only need identity and may share it
  3. use val if it's immutable and may share it
  2. use box if you need an immutable alias to a mutable reference but will not share it
  5. use trn if you need to initialize it, then create immutable box alias and not share it
  4. use ref if you need to mutate it and never share it
  6. use iso if you need to mutate it and share it
