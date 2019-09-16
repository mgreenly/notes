#!/bin/sh

debian-ruby bundle package --all && debian-ruby bundle install --deployment
