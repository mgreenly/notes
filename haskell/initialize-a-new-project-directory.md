# Initailize A Haskell Project

Use cabal to initialize the directory
```console
mkdir hello-world
cd helloworld
cabal init \
  --non-interactive \
  --minimal \
  --license MIT \
  --simple \
  --package-name hello-world
```

## Build and run it

Lets build and run it.
```
cabal new-build
cabal new-run hello-world

#> Hello, Haskell!
```

## Init Git

Lets initialize the git repository and add a .gitignore
```
cat << EOF > .gitignore
/dist-newstyle
/.ghc.environment.x86_64-linux-8.6.5
EOF

git init
```

## Locate the Binary

One of the first things I always do is figure out how to distribute the application.

In this case I just search the `dist` directory for any executable files
```console
find dist-newstyle/ -executable -type f
```

## check dependencies

Now that I've located the executable I want to know what shared library dependencies it has.

Here I use the `ldd` command to list the shared libraries and the `dpkg` command to tell me what debian package will install them.
```bash
dpkg -S $(ldd $(find dist-newstyle/ -executable -type f) | tr -s ' ' | cut -d ' ' -f 3) | cut -d ' ' -f 1 | sort | uniq | cut -d ':' -f 1

#> libc6
#> libgmp10
```

It appears we only have two dependencies, `libc6` and `libgmp10`.

The first should exist on every system, pretty much nothing can run without it.

The latter, `libgmp10` is an arbitrary percision number library that may need to be installed on target systems.


LINKS
=====

  * https://jpvillaisaza.co/2017/03/14/minimal-cabal-files/
  * https://haskell-at-work.com/episodes/2018-05-13-introduction-to-cabal.html
  * http://gelisam.blogspot.com/2014/12/how-to-package-up-binaries-for.html

