#!/bin/bash

echo "*******************************"
echo "** Pushing Image to registry **"
echo "*******************************"

echo "******* Tagging Image *********"

docker tag jenkins-assignment:v1 gcr.io/global-memento-332706/jenkins-assignment:v1

cat "$GCR_CRED" > abc.json
docker login -u _json_key -p "$(cat abc.json)" https://gcr.io
docker push gcr.io/global-memento-332706/jenkins-assignment:v1
docker logout https://gcr.io

echo "******************************"
echo "** Image pushed to registry **"
echo "******************************"
