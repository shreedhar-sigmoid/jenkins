#!/bin/bash

echo "********************************"
echo "** Listing Image in registry **"
echo "********************************"


cat "$GCR_CRED" > abc.json
docker login -u _json_key -p "$(cat abc.json)" https://gcr.io
gcloud container clusters get-credentials cluster-1 --zone us-central1-c
gcloud container images list --repository=gcr.io/global-memento-332706

echo "*******************************"
echo "** Listing Pods in cluster ****"
echo "*******************************"

kubectl get po


echo "***********************************"
echo "** Listing Deployment in cluster **"
echo "***********************************"

kubectl get deploy

docker logout https://gcr.io


