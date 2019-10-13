#!/bin/sh

docker build -t mgreenly/www:$(cat version) .
