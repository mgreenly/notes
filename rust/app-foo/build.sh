#!/bin/sh

debian-rust cargo build --release --target-dir .debian-target
docker build --no-cache -f Dockerfile -t mgreenly/foo:$(cat version) .debian-target/release
