#!/bin/bash

echo "**************************"
echo "** Deploying to cluster **"
echo "**************************"

cat "$GCR_CRED" > abc.json
docker login -u _json_key -p "$(cat abc.json)" https://gcr.io
gcloud container clusters get-credentials cluster-1 --zone us-central1-c
kubectl create -f jenkins/deploy/deployment.yml -f jenkins/deploy/service.yml
docker logout https://gcr.io

echo "***************************"
echo "** successfully deployed **"
echo "***************************"

