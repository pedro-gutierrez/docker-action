#!/bin/sh

set -e

echo "Authenticating into $INPUT_REGISTRY as $INPUT_USERNAME..."
echo $INPUT_PASSWORD | docker login $INPUT_REGISTRY -u $INPUT_USERNAME --password-stdin
FULL_IMAGE_TAG=$INPUT_REGISTRY/$INPUT_USERNAME/$INPUT_IMAGE:$INPUT_TAG
echo "Building $FULL_IMAGE_TAG..."
docker build -t $FULL_IMAGE_TAG .
echo "Pushing $FULL_IMAGE_TAG..."
docker push $FULL_IMAGE_TAG