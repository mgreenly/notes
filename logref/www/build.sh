#!/bin/sh

docker build -t mgreenly/logref-www:$(cat version) .
