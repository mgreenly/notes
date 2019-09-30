#!/bin/sh

docker run -it --rm -p 8088:8088 mgreenly/foo-app:$(cat version)
