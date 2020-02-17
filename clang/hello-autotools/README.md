# Hello Autotools

A minimal autotools hello world program


## Build and Install

```shell
./autogen.sh
./configure --prefix=$HOME/.local/opt
make install
```

## Release

```shell
$> ./autogen.sh && ./configure && make distcheck
```

## Clean Directory

```shell
git clean -fd
```
