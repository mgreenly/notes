#!/bin/sh

debian-rust cargo build --release --target-dir .debian-target
docker build -f Dockerfile -t mgreenly/hello-actix:$(cat version) .debian-target/release
