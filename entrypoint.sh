#!/bin/sh

set -e

REGISTRY=docker.pkg.github.com
REPO_OWNER=`echo $GITHUB_REPOSITORY | cut -d'/' -f1`
REPO_NAME=`echo $GITHUB_REPOSITORY | cut -d'/' -f2`
IMAGE_TAG=$REGISTRY/$REPO_OWNER/$REPO_NAME/$REPO_NAME:$INPUT_TAG

echo "Authenticating into $REGISTRY as $REPO_OWNER..."
echo $INPUT_PASSWORD | docker login $REGISTRY -u $REPO_OWNER --password-stdin
echo "Building $IMAGE_TAG..."
docker build -t $IMAGE_TAG .
echo "Pushing $IMAGE_TAG..."
docker push $IMAGE_TAG