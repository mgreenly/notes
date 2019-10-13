#!/bin/sh

docker run -it --rm -p 8080:80 mgreenly/proxy:$(cat version)
