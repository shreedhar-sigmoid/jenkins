#!/bin/bash

echo "$GCR_CRED" > abc.json
docker login -u _json_key -p "$(cat abc.json)" https://gcr.io
gcloud container clusters get-credentials cluster-1 --zone us-central1-c
kubectl create -f deployment.yml
docker logout https://gcr.io

