#!/bin/bash

docker tag jenkins-assignment:v1 gcr.io/global-memento-332706/jenkins-assignment:v1
echo "$GCR_CRED" > abc.json
docker login -u _json_key -p "$(cat abc.json)" https://gcr.io
docker push gcr.io/global-memento-332706/jenkins-assignment:v1
docker logout https://gcr.io
