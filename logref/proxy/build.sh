#!/bin/sh

docker build -t mgreenly/logref-proxy:$(cat version) .
