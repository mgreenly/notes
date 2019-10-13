#!/bin/sh

docker build -t mgreenly/proxy:$(cat version) .
