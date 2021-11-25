#!/bin/bash

echo "********************"
echo "** Building Image **"
echo "********************"

#copy python file
cp python/sample.py jenkins/build/

#Build images
docker-compose -f jenkins/build/docker-compose.yml build


echo "**********************"
echo "** Image build done **"
echo "**********************"




