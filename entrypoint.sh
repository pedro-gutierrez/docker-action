#!/bin/sh

set -e

REGISTRY=docker.pkg.github.com
IMAGE_TAG=$REGISTRY/$GITHUB_REPOSITORY_OWNER/$GITHUB_REPOSITORY/$GITHUB_REPOSITORY:$INPUT_TAG

echo "Authenticating into $INPUT_REGISTRY as $GITHUB_REPOSITORY_OWNER..."
echo $INPUT_PASSWORD | docker login $REGISTRY -u $GITHUB_REPOSITORY_OWNER -password-stdin
echo "Building $IMAGE_TAG..."
docker build -t $IMAGE_TAG .
echo "Pushing $IMAGE_TAG..."
docker push $IMAGE_TAG