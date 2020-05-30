#!/bin/sh

docker run -it --rm -p 8080:8080 mgreenly/logref-api:$(cat version)
