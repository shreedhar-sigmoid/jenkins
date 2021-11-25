#!/bin/bash

echo "*******************************"
echo "** Listing Image in registry **"
echo "*******************************"


cat "$GCR_CRED" > abc.json
docker login -u _json_key -p "$(cat abc.json)" https://gcr.io

gcloud container images list --repository=gcr.io/global-memento-332706

echo "*******************************"
echo "** Listing Pods in cluster ****"
echo "*******************************"



echo "***********************************"
echo "** Listing Deployment in cluster **"
echo "***********************************"

docker logout https://gcr.io


