#!/bin/sh

set -e

echo "Authenticating into $INPUT_REGISTRY..."
echo $INPUT_PASSWORD | docker login $INPUT_REGISTRY -u $INPUT_USERNAME --password-stdin
echo "Building $INPUT_IMAGE..."
docker build -t $INPUT_IMAGE .
echo "Pushing $INPUT_IMAGE to $INPUT_REGISTRY..."
docker push $INPUT_REGISTRY/$INPUT_USERNAME/$INPUT_IMAGE