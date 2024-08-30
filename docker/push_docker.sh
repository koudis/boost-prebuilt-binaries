#!/usr/bin/bash

set -e

IMAGE_NAME="$1"

if [[ $IMAGE_NAME = "" ]]; then
	echo ""
	echo "Usage: push_docker.sh <image_name>"
	echo "\timage_name - name of the directory located inside docker directory"
	echo ""
	exit 1
fi

docker tag "$IMAGE_NAME" "koudis/boost-build:$IMAGE_NAME"
docker push "koudis/boost-build:$IMAGE_NAME"
