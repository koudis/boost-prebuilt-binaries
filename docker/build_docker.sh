#!/usr/bin/bash

set -e

IMAGE_NAME="$1"
DOCKER_FILE="$IMAGE_NAME/Dockerfile"

if [[ $IMAGE_NAME = "" ]]; then
	echo ""
	echo "Usage: build_docker.sh <image_name>"
	echo "\timage_name - name of the directory located inside docker directory"
	echo ""
	exit 1
fi

if ! [[ -f $DOCKER_FILE ]]; then
	echo "Docker file '$DOCKER_FILE' for $IMAGE_NAME does not exist" >&2
	exit 1
fi

cwd="$(pwd)"
script_dir=$(dirname $(realpath "$0"))
echo $cwd
echo $script_dir
if ! [[ $cwd = $script_dir ]]; then
	echo "Please run script in the caintaining directory!" >&2
	exit 1
fi

docker build -f $DOCKER_FILE --tag="$IMAGE_NAME" .
