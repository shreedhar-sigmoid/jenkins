#!/bin/bash

#copy python file
cp python/sample.py jenkins/build/

#Build images
docker-compose -f jenkins/build/docker-compose.yml build
