#!/bin/sh

docker run -it --rm -p 8080:8080 mgreenly/foo:$(cat version)
